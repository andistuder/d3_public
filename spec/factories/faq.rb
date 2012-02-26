FactoryGirl.define do
  factory :faq, :class => Faq do
    question Faker::Lorem.words
    answer Faker::Lorem.words
    slug "some-slug"
    created_at Time.now
    sort_order 0
  end
end

FactoryGirl.define do
  factory :faq_category, :class => FaqCategory do
    name Faker::Lorem.words
    sort_order 0
    created_at Time.now
  end
end





#Table "public.faqs"
#Column   |            Type             |                     Modifiers
#------------+-----------------------------+---------------------------------------------------
#id         | integer                     | not null default nextval('faqs_id_seq'::regclass)
#question   | text                        |
#    answer     | text                        |
#    slug       | character varying(255)      |
#    sort_order | integer                     |
#    created_at | timestamp without time zone | not null
#updated_at | timestamp without time zone | not null
#Indexes:
#    "faqs_pkey" PRIMARY KEY, btree (id)
#
#d3_development=> \d faq_categories
#Table "public.faq_categories"
#Column   |            Type             |                          Modifiers
#------------+-----------------------------+-------------------------------------------------------------
#id         | integer                     | not null default nextval('faq_categories_id_seq'::regclass)
#name       | character varying(255)      |
#    sort_order | integer                     |
#    created_at | timestamp without time zone | not null
#updated_at | timestamp without time zone | not null
#Indexes:
#    "faq_categories_pkey" PRIMARY KEY, btree (id)