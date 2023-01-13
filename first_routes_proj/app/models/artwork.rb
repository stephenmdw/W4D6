# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    belongs_to :artist,
        foreign_key: :artist_id, 
        class_name: :User,
        inverse_of: :artworks

    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy,
        inverse_of: :artwork
        

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        inverse_of: :artwork,
        dependent: :destroy

    has_many :shared_viewers,
        through: :shares,
        source: :viewer

    has_many :likes, as: :likeable


    def self.artworks_for_user_id(user_id)
        User.joins(:artworks).where('artworks.artist_id = ?', user_id).distinct
    end
end
