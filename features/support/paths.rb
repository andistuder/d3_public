module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the admin page/
      '/admin'

    when /the login page/
      '/users/sign_in'

    when /the news page/
      news_items_path

    when /features/
      feature_categories_path

    when /the faq page/
      "/support/faq/most-popular"

    when /get d3 page/
      partner_categories_path

    when /projects/
      projects_path

    when /the user guide/
      "/support/user-guide"

    when /the case studies page/
      case_studies_path

    when /the enquiry page/
      "/enquiry-form"

    when /the workflow page/
      "/what-is-d3/workflow"

    when /the downloads page/
      "/support/downloads"

    when /the announcements page/
      "/support/announcements"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
