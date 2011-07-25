class Post < ActiveRecord::Base
  belongs_to :discussion
  after_create :update_discussion

  def update_discussion
    discussion.update_attribute('updated_at',updated_at)
  end
end
