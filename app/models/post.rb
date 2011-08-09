# encoding: utf-8
class Post < ActiveRecord::Base
  belongs_to :discussion
  has_attached_file :image, :styles => { :medium => "300x300>" }
  has_dag_links :link_class_name => 'Reply'

#  validates_presence_of :title

  before_create :author_tripcoding
  after_create :update_discussion
  before_save :parse_reply_to   # NOTE check and see if this will be rolled back if save fails

  protected

  def update_discussion
    self.discussion.update_attribute('updated_at',self.updated_at)
  end

    def parse_reply_to
    unless content.nil? then
      content.scan(/^> ?(\d+)\s*$/).each do |id|
        p = Post.find_by_id(id[0])
        parents << p unless p.nil?
      end
      content.gsub!(/^(> ?)(\d+)\s*$/,"\\1\[\\2\]\(#p\\2\)\n")
      # NOTE hardcoding newline may create problem on Mac?
      # TODO do this in JS and check for same page anchor
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

      # p[2].encode!('SJIS')
      salt = (p[2] + 'H..')[1, 2].gsub(/[^\.-z]/, '..').tr(':;<=>?@[\]^_`', 'ABCDEFGabcdef')

      input = p[0] + '◆' + p[2].crypt(salt)[-10 .. -1]
    end
    return input
  end

end
