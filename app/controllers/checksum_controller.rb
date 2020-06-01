class ChecksumController < ApplicationController

  def index
    @checksum = nil
  end

  def create
    @checksum = Checksum.create_checksum(checksum_params[:input])
    render :index
  end

  private

  def checksum_params
    params.permit(:input)
  end

end
