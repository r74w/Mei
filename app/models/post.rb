class Post < ActiveRecord::Base
  belongs_to :discussion
  has_attached_file :image, :styles => { :medium => "300x300>" }
  has_dag_links :link_class_name => 'Reply'

  around_create :update_discussion
  after_save :update_dag

  protected

  def update_discussion
    if self.discussion.nil? then
      self.discussion = Discussion.create
    end
    yield
    self.discussion.update_attribute('updated_at',self.updated_at)
  end

  def update_dag
    unless content.nil? then
      content.scan(/^> ?(\d+)$/).each do |id|
        parents << Post.find(id[0])
      end
    end
  end

end
