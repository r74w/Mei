class Post < ActiveRecord::Base
  belongs_to :discussion
  has_attached_file :image, :styles => { :medium => "300x300>" }
  around_create :update_discussion

  protected

  def update_discussion
    if self.discussion.nil? then
      self.discussion = Discussion.create
    end
    yield
    self.discussion.update_attribute('updated_at',self.updated_at)
  end
end
