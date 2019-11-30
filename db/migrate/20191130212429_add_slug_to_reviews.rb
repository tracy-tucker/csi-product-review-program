class AddSlugToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :slug, :string
  end
end
