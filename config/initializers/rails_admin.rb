if File.basename($0) == 'rake'
  # Skip RailsAdmin.config for rake tasks otherwise it will prevent environment being set up.
  # For example, Rake db:migrate will not run due to error:
  #  rake aborted!
else
  RailsAdmin.config do |config|

    #############################################################
    #MSP You'll have to restart the server after config edit here
    #############################################################

    config.current_user_method { current_user } # auto-generated

    # If you want to track changes on your models:
    config.audit_with :history, User

    # Or with a PaperTrail: (you need to install it first)
    # config.audit_with :paper_trail, User
    
    #config.included_models = ["Asset", "FeatureCategory", "Feature", "Category", "ContentArea", "Page", "User", "NewsItem"]
    config.excluded_models = [Category]

    config.models do
      list do
        sort_by :updated_at
      end
    end

    #############
    # Asset
    #############
    config.model Asset do
      edit do
        field :name
        field :description
        field :created_at

        field :asset do
          label "File"
          #thumb_method :thumb # for images. Will default to full size image, which might break the layout
                              # delete_method :delete_asset # actually not needed in this case: default is "delete_#{field_name}" if the object responds to it
        end
      end

      list do
        field :name
        field :description

        field :asset do
          formatted_value do # used in form views
            bindings[:view].tag(:img, {:src => bindings[:object].asset.url(:thumb)})
          end
          #thumb_method :thumb # for images. Will default to full size image, which might break the layout
        end
        field :created_at
        field :updated_at
      end
    end

    config.model NewsItem do
      edit do
        exclude_fields :summary
      end
      list do
        exclude_fields :summary
      end

    end

    #############
    # Feature
    #############
    config.model FeatureCategory do
      parent Feature
    end

    #############
    # Page
    #############
    config.model Page do
      list do
        field :id
        field :name
        field :slug do
          formatted_value do
            bindings[:view].link_to value, "/#{value}"
          end
        end
        field :introduction
        #field :tag_list do
        #  label "Tags"
        #end
        field :content_areas
        field :assets
        field :vimeo_id
        field :categories do
          #formatted_value do
          #  page = bindings[:object]
          #  page.categories.collect { |r| "MSP"+r.name }.join(', ')
          #end
        end
        field :created_at
        field :updated_at
      end

      show do
        field :id
        field :name
        field :slug
        field :introduction
        #field :tag_list do
        #  label "Tags"
        #end
        # field :website_url do
        #   formatted_value do
        #     if value.blank?
        #       "EMPTY"
        #     else
        #       bindings[:view].link_to value, value
        #     end
        #   end
        # end
        field :content_areas
        field :assets, :has_and_belongs_to_many_association
        field :vimeo_id
        field :categories, :has_and_belongs_to_many_association
        field :created_at
        field :updated_at
      end

      edit do
        field :name
        field :slug
        #field :tag_list do
        #  label "Tags"
        #end
        #
        #fields_of_type :tag_list do
        #  partial 'cenatus_tag_list'
        #end
        field :introduction
        field :parent_id, :enum do
          enum do
            Page.all.map{|p| [p.name, p.id]}
          end
        end
        field :content_areas
        field :assets, :has_and_belongs_to_many_association
        field :vimeo_id
        field :categories, :has_and_belongs_to_many_association
      end
    end

    #############
    # Partner
    #############
    config.model Partner do
      label "Get d3 item"
      label_plural "Get d3 items"
    end

    config.model PartnerContentArea do
      parent Partner
      label "Get d3 content area"
      label_plural "Get d3 content areas"
    end

    config.model PartnerCategory do
      parent Partner
      label "Get d3 category"
      label_plural "Get d3 categories"
    end

    #############
    # Project
    #############
    config.model Project do
      edit do
        field :name
        field :slug
        field :sort_order
        field :summary
        field :project_content_areas, :has_many_association
        field :how_made_title
        field :how_made
        field :features, :has_and_belongs_to_many_association
        field :how_made_bottom
        field :how_made_image
        field :credits_left
        field :credits_right
        field :equipment_left
        field :equipment_right
        field :vimeo_id
        field :assets, :has_and_belongs_to_many_association
        field :project_categories, :has_and_belongs_to_many_association
      end
    end

    config.model ProjectCategory do
      parent Project
    end

    config.model ProjectContentArea do
      parent Project
    end

    #############
    # Chapter
    #############
    config.model Chapter do
       # Cross-section field configuration
       #object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
       label 'User Guide Chapter'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
       label_plural 'User Guide Chapters'      # Same, plural
    end

    #############
    # User
    #############
    config.model User do
       # Cross-section field configuration
       #object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
       label 'Administrator'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
       label_plural 'Administrators'      # Same, plural
    end


  end

end