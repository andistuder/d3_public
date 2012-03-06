D3::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :partner_categories, :only => [:index, :show], :path => "get-d3"  do
    resources :partners, :only => [:show], :path => ""
  end

  resources :news_items, :only => [:index, :show], :path => :news

  resources :projects, :only => [:show, :index]

  resources :project_categories, :only => [:show], :path => "project-categories"

  scope "support" do
    resources :faq, :only => [:index, :show]
    resources :download_categories, :only => [:index, :show], :path => "downloads"

    resources :downloads, :only => [:show], :path => "download-item"

    scope "user-guide" do
      match "" => "knowledge_base#user_guide"
      match "chapters/:parent/:id" => "chapters#show", :as => "chapter"
    end

    scope "training" do
      match "" => "pages#dynamic", :slug => "training"
    end

    scope "tutorials" do
      match "" => "pages#dynamic", :slug => "tutorials"
    end
  end

  match "news/next/:page" => "news_items#next"
  match "support/downloads/:cat/next/:page" => "download_categories#next"
  match "support/downloads/next/:page" => "download_categories#next"


  scope "what-is-d3" do
    resources :case_studies, :only => [:index, :show], :path => "case-studies"
    resources :feature_categories, :only => [:index, :show], :path => "features"
    resources :workflow_items, :only => [:index], :path => "workflow"

    match "" => "pages#dynamic", :slug => "what-is-d3"
    match "concept" => "pages#dynamic", :slug => "concept"
  end

  devise_for :users

  match "sitemap.xml" => "sitemap#sitemap"
  root :to => "pages#dynamic", :slug => "home"

  match "send_enquiry" => "enquiries#send_enquiry"

  match "page_content_areas/:page_id/:name" => "content_areas#page_content_areas", :as => :page_content_areas
  match "/rails3" => "pages#dynamic", :as => :pages, :slug => "rails3"
  match "/:slug" => "pages#dynamic", :as => :pages
  match "/what-is-d3/:slug" => "pages#dynamic", :as => :pages
  match "/products/:slug" => "pages#dynamic", :as => :pages
  match "/company/:slug" => "pages#dynamic", :as => :pages
  match "/legal/:slug" => "pages#dynamic", :as => :pages

end
