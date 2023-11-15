class FixCategoryName < ActiveRecord::Migration[7.1]
  def change
    rename_column :restaurants, :categorie, :category
  end
end
