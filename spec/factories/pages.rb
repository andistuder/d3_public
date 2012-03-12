FactoryGirl.define do
  factory :page, :class => Page do
    name Faker::Lorem.words
    slug "some-slug"
    created_at Time.now
  end

  factory :tutorial_ca, :class => ContentArea do
    name Faker::Lorem.words
    content Faker::Lorem.paragraph
    created_at Time.now
  end

end

FactoryGirl.define do
  factory :user_guide, :class => ContentArea do
    name Faker::Lorem.words
    content Faker::Lorem.paragraph
    created_at Time.now
  end
end

FactoryGirl.define do
  factory :home_page, :class => Page do
    name "Home"
    slug "home"
    introduction Faker::Lorem.paragraph
    created_at Time.now
  end
end


#Table "public.pages"
#Column   |            Type             |                     Modifiers
#------------+-----------------------------+----------------------------------------------------
#id         | integer                     | not null default nextval('pages_id_seq'::regclass)
#name       | character varying(255)      |
#    slug       | character varying(255)      |
#    sort_order | integer                     |
#    created_at | timestamp without time zone |
#                                            updated_at | timestamp without time zone |
#                                                                                    parent_id  | integer                     |
#                                                                                    Indexes:
#    "pages_pkey" PRIMARY KEY, btree (id)


#Column   |            Type             |                         Modifiers
#------------+-----------------------------+------------------------------------------------------------
#id         | integer                     | not null default nextval('content_areas_id_seq'::regclass)
#name       | character varying(255)      |
#    content    | text                        |
#    sort_order | integer                     |
#    created_at | timestamp without time zone |
#                                            updated_at | timestamp without time zone |
#                                                                                    page_id    | integer                     |
#                                                                                    Indexes:
#    "content_areas_pkey" PRIMARY KEY, btree (id)