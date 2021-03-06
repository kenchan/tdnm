class AddNewSlugToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :new_slug, :string
  end
end
