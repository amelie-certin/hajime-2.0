# frozen_string_literal: true

class CharactersController < ApplicationController
  def new
    @character = CharacterBuilder.new.randomize.build
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def index
    @characters = Character.all
  end

  def character_params
    params
      .require(:character)
      .permit(:name, :arms, :legs, :strength, :health, :focus, :charisma, :defense, :speed, :avatar)
  end
end
