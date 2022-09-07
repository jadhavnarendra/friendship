class AddImageUrlToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :imageURL, :string
  end
end
