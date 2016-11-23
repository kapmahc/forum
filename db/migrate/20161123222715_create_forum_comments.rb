class CreateForumComments < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_comments do |t|
      t.text :body, null:false
      t.string :flag, null:false, limit:8, default: 'markdown', index:true
      t.belongs_to :forum_article, foreign_key: true
      t.integer :vote, null:false, default: 0
      t.timestamps
    end
  end
end
