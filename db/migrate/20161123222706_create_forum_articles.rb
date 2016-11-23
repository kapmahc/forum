class CreateForumArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_articles do |t|

      t.timestamps
    end
  end
end
