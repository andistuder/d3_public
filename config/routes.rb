D3::Application.routes.draw do
  
  

  resources :feature_categories, :only => [:index, :show], :path => :features

  resources :news_items, :only => [:index, :show], :path => :news

  #match "news/:id" => "news_items#show"
  #match "news" => "news_items#next"
  match "news/next/:page" => "news_items#next"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  match "sitemap.xml" => "sitemap#sitemap"
  root :to => "feature_categories#index"


  match "page_content_areas/:page_id/:name" => "content_areas#page_content_areas", :as => :page_content_areas
  match "/rails3" => "pages#dynamic", :as => :pages, :slug => "rails3"
  match "/:slug" => "pages#dynamic", :as => :pages


end
