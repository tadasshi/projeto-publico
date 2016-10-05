class User::InstitutionPaymentController < ApplicationController
  def self.controller_path
    'users/institution_payment'
  end

  def new
    # redirect_to edit_user_institution_path @institution
  end

  def create
  end
end
