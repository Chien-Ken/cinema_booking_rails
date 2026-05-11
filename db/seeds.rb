Movie.destroy_all

Movie.create!([
  {
    title: "The killer",
    description: "A thief who steals corporate secrets through the use of dream-sharing technology.",
    duration_minutes: 148,
    release_date: "2025-07-16",
    rating: 8.8,
    director: "Christopher Nolan",
    actor: "Leonardo DiCaprio",
    genre: "Sci-Fi",
    poster_url: "https://media.themoviedb.org/t/p/w780/tJao1qKLYMKzyOvLHxxHeV6Jxzc.jpg"
  },
  {
    title: "The Batman",
    description: "When a sadistic serial killer begins murdering key political figures in Gotham...",
    duration_minutes: 176,
    release_date: "2022-03-04",
    rating: 7.8,
    director: "Matt Reeves",
    actor: "Robert Pattinson",
    genre: "Action/Crime",
    poster_url: "https://ichef.bbci.co.uk/images/ic/480xn/p0brnp0b.jpg.webp"
  },
  {
    title: "God of gamblers",
    description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
    duration_minutes: 169,
    release_date: "2025-11-09",
    rating: 8.7,
    director: "Christopher Nolan",
    actor: "Matthew McConaughey",
    genre: "Sci-Fi/Drama",
    poster_url: "https://photo.znews.vn/w660/Uploaded/xbhunku/2016_02_15/gg3.jpg"
  },
   {
    title: "Jouney to the west",
    description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
    duration_minutes: 169,
    release_date: "2025-11-08",
    rating: 8.7,
    director: "Christopher Nolan",
    actor: "Matthew McConaughey",
    genre: "Sci-Fi/Drama",
    poster_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwW6JiXMgCTZn6JmvI36DXtHJVIDtZphKrQg&s"
  },
   {
    title: "Friends",
    description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
    duration_minutes: 169,
    release_date: "2026-11-08",
    rating: 8.7,
    director: "Christopher Nolan",
    actor: "Matthew McConaughey",
    genre: "Sci-Fi/Drama",
    poster_url: "https://m.media-amazon.com/images/M/MV5BOTU2YmM5ZjctOGVlMC00YTczLTljM2MtYjhlNGI5YWMyZjFkXkEyXkFqcGc@._V1_QL75_UY281_CR1,0,190,281_.jpg"
  },
   {
    title: "2 broke girls",
    description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
    duration_minutes: 169,
    release_date: "2026-11-08",
    rating: 8.7,
    director: "Christopher Nolan",
    actor: "Matthew McConaughey",
    genre: "Sci-Fi/Drama",
    poster_url: "https://m.media-amazon.com/images/M/MV5BMTYxMDA3Mzg5NV5BMl5BanBnXkFtZTgwNDIxOTcwMDI@._V1_FMjpg_UX1000_.jpg"
  },
   {
    title: "Hard Boiled",
    description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
    duration_minutes: 169,
    release_date: "2026-10-08",
    rating: 8.7,
    director: "Christopher Nolan",
    actor: "Matthew McConaughey",
    genre: "Sci-Fi/Drama",
    poster_url: "https://m.media-amazon.com/images/I/81BILNxlj3L._AC_UF1000,1000_QL80_.jpg"
  },
   {
    title: "The matrix",
    description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
    duration_minutes: 169,
    release_date: "2026-10-08",
    rating: 8.7,
    director: "Christopher Nolan",
    actor: "Matthew McConaughey",
    genre: "Sci-Fi/Drama",
    poster_url: "data:image/jpeg;base64,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"
  },
   {
    title: "Kung fu Panda",
    description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
    duration_minutes: 169,
    release_date: "2026-10-08",
    rating: 8.7,
    director: "Christopher Nolan",
    actor: "Matthew McConaughey",
    genre: "Sci-Fi/Drama",
    poster_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNTogLqSys7M3eDE9RI4dh_G7NDR4_2vbnLw&s"
  },
   {
    title: "Terminator",
    description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
    duration_minutes: 169,
    release_date: "2026-10-08",
    rating: 8.7,
    director: "Christopher Nolan",
    actor: "Matthew McConaughey",
    genre: "Sci-Fi/Drama",
    poster_url: "https://upload.wikimedia.org/wikipedia/en/b/b9/Terminator-2-judgement-day.jpg"
  },
   {
    title: "God of gambler 2",
    description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
    duration_minutes: 169,
    release_date: "2026-10-08",
    rating: 8.7,
    director: "Christopher Nolan",
    actor: "Matthew McConaughey",
    genre: "Sci-Fi/Drama",
    poster_url: "https://m.media-amazon.com/images/I/81BILNxlj3L._AC_UF1000,1000_QL80_.jpg"
  },
   {
    title: "Fast and furious 9",
    description: "A team of explorers travel through a wormhole in space to ensure humanity's survival.",
    duration_minutes: 169,
    release_date: "2026-10-08",
    rating: 8.7,
    director: "Christopher Nolan",
    actor: "Matthew McConaughey",
    genre: "Sci-Fi/Drama",
    poster_url: "https://m.media-amazon.com/images/I/81BILNxlj3L._AC_UF1000,1000_QL80_.jpg"
  }
])

puts "Successfully created #{Movie.count} movies for CineGlass!"


Theater.destroy_all

Theater.create!([
  {
    name: "CineGlass Hoan Kiem",
    address: "123 Hang Bac Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
  {
    name: "CineGlass West Lake",
    address: "45 Lac Long Quan",
    city: "Hanoi",
    phone: "024-555-6666",
    description: "Beautiful lakeside view with high-tech Dolby Atmos sound systems.",
    image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRVDKBYqoZUpwVD0wKnpMEG7XLKhaMzYlUiA&s",
    opening_time: "09:00 AM",
    closing_time: "12:00 AM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Ba Dinh",
    address: "789 Dien Bien Phu Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Ha Dong",
    address: "456 Nguyen Trai Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Cau Giay",
    address: "321 Pham Van Dong Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Long Bien",
    address: "654 Nguyen Van Cu Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Thanh Xuan",
    address: "987 Khuat Duy Tien Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Long Bien",
    address: "654 Nguyen Van Cu Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Kim Ma",
    address: "321 Kim Ma Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Long Bien",
    address: "654 Nguyen Van Cu Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Thai Ha",
    address: "789 Thai Ha Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass old quarter",
    address: "789 Thai Ha Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass vinh tuy",
    address: "789 Vinh Tuy Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Dong Da",
    address: "456 Dong Da Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  },
   {
    name: "CineGlass Gia Lam",
    address: "123 Gia Lam Street",
    city: "Hanoi",
    phone: "024-333-4444",
    description: "Our flagship theater featuring IMAX and luxury recliner seats.",
    image_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070",
    opening_time: "08:00 AM",
    closing_time: "11:00 PM",
    email: "hoankiem@cineglass.com"
  }
])

puts "Created #{Theater.count} theaters!"
