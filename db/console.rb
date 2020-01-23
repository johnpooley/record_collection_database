require("pry")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("sql_runner.rb")


Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'artist_name' => 'Iron Maiden'})
artist1.save()
album1 = Album.new({'title' => 'The Number Of The Beast', 'genre' => 'heavy metal', 'artist_id' => artist1.id})
album1.save()









binding.pry
nil
