module Forum
  class Article < ApplicationRecord
    validates :title, :body, presence: true

    belongs_to :user
    has_many :comments, class_name: 'Forum::Comment', foreign_key: 'forum_article_id'
    has_and_belongs_to_many :tags, class_name: 'Forum::Tag', foreign_key: 'forum_article_id', association_foreign_key: 'forum_tag_id'
  end
end
