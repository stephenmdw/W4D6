# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
    # validates :name, presence: true, uniqueness: true
    # validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy,
        inverse_of: :artist

    has_many :artworks_viewed,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy,
        inverse_of: :viewer

    has_many :comments,
        foreign_key: :author_id,
        class_name: :Comment,
        inverse_of: :author,
        dependent: :destroy

    has_many :shared_artworks,
        through: :artworks_viewed,
        source: :artwork

    has_many :likes,
        foreign_key: :liker_id,
        class_name: :Like,
        dependent: :destroy



    

end
