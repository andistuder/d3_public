D3::Application.routes.draw do
  
  #get "chapters/index"
  #
  #get "chapters/show"



  resources :case_studies, :only => [:show, :index], :path => "/what-is-d3/case-studies"

  resources :feature_categories, :only => [:index, :show], :path => "/what-is-d3/features"

  resources :partner_categories, :only => [:index, :show], :path => "get-d3"  do
      resources :partners, :only => [:show], :path => ""
  end

  resources :news_items, :only => [:index, :show], :path => :news

  resources :projects, :only => [:show, :index]

  resources :project_categories, :only => [:show], :path => "project-categories"

  scope "support" do
    scope "knowledge-base" do
      scope "user-guide" do
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
  match "/what-is-d3/:slug" => "pages#dynamic", :as => :pages
  match "/products/:slug" => "pages#dynamic", :as => :pages
  match "/company/:slug" => "pages#dynamic", :as => :pages
  match "/legal/:slug" => "pages#dynamic", :as => :pages

end
