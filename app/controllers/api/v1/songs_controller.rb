class Api::V1::SongsController < ApplicationController
  def index
    render json: SongSerializer.format_songs(Song.all)
  end

  def show
    begin
      render json: SongSerializer.format_song(Song.find(params[:id]))
    rescue ActiveRecord::RecordNotFound => exception
      render json: {
        errors: [
          {
            status: "404",
            message: exception.message
          }
        ]
      },
      status: :not_found
    end
  end

  def create
    begin
      song = Song.create!(song_params)
      render json: song, status: 201
    rescue ActiveRecord::RecordInvalid => exception
      require
      render json: {
        errors: [
          {
            status: "422",
            message: exception.message
          }
        ]
      },
      status: 422
    end
  end

  def update
    song = Song.find(params[:id])
    song.update(song_params)

    render json: SongSerializer.format_song(song)
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy

    head :no_content
  end

  private

  def song_params
    params.require(:song).permit(:song, :title, :length, :play_count, :artist_id)
  end
end