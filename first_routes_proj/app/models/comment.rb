# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  author_id  :bigint           not null
#  artwork_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User,
        inverse_of: :comments

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork,
        inverse_of: :comments

    has_many :likes, as: :likeable
end
