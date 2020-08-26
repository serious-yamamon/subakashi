class Admin::WritersController < ApplicationController
  def index
    @writers = Writer.all.order(:id)
  end

  def edit
    @writer = Writer.find_by(id: params[:id])
  end

  def update
    @writer = Writer.find_by(id: params[:id])
    @writer.name = params[:name]
    @writer.code = params[:code]
    @writer.status = params[:status]
    @writer.twitter = params[:twitter]
    @writer.instagram = params[:instagram]
    @writer.youtube = params[:youtube]
    @writer.about = params[:about]
    @writer.description = params[:description]
    @writer.save
    redirect_to admin_writers_path
  end

  def prof_img
    @writer = Writer.find_by(id: params[:id])
    @writer.image = "prof_#{@writer.id}.jpg"
    @writer.save
    prof_image = params[:image]
    File.binwrite("/assets/#{@writer.image}", prof_image.read)

    redirect_to admin_writers_path
  end
end
