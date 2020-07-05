class RemoveTitleFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :title, :string
  end
end
