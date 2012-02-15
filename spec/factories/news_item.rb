FactoryGirl.define do
  factory :news_item, :class => NewsItem do
    headline Faker::Lorem.words
    slug "some-slug"
    summary Faker::Lorem.sentence
    content Faker::Lorem.paragraph
  end
end

#                                     Table "public.news_items"
#   Column   |            Type             |                        Modifiers
#------------+-----------------------------+---------------------------------------------------------
# id         | integer                     | not null default nextval('news_items_id_seq'::regclass)
# headline   | character varying(255)      |
# summary    | text                        |
# content    | text                        |
# slug       | character varying(255)      |
# created_at | timestamp without time zone | not null
# updated_at | timestamp without time zone | not null
#Indexes:
#    "news_items_pkey" PRIMARY KEY, btree (id)