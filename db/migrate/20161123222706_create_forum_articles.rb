class CreateForumArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_articles do |t|
      t.string :title, null:false, index: true
      t.string :summary, null:false
      t.text :body, null:false
      t.string :lang, null:false, index: true
      t.string :flag, null:false, limit:8, default: 'markdown'
      t.integer :vote, null:false, default: 0
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
