# encoding: utf-8
class Post < ActiveRecord::Base
  belongs_to :discussion
  has_attached_file :image, :styles => { :medium => "300x300>" }
  has_dag_links :link_class_name => 'Reply'

  validates_presence_of :title

  before_create :author_tripcoding
#  around_create :update_discussion
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
      content.scan(/^> ?(\d+)\s*$/).each do |id|
        parents << Post.find(id[0])
      end
    end
  end

  def author_tripcoding
    self.author = tripcode(self.author) unless self.author.nil?
  end

  private

  def tripcode(input)
    if input.include?('◆')
      return input.tr('◆','◇')
    end
    
    if input.include?('#') then
      p = input.partition("#")

      p[2].encode!('SJIS')
      salt = (p[2] + 'H..')[1, 2].gsub(/[^\.-z]/, '..').tr(':;<=>?@[\]^_`', 'ABCDEFGabcdef')

      input = p[0] + '◆' + p[2].crypt(salt)[-10 .. -1]
    end
    return input
  end

end
