class BankAccountsController < ApplicationController
  layout 'admin'

  before_action :admin_logged_in_user
  before_action :admin_correct_user, only:[:destroy,:update,:edit]

  def edit

  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = admin_current_user.bank_accounts.build(bank_params)
    if @bank_account.save
      flash[:success] = "Bank account created"
      redirect_to admin_payment_url
    else
      render 'new'
    end
  end

  def update
    if @bank_account.update_attributes(bank_params)
      flash[:success] = "Bank account updated"
      redirect_to admin_payment_url
    else
      render 'edit'
    end
  end

  def destroy
    BankAccount.find(params[:id]).destroy
    flash[:success] = "Bank account Deleted"
    redirect_to admin_payment_url
  end

  private

  def bank_params
    params.require(:bank_account).permit(:name,:owner_account_name,:number,:bank_name)
  end

  def admin_correct_user
    @bank_account = admin_current_user.bank_accounts.find_by(id: params[:id])
    redirect_to admin_payment_url if @bank_account.nil?
  end

end
