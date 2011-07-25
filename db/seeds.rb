# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Post.destroy_all
Discussion.destroy_all

d1 = Discussion.create
d2 = Discussion.create
d3 = Discussion.create

d1.posts.create(:title => '1-1')
d1.posts.create(:title => '1-2')
d1.posts.create(:title => '1-3')
d1.posts.create(:title => '1-4')
d1.posts.create(:title => '1-5')

d3.posts.create(:title => '3-1')

d2.posts.create(:title => '2-1')
