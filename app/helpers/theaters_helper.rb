module TheatersHelper
  def theater_detail_image(theater)
    if theater.main_image.attached?
      # We use .variant to resize it to a cinematic 16:9 ratio (1280x720)
      # This ensures the top isn't cut off by huge original files
      theater.main_image.variant(resize_to_limit: [1280, 720])
    else
      # Path to a default image in your app/assets/images folder
      "placeholder-cinema.jpg"
    end
  end
end
