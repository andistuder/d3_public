D3::Application.routes.draw do
  
  

  resources :feature_categories, :only => [:index, :show], :path => :features

  resources :partner_categories, :only => [:index, :show], :path => :get_d3  do
      resources :partners, :only => [:show], :path => ""
  end

  resources :news_items, :only => [:index, :show], :path => :news

  resources :projects, :only => [:show, :index]

  resources :project_categories, :only => [:show]

  scope "support" do
    match "knowledge_base/user_guide" => "knowledge_base#user_guide"
  end

  match "news/next/:page" => "news_items#next"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  match "sitemap.xml" => "sitemap#sitemap"
  root :to => "feature_categories#index"


  match "page_content_areas/:page_id/:name" => "content_areas#page_content_areas", :as => :page_content_areas
  match "/rails3" => "pages#dynamic", :as => :pages, :slug => "rails3"
  match "/:slug" => "pages#dynamic", :as => :pages


end
