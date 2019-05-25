require 'open-uri'
require 'json'

class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.photo_cache.nil?
      url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=' + @cocktail.name
      result = JSON.parse(open(url).read)
      mar = result['drinks']
      unless result['drinks'] == nil
        url = mar[0]['strDrinkThumb']
        @cocktail[:photo] = url + '.jpg'  ##very unstable, need better way of doing
      end
    end

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    # raise
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  # def delete_img
  #   @cocktail = Cocktail.find(params[:id])
  #   @cocktail.photo = ""
  #   @cocktail.save
  #   redirect_to cocktail_path(@cocktail)
  # end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :detail)
  end

end


          # <% unless result['drinks'] == nil %>
          #   <% mar = result['drinks'] %>
          #   <img src= <%= mar[0]['strDrinkThumb'] %> alt="didnt" height= "400">
          # <% end %>

    #       <%= cl_image_tag("hw2h05m2yqg5l7olzw5e.jpg",
    #   width: 400, height: 300, crop: :fill) %>

    # <!-- for face detection -->
    # <%= cl_image_tag("v1558693420/dxifex5uisqgegesatsb.jpg",
    #       width: 150, height: 150, crop: :thumb, gravity: :face) %>
