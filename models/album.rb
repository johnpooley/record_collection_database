class Album


  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
  @title = options['title']
  @genre = options['genre'].to_i
  @id = options['id'].to_i if options['id']
  @artist_id = options['artist_id'].to_i

end


def save()
  sql = "INSERT INTO albums (title, genre, artist_id)
  VALUES ($1, $2, $3)
  RETURNING id"
  values = [@title, @genre, @artist_id]
  result = SqlRunner.run(sql, values)
  @id = result[0]["id"].to_i
end


def self.delete_all()
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM albums where id = $1"
  values = [@id]
  SqlRunner.run(sql,values)
end

def delete_by_artist()
  sql = "DELETE FROM albums where artist_id = $4"
  values = [@artist_id]
  SqlRunner.run(sql,values)
end






end
