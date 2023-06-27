Rails.application.routes.draw do
  root 'rooms#search_result'

  get 'users/account'
  get 'users/profileedit' 
  
  get 'rooms/search_result'
  get 'rooms/own', to: 'rooms#own'
  
  get 'reservations/new' # 入力画面
  post 'reservations/confirm' # 確認画面
  post 'reservations/back' # 確認画面から「入力画面に戻る」をクリックしたとき
  post 'reservations/complete' # 完了画面
  get 'reservations/own', to: 'reservations#own'

  devise_for :users
  resources :users
  resources :reservations
  resources :rooms

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
