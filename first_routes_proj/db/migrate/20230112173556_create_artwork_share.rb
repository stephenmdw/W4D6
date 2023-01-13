class CreateArtworkShare < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork , null: false, foreign_key: {to_table: :artworks}
      t.references :viewer, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
  end
end

# user cannot have a single artwork shared with them more than once
# add indexes to ArtworkShare's foreign key columns for fast lookup
 