class Album

  def initialize(options)
  @title = options['title']
  @genre = options['genre'].to_i
  @id = options['id'].to_i if options['id']
  @artist_id = options['artist_id'].to_i

end

end
