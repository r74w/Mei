class Post < ActiveRecord::Base
  belongs_to :discussion
  has_attached_file :image, :styles => { :medium => "300x300>" }
  after_create :update_discussion

  def update_discussion
    discussion.update_attribute('updated_at',updated_at)
  end
end
