class ChargeController < ApplicationController
  def index


    @api = PayPal::SDK::ButtonManager::API.new

# Build request object
    @bm_create_button = @api.build_bm_create_button(
        {
            :ButtonType => "SUBSCRIBE",
            :ButtonCode => "CLEARTEXT",
            :ButtonVar => ["item_name=Instituições(3 meses)",
                           "amount=254",
                           "return=https://paypal-sdk-samples.herokuapp.com/button_manager/bm_create_button",
                           "notify_url=https://paypal-sdk-samples.herokuapp.com/button_manager/ipn_notify",
                           "shopping_url=",
                           "min_amount=254",
                           "subtotal=254",
                           "custom=65451851",
                           "country=BR",
                           "currency_code=BRL",
                           "src=1",
                           "t3=D",
                           "p3=90",
                           "a3=44.99"],
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
            ]
        }
    )

    # Make API call & get response
    @bm_create_button_response = @api.bm_create_button(@bm_create_button)

    # Access Response
    if @bm_create_button_response.success?
      @bm_create_button_response.Website
      @bm_create_button_response.Email
      @bm_create_button_response.Mobile
      @bm_create_button_response.HostedButtonID

      redirect_to @bm_create_button_response.Website
    else
      @bm_create_button_response.Errors
    end
  end

  def detail

  end
end
