class GamesController < ApplicationController

  def create
    @game = Game.create
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
    @game.update(:completed_at => Time.now)
    @game.update_score
    respond_to do |format|
       format.js { render :edit, status: 200, location: @game }
       format.html {redirect_to @game, notice: "You won!!" }
    end
  end

  def update
    @game = Game.find(params[:id])
    @high_scores = Game.high_scores
    respond_to do |format|
      if @game.update(game_params)
        format.js { render :update, status: 200, location: @game }
        format.html {redirect_to @game, notice: "Big Winner!!" }
      else
        format.html { render :edit }
        format.js { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:player_name)
  end
end
