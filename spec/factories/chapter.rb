FactoryGirl.define do
  factory :chapter, :class => Chapter do
    name Faker::Lorem.words
    slug "some-slug"
    summary Faker::Lorem.sentence
    content Faker::Lorem.paragraph
    created_at Time.now
    parent_id nil
  end
end

#Column   |            Type             |                       Modifiers
#------------+-----------------------------+-------------------------------------------------------
#id         | integer                     | not null default nextval('chapters_id_seq'::regclass)
#name       | character varying(255)      |
#    slug       | character varying(255)      |
#    summary    | text                        |
#    content    | text                        |
#    sort_order | integer                     |
#    parent_id  | integer                     |
#    created_at | timestamp without time zone | not null
#updated_at | timestamp without time zone | not null
#Indexes:
#    "chapters_pkey" PRIMARY KEY, btree (id)