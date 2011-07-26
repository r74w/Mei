class Discussion < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  accepts_nested_attributes_for :posts
  
  def self.latest_discussions
    self.find_by_sql("SELECT p.title as title, p.discussion_id as id FROM (( select min(id) as id from posts group by discussion_id) as x inner join  posts as p on p.id = x.id) as p inner join discussions as d ON d.id = p.discussion_id ORDER BY d.updated_at DESC LIMIT 5")
  end
end
