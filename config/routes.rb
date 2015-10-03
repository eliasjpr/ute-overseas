Rails.application.routes.draw do

  resources :account_receivables do
    collection do
      post 'import', to: 'account_receivables#import',  as: :import
      get 'merge', to: 'account_receivables#merge',  as: :merge
      get 'export', to: 'account_receivables#export',  as: :export
    end
  end
  resources :settings do
    collection do
      get 'edit_multiple'
      put 'update_individual'
    end
  end
  get '/settings',  to: 'settings#edit',  as: :import_settings

 root 'account_receivables#index'
end
