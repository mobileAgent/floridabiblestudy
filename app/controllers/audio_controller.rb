class AudioController < ApplicationController

  # caches_page :index

  def index
    puts "Trying to glob #{Rails.public_path}/audio/*.mp3"
    @files = Dir.glob("#{Rails.public_path}/audio/*.{mp3,pdf,jpg,docx,pptx,doc,ppt}")
    @files.sort!.reverse! if @files
  end
  
end
