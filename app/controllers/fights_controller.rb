# frozen_string_literal: true

class FightsController < ApplicationController
  def new
    @characters = Character.all
    @list = @characters.collect { |character| [character.name, character.id] }
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(fight_params)
    @characters = Character.all
    @list = @characters.collect { |character| [character.name, character.id] }

    if @fight.valid?
      battle_result = Battle.run(player: @fight.player, opponent: @fight.opponent)
      @fight.winner = battle_result[:winner]
      if @fight.save
        redirect_to @fight
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @fight = Fight.find(params[:id])
  end

  def fight_params
    params.require(:fight).permit(:player_id, :opponent_id)
  end
end
