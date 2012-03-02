FactoryGirl.define do

  factory :workflow_item, :class => WorkflowItem do |wfi|
    wfi.title Faker::Lorem.words
    wfi.list_title Faker::Lorem.words
    wfi.content_area Faker::Lorem.paragraph
    wfi.list_area Faker::Lorem.paragraph
    wfi.overlay Faker::Lorem.paragraph

    wfi.created_at Time.now
  end
end