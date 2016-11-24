module Forum
  class Comment < ApplicationRecord
    validates :article_id, :body, presence: true
    belongs_to :user
    belongs_to :article, class_name: 'Forum::Article'
  end
end
