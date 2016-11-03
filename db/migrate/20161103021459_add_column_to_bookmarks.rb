class AddColumnToBookmarks < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :bookmark_date, :date
  end
end
