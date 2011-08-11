# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Post.destroy_all
Discussion.destroy_all

d1 = Discussion.create({:posts_attributes => [{:title => '1-1'}] })
Discussion.create({:posts_attributes => [{:title => '2-1'}] })
Discussion.create({:posts_attributes => [{:title => '3-1'}] })

p4_param = {:title => 'Ipsom', :content => 'Lorem ipsum dolor sit amet, dolor pretium massa phasellus maecenas ut libero, urna turpis vitae, mauris magna quisque luctus metus dolor. Dis odio rutrum sapien, ipsum eros sapien dui. Vel magna erat, augue vestibulum in condimentum duis. Pellentesque inceptos sollicitudin, amet aliquam non arcu nunc congue maecenas, vel felis eget, aliquam in nibh orci convallis. Enim at at risus wisi augue mi, euismod consequat gravida vestibulum.

__Ad aliquam risus mattis commodo eu rhoncus, laoreet metus dolor wisi vestibulum dolor, nulla cubilia cubilia. Vel tortor, neque ornare vel, consequat ultrices. Euismod vel ultrices, phasellus vel eget, magna sagittis libero vitae suscipit, sociosqu sit ut cras dolor enim. Gravida curabitur, mauris pretium tortor sed, ligula eros, mi non nonummy. Consectetuer curabitur pulvinar, ut convallis ut nec, vel ac eget nascetur cursus magna justo, velit nulla, wisi quis massa quia cras praesent dolor. Aenean integer ut quis. Lacus orci odio lobortis, arcu magna lacus sem nec.__

Vitae imperdiet. Eget scelerisque velit elit, ut aenean nec, platea non leo in etiam orci, per nibh, nisl ipsum sed in quo. Interdum et luctus pede dapibus cursus porttitor. Consectetuer libero, etiam proin est ipsum accumsan id, donec ridiculus nec vel, amet nulla lacinia erat egestas elementum, maecenas mauris mauris. Mollis mauris sollicitudin vel cras amet, totam tristique scelerisque, etiam commodo nulla blandit magna. Elementum nunc vel. Commodo dui eros aliquet fusce. Praesent sapien. Cras pellentesque fermentum vel gravida ipsum volutpat, ut lorem vitae lorem. In vehicula sed. Lorem consectetuer orci ea at, libero dignissim ipsum euismod cras vivamus in, nibh urna, purus nulla feugiat magna quisque amet.'}

Discussion.create({:posts_attributes => {1=>p4_param}})

d1.posts.create({:title=>"1-2"})
d1.posts.create({:title=>"1-3"})
d1.posts.create({:title=>"1-4"})
d1.posts.create({:title=>"1-5"})
