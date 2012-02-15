D3::Application.routes.draw do
  
  

  resources :feature_categories, :only => [:index, :show]
  resources :news_items, :only => [:index, :show]

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  match "sitemap.xml" => "sitemap#sitemap"
  root :to => "feature_categories#index"


  match "page_content_areas/:page_id/:name" => "content_areas#page_content_areas", :as => :page_content_areas
  match "/rails3" => "pages#dynamic", :as => :pages, :slug => "rails3"
  match "/:slug" => "pages#dynamic", :as => :pages


end
