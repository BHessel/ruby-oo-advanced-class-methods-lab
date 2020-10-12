require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song 
  end


  def self.new_by_name(name)
    song = self.new
    song.name = name
    song     
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song 
  end

  def self.find_by_name(name)
    #binding.pry
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  
  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    split_file_no_mp3 = file_name.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_file_no_mp3[1]
    song.artist_name = split_file_no_mp3[0]
    song
    #binding.pry
  end
  def self.create_from_filename(file_name)
    split_file_no_mp3 = file_name.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_file_no_mp3[1]
    song.artist_name = split_file_no_mp3[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
