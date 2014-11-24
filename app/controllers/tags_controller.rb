class TagsController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    @tags = @game.tags.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @game = Game.find(params[:game_id])
    @tag = @game.tags.build
    @position_x = params[:position_x]
    @position_y = params[:position_y]

    respond_to do |format|
       format.js { render :new, status: 200, location: [@game, @tag] }
    end
  end

  def create
    @game = Game.find(params[:game_id])
    @tag = @game.tags.build(tag_params)

    respond_to do |format|
      if @tag.save
        if @game.tags.length == Character.count
          format.js { redirect_to edit_game_url(@game) }
        else
          format.html { redirect_to [@game, @tag], notice: 'Tag was successfully created.' }
          format.js { render :show, status: :created, location: [@game, @tag] }
        end
      else
        format.html { render :new }
        format.js { render json: @tag.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
  end

  def destroy
    @tag = Tag.find(params[:id])
    @name = @tag.character.name
    @tag.destroy
    respond_to do |format|
      format.html
      format.js { render :destroy, status: 200 }
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:character_id, :position_x, :position_y)
  end

end
