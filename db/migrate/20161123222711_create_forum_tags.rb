class CreateForumTags < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_tags do |t|
      t.string :name, null:false
      t.string :lang, null:false, index: true
      t.timestamps
    end
    add_index :forum_tags, :name, unique:true

    create_table :forum_articles_tags, id: false do |t|
      t.belongs_to :forum_article, foreign_key: true
      t.belongs_to :forum_tag, foreign_key: true
    end
    add_index :forum_articles_tags, [:forum_article_id, :forum_tag_id], unique:true

  end
end
