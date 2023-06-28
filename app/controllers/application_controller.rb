class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      rooms_search_result_path
    end
    def after_sign_out_path_for(resource_or_scope)
      rooms_top_path
    end


    protect_from_forgery with: :exception

    # ログイン済ユーザーのみにアクセスを許可する
    before_action :authenticate_user!
  
    # deviseコントローラーにストロングパラメータを追加する          
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
    devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar))
  end


end

