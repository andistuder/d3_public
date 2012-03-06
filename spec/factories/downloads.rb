FactoryGirl.define do
  factory :download, :class => Download do
    name Faker::Lorem.words
    content Faker::Lorem.paragraph
    slug "some-slug"
    #download Factory(:asset)
    #categories [Factory(:download_category)]

    created_at Time.now
  end

  factory :download_category, :class => DownloadCategory do
    name Faker::Lorem.words
    created_at Time.now
  end
end