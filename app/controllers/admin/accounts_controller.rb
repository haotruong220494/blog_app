class Admin::AccountsController < Admin::BaseController
  def index
    @q = Account.ransack params[:q]
    @accounts = @q.result.page(params[:page]).per(Settings.per_page.default)
  end

  def destroy
    Account.find_by_id(params[:id].delete("^0-9").to_i).destroy
    flash[:success] = "Delete category Success."
    redirect_to admin_accounts_path
  end
end
