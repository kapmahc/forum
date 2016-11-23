class CreateForumComments < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_comments do |t|

      t.timestamps
    end
  end
end
