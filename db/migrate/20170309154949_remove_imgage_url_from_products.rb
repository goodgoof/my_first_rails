class RemoveImgageUrlFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :imgage_url, :string
  end
end
