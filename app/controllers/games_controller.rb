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
    respond_to do |format|
       format.js { render :edit, status: 200, location: @game }
       format.html {redirect_to @game, notice: "You won!!" }
    end
  end

  def update
  end

  def destroy
  end
end
