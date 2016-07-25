Rails.application.routes.draw do



  devise_for :users

  resources :users, only:[:index] do
    collection do
      get :history
    end
  end

  devise_for :providers, controllers: {
    sessions:      'providers/sessions',
    passwords:     'providers/passwords',
    registrations: 'providers/registrations'
  }

  resources :providers, only:[:index,:edit,:update,:show ]  do
    collection do
      get :main
      get :inbox

    end
    member do
      get :conversations
      post :reply
    end
  end

  resources :charges

  resources :notes do
   resources :reviews, except: [:show,:index]
  resources :reservations do
    collection do
       :detail_categories_select
      post 'confirm'
      get 'complete'
    end
end
   collection do
    get :reservations
    get :search
  end
  member do
    get :profile
  end
end

get '/notes/search/:note_id' => "notes#search"


get 'pay' => 'api#pay'

post '/like/:note_id' => 'likes#like', as: 'like'
delete '/unlike/:note_id' => 'likes#unlike', as: 'unlike'

resources :notes_steps

root'home#index'

namespace :home do
  get :pro
  get :signage
  get :term
  get :policy
  get :guide
  get :newlisting
  get :service_setting
end


namespace :service_setting do
  get :basic
  get :description
  get :pictures
  get :price
end

namespace :company do
  get :index 
  
  get :question
end

namespace :category do
  get :housing
  get :event
  get :lesson
  get :health
  get :others
end

namespace :dashboard do
  get :index
  get :listing
  get :account
  get :mypage
  get :messages
  get :transaction
end

 # mailbox folder routes
 get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
 get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  # conversations
  resources :conversations do
    member do
      post :reply
    end
  end

end





