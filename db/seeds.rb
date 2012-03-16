# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


#PARTNERCATS = {
#  "users" => "Users",
#  "rental_partners" => "Rental Partners",
#  "distributors" => "Distributors",
#  "previs_studios" => "Previs Studios"
#}
#
#PARTNERCATS.each do |slug, name|
#  attributes = {:name => name, :slug => slug}
#  PartnerCategory.create(attributes) unless PartnerCategory.exists?(attributes)
#end


Category.create(:name => 'General') unless Category.find_by_name('general').present?
Category.create(:name => 'Product updates') unless Category.find_by_name('Product updates').present?

