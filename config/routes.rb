Rails.application.routes.draw do

  resources :account_receivables do
    collection do
      get 'import/', to: 'account_receivables#import',  as: :import
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
