class AudioController < ApplicationController

  # caches_page :index

  def index
    puts "Trying to glob #{Rails.public_path}/audio/*.mp3"
    @files = Dir.glob("#{Rails.public_path}/audio/*.mp3")
    @files.sort! if @files
  end
  
end
