module Forum
  class Tag < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_and_belongs_to_many :articles, class_name: 'Forum::Article', foreign_key: 'forum_tag_id', association_foreign_key: 'forum_article_id'
  end
end
