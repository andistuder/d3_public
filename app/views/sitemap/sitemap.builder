xml.instruct!

xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.84" do
  xml.url do
    xml.loc D3::Application::SITE_URL
    xml.lastmod w3c_date(Time.now)
    xml.changefreq "always"
  end

  @news_items.each do |news|
    xml.url do
      xml.loc news_item_path(news, :only_path => false)
      xml.lastmod w3c_date(news.updated_at)
      xml.changefreq "daily"
      xml.priority 0.9
    end
  end

  @announcements.each do |news|
    xml.url do
      xml.loc "#{D3::Application::SITE_URL}support/announcements/#{news.slug}"
      xml.lastmod w3c_date(news.updated_at)
      xml.changefreq "daily"
      xml.priority 0.9
    end
  end

  @pages.each do |page|
    xml.url do
      if page.parent.present?
        xml.loc "#{D3::Application::SITE_URL}#{page.parent.slug}/#{page.slug}"
      else
        xml.loc "#{D3::Application::SITE_URL}#{page.slug}"
      end
      xml.lastmod w3c_date(page.updated_at)
      xml.changefreq "weekly"
      xml.priority 0.6
    end
  end

  @case_studies.each do |case_study|
    xml.url do
      xml.loc case_study_path(case_study, :only_path => false)
      xml.lastmod w3c_date(case_study.updated_at)
      xml.changefreq "weekly"
      xml.priority 0.5
    end
  end

  @feature_categories.each do |feature|
    xml.url do
      xml.loc feature_category_path(feature, :only_path => false)
      xml.lastmod w3c_date(feature.updated_at)
      xml.changefreq "weekly"
      xml.priority 0.5
    end
  end

  @projects.each do |project|
    xml.url do
      xml.loc project_path(project, :only_path => false)
      xml.lastmod w3c_date(project.updated_at)
      xml.changefreq "weekly"
      xml.priority 0.4
    end
  end

  @project_categories.each do |pc|
    xml.url do
      xml.loc project_category_path(pc, :only_path => false)
      xml.lastmod w3c_date(pc.updated_at)
      xml.changefreq "weekly"
      xml.priority 0.4
    end
  end

  @partner_categories.each do |pc|
    xml.url do
      xml.loc partner_category_path(pc, :only_path => false)
      xml.lastmod w3c_date(pc.updated_at)
      xml.changefreq "weekly"
      xml.priority 0.5
    end
  end

  @partners.each do |rp|
    xml.url do
      xml.loc "#{partner_category_path(rp.partner_category, :only_path => false)}/#{rp.slug}"
      xml.lastmod w3c_date(rp.updated_at)
      xml.changefreq "weekly"
      xml.priority 0.5
    end
  end

  #@chapters.each do |chapter|     #TODO uncomment when userguide ready
  #  xml.url do
  #    xml.loc chapter_path(chapter, :only_path => false)
  #    xml.lastmod w3c_date(chapter.updated_at)
  #    xml.changefreq "weekly"
  #    xml.priority 0.4
  #  end
  #end

  @downloads.each do |download|
    xml.url do
      xml.loc download_path(download, :only_path => false)
      xml.lastmod w3c_date(download.updated_at)
      xml.changefreq "weekly"
      xml.priority 0.4
    end
  end

  @faq_categories.each do |faq|
    xml.url do
      xml.loc faq_path(faq, :only_path => false)
      xml.lastmod w3c_date(faq.updated_at)
      xml.changefreq "weekly"
      xml.priority 0.4
    end
  end

end
