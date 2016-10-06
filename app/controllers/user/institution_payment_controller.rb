class User::InstitutionPaymentController < ApplicationController
  def self.controller_path
    'users/institution_payment'
  end

  def newone
    @batata = Institution.fin
  end

  def ipn_notify

    @api = PayPal::SDK::ButtonManager.new
    if @api.ipn_valid?(request.raw_post)

      InstitutionPaymentNotification.create!(
          :params         => params,
          :invoice        => params[:invoice],
          :status         => params[:payment_status],
          :transaction_id => params[:txn_id]
      )

      logger.info("IPN message: VERIFIED")
      render :text => "VERIFIED"
    else
      logger.info("IPN message: INVALID")
      render :text => "INVALID"
    end
  end

  def new
    @institution_payment = InstitutionPayment.new(institution_id: params[:id])
  end

  def create
    @institution         = Institution.find(params[:institution_payment][:institution_id])
    @institution_payment = InstitutionPayment.create(institution_payment_params)

    if @institution_payment.save
      @api              = PayPal::SDK::ButtonManager::API.new
      @bm_create_button = @api.build_bm_create_button(
          {
              :ButtonType    => "SUBSCRIBE",
              :ButtonCode    => "CLEARTEXT",
              :ButtonVar     => [
                  "item_name=Instituições(3 meses)",
                  "return=#{edit_user_institution_url(@institution)}",
                  "notify_url=#{user_institution_payment_ipn_notify_url}",
                  "shopping_url=",
                  "invoice=#{@institution_payment.id}",
                  "country=BR",
                  "currency_code=BRL",
                  "src=1",
                  "t3=D",
                  "p3=90",
                  "a3=44.99"
              ],
              :OptionDetails => [
                  {
                      :OptionSelectionDetails => [
                          {
                              :PaymentPeriod => [{
                                                     :BillingPeriod => "NoBillingPeriodType"}
                              ]
                          }
                      ]
                  }
              ]})

      @bm_create_button_response = @api.bm_create_button(@bm_create_button)

      if @bm_create_button_response.success?
        @bm_create_button_response.Website
        @bm_create_button_response.Email
        @bm_create_button_response.Mobile
        @bm_create_button_response.HostedButtonID

        redirect_to @bm_create_button_response.Email
      else
        render :text => "Erro(2)"
        @bm_create_button_response.Errors
      end
    else
      render :text => "Erro(1)"
    end

  end

  private
  def institution_payment_params
    params.require(:institution_payment).permit(:institution_id)
  end
end
