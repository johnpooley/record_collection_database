class Artist

  attr_reader :artist_name, :id

  def initialize(options)
    @artist_name = options['artist_name']
    @id = options['id'].to_i if options['id']
  end


  def save()
    sql = "INSERT INTO artists (artist_name)
    VALUES ($1)
    RETURNING id"
    values = [@artist_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql="SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map{|name| Artist.new(name)}
  end

  def albums_by_artist()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    discography = results.map{|name| Album.new(name)}
    return discography
  end





end
