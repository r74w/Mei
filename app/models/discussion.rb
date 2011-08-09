class Discussion < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  belongs_to :starter_post, :class_name => 'Post', :readonly => true # link to starter post
  accepts_nested_attributes_for :posts

  after_create :set_starter_post_id
  
  def self.latest_discussions
    self.find_by_sql("SELECT d.id, p.title FROM discussions as d INNER JOIN posts as p ON d.starter_post_id = p.id ORDER BY d.updated_at DESC LIMIT 5")
  end

  def set_starter_post_id
    self.starter_post_id = self.posts.first.id  #TODO eliminate extra sql query
    self.save!
  end
  
end
