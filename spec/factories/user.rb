FactoryGirl.define do
  factory :user, :class => User do
    #username Faker::Internet.user_name
    #name Faker::Name.name
    #music Faker::Lorem.sentence
    email Faker::Internet.email
    encrypted_password "43065ef1c25f5a3c5d94a6892987f0ddc2cb8bcf24c168dc28de2025eb9be55cf03cfc9715a4864db646809e0984554607cafcbb262ecef42bbcd9477f224db0"
    password "passw0rd"
  end
end

 #id                     | integer                     | not null default nextval('users_id_seq'::regclass)
 #email                  | character varying(255)      | not null default ''::character varying
 #encrypted_password     | character varying(128)      | not null default ''::character varying
 #reset_password_token   | character varying(255)      |
 #reset_password_sent_at | timestamp without time zone |
 #remember_created_at    | timestamp without time zone |
 #sign_in_count          | integer                     | default 0
 #current_sign_in_at     | timestamp without time zone |
 #last_sign_in_at        | timestamp without time zone |
 #current_sign_in_ip     | character varying(255)      |
 #last_sign_in_ip        | character varying(255)      |
 #created_at             | timestamp without time zone |
 #updated_at