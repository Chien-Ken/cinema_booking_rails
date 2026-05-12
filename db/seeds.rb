require 'open-uri'

Movie.destroy_all

movies = [
  {title: "The Killer", description: "In the 1989 John Woo classic The Killer, Chow Yun-fat stars as Ah Jong (also known as Jeffrey or Jeff/Mickey Mouse/Butthead), a deeply honorable, melancholic Triad assassin seeking redemption. He is characterized by his strict moral code, refusing to harm innocents, and his deep affection for Jenny, a singer he accidentally blinds during a hit.", duration_minutes: 148, release_date: "2025-07-16", rating: 8.8, director: "Christopher Nolan", actor: "Leonardo DiCaprio", genre: "Sci-Fi"},
  {title: "The Godfather", description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", duration_minutes: 175, release_date: "1972-03-24", rating: 9.2, director: "Francis Ford Coppola", actor: "Marlon Brando", genre: "Crime"},
  {title: "The Dark Knight", description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham.", duration_minutes: 152, release_date: "2008-07-18", rating: 9.0, director: "Christopher Nolan", actor: "Christian Bale", genre: "Action"},
  {title: "Pulp Fiction", description: "The lives of two mob hitmen, a boxer, a gangster and his wife intertwine in four tales of violence.", duration_minutes: 154, release_date: "1994-10-14", rating: 8.9, director: "Quentin Tarantino", actor: "John Travolta", genre: "Crime"},
  {title: "The big bag theory", description: "The lives of two mob hitmen, a boxer, a gangster and his wife intertwine in four tales of violence.", duration_minutes: 154, release_date: "2026-10-14", rating: 8.9, director: "Quentin Tarantino", actor: "John Travolta", genre: "Crime"},
  {title: "2 broke girls", description: "2 Broke Girls is an American sitcom (2011–2017) following two young women—Max (Kat Dennings), a cynical, street-smart waitress, and Caroline (Beth Behrs), a formerly wealthy debutante turned waitress—who become unlikely friends and roommates while working in a Brooklyn diner. They work toward launching a cupcake business, with episodes tracking their goal of raising $250,000", duration_minutes: 154, release_date: "2026-10-14", rating: 8.9, director: "Quentin Tarantino", actor: "John Travolta", genre: "Crime"}

]

movies.each_with_index do |data, i|
  # Create the movie record
  movie = Movie.create!(data)
  begin
    file = URI.open("https://media.themoviedb.org/t/p/w780/tJao1qKLYMKzyOvLHxxHeV6Jxzc.jpg")
    movie.poster.attach(
      io: file,
      filename: "movie_poster_#{i}.jpg",
      content_type: 'image/jpeg'
    )
    puts "✅ Seeded: #{movie.title}"
  rescue => e
    puts "❌ Failed to attach image for #{movie.title}: #{e.message}"
  end
end

puts "---"
puts "Created #{Movie.count} movies successfully!"



Theater.destroy_all

theaters = [
  { name: "CineGlass Hanoi", city: "Hà Nội", address: "Thong Nhat Park", phone: "024-333-4444", email: "hanoi@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" },
  { name: "CineGlass Saigon", city: "TP. Hồ Chí Minh", address: "District 1", phone: "028-555-6666", email: "saigon@cineglass.com", description: "Our flagship theater featuring IMAX and luxury recliner seats.", opening_time: "08:00 AM", closing_time: "11:00 PM" }





]

theaters.each_with_index do |data, i|
  t = Theater.create!(data)
  # Download a real image from a URL and attach it
  # Using a placeholder service or a specific URL you like
  file = URI.open("https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=800")
  t.main_image.attach(
    io: file,
    filename: "theater_#{i}.jpg",
    content_type: 'image/jpeg'
  )
  puts "Seeded #{t.name} with image."
end





puts "Created #{Theater.count} theaters!"
