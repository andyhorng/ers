# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Admin.create(:login => 'must.ect', :password => 'mustaflc', :password_confirmation => 'mustaflc')
Post.create(:post_type => 'related', :title => '相關辦法', :content => '這是相關辦法')
