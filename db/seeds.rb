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
d4 = Discussion.create

d1.posts.create(:title => '1-1')
d1.posts.create(:title => '1-2')
d1.posts.create(:title => '1-3')
d1.posts.create(:title => '1-4')
d1.posts.create(:title => '1-5')

d3.posts.create(:title => '3-1')

d2.posts.create(:title => '2-1')

d4.posts.create(:title => 'Ipsom', :content => 'Lorem ipsum dolor sit amet, dolor pretium massa phasellus maecenas ut libero, urna turpis vitae, mauris magna quisque luctus metus dolor. Dis odio rutrum sapien, ipsum eros sapien dui. Vel magna erat, augue vestibulum in condimentum duis. Pellentesque inceptos sollicitudin, amet aliquam non arcu nunc congue maecenas, vel felis eget, aliquam in nibh orci convallis. Enim at at risus wisi augue mi, euismod consequat gravida vestibulum.

__Ad aliquam risus mattis commodo eu rhoncus, laoreet metus dolor wisi vestibulum dolor, nulla cubilia cubilia. Vel tortor, neque ornare vel, consequat ultrices. Euismod vel ultrices, phasellus vel eget, magna sagittis libero vitae suscipit, sociosqu sit ut cras dolor enim. Gravida curabitur, mauris pretium tortor sed, ligula eros, mi non nonummy. Consectetuer curabitur pulvinar, ut convallis ut nec, vel ac eget nascetur cursus magna justo, velit nulla, wisi quis massa quia cras praesent dolor. Aenean integer ut quis. Lacus orci odio lobortis, arcu magna lacus sem nec.__

Vitae imperdiet. Eget scelerisque velit elit, ut aenean nec, platea non leo in etiam orci, per nibh, nisl ipsum sed in quo. Interdum et luctus pede dapibus cursus porttitor. Consectetuer libero, etiam proin est ipsum accumsan id, donec ridiculus nec vel, amet nulla lacinia erat egestas elementum, maecenas mauris mauris. Mollis mauris sollicitudin vel cras amet, totam tristique scelerisque, etiam commodo nulla blandit magna. Elementum nunc vel. Commodo dui eros aliquet fusce. Praesent sapien. Cras pellentesque fermentum vel gravida ipsum volutpat, ut lorem vitae lorem. In vehicula sed. Lorem consectetuer orci ea at, libero dignissim ipsum euismod cras vivamus in, nibh urna, purus nulla feugiat magna quisque amet.

Porttitor in, massa pellentesque urna in aliquam dui, nunc integer egestas consequat in ligula convallis. Fringilla pede a pretium vel, tempora commodo, turpis eu ut tincidunt, quam enim dapibus in tortor suspendisse pede. Ac sagittis sed, adipiscing ut elit tempor luctus, a dictum luctus. Placerat quis, fermentum nonummy, lacinia vestibulum laudantium, enim sollicitudin vel. Massa dictum aliquam sed diam, mauris aenean curabitur dignissim. Quis scelerisque ut vestibulum sed leo. Accumsan aenean nec id, deserunt et sociosqu lacus quis. Nibh eget metus mauris risus consectetuer nec, nonummy convallis risus turpis accumsan leo. Augue eget enim id euismod, wisi lacus mollis morbi nulla, donec libero lobortis nec. Ac blandit, donec magna, facilisis mi totam posuere, pede sodales suscipit commodi conubia sit, lectus mi adipiscing dignissim.')
