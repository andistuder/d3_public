D3::Application.routes.draw do
  
  #get "chapters/index"
  #
  #get "chapters/show"



  resources :case_studies, :only => [:show, :index]

  resources :feature_categories, :only => [:index, :show], :path => :features

  resources :partner_categories, :only => [:index, :show], :path => :get_d3  do
      resources :partners, :only => [:show], :path => ""
  end

  resources :news_items, :only => [:index, :show], :path => :news

  resources :projects, :only => [:show, :index]

  resources :project_categories, :only => [:show]

  scope "support" do
    scope "knowledge_base" do
      scope "user_guide" do
        match "" => "knowledge_base#user_guide"
        resources :chapters, :only => [:index, :show]
      end

    end

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
