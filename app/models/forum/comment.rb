module Forum
  class Comment < ApplicationRecord
    validates :forum_article_id, :body, presence: true
    belongs_to :user
    belongs_to :article, class_name: 'Forum::Article', foreign_key: 'forum_article_id'
  end
end
