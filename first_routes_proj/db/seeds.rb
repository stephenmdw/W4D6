# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Artwork.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artworks')
ApplicationRecord.connection.reset_pk_sequence!('artworkshares')
ApplicationRecord.connection.reset_pk_sequence!('comments')

users = User.create([
  { username: 'Stephen' }, 
  { username: 'Andre' }, 
  { username: 'Chris' }, 
  { username: 'Paulo' }, 
  { username: 'Mike' }, 
])

artworks = Artwork.create([
    { title: 'Bored Ape', image_url: 'a' , artist_id: users[0][:id] }, #id 1, artist 1
    { title: 'Supreme', image_url: 'b', artist_id: users[1][:id] },
    { title: 'The Skream', image_url: 'c', artist_id:  users[2][:id]},
    { title: 'The Birth of Venus', image_url: 'd', artist_id: users[3][:id] },
    { title: 'Starry Knight', image_url: 'e', artist_id: users[4][:id]}

])

artworkshares = ArtworkShare.create([
    { artwork_id: artworks[0][:id], viewer_id: users[1][:id] },
    { artwork_id: artworks[1][:id], viewer_id: users[2][:id] },
    { artwork_id: artworks[2][:id], viewer_id: users[3][:id] },
    { artwork_id: artworks[3][:id], viewer_id: users[4][:id] },
    { artwork_id: artworks[4][:id], viewer_id: users[0][:id] }
])

comments = Comment.create ([
  { body: 'this painting is so hot', author_id: users[1][:id], artwork_id: artworks[2][:id] },
  { body: 'this drawing is so trash', author_id: users[2][:id], artwork_id: artworks[1][:id] },
  { body: 'this man is a genius', author_id: users[3][:id], artwork_id: artworks[0][:id] },
  { body: 'garbage lmao', author_id: users[4][:id], artwork_id: artworks[3][:id] },
  { body: 'who tf painted this piece of trash #hatingisinmyblood', author_id: users[0][:id], artwork_id: artworks[4][:id] },
])
