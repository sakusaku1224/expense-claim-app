Rails.application.routes.draw do
  # ルートページ（ダッシュボード）
  root "top#index"

  # Devise（ログイン・登録・ログアウト）
  devise_for :users

  # ゲストログイン
  post "guest_login", to: "guest_sessions#create"

  # 経費申請
  resources :expense_claims do
    # 提出アクション（PATCHメソッド、/expense_claims/:id/submit）
    member do
      patch :submit
    end
    # ネストされたリソース
    resources :expense_items, only: %i[create update destroy]
    resources :trip_allowances, only: %i[create update destroy]
    resources :comments, only: %i[create destroy]
  end

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
