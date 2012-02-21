FactoryGirl.define do
  factory :user_guide, :class => ContentArea do
    name Faker::Lorem.words
    content Faker::Lorem.paragraph
    created_at Time.now
  end
end

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