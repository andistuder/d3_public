FactoryGirl.define do
  factory :chapter, :class => Chapter do
    name Faker::Lorem.words
    slug "some-slug"
    #summary Faker::Lorem.paragraph
    content Faker::Lorem.paragraphs
    created_at Time.now
    parent_id nil
  end
end

FactoryGirl.define do
  factory :chapter_content_area, :class => ChapterContentArea do
    title Faker::Lorem.words
    content Faker::Lorem.paragraphs
    created_at Time.now
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