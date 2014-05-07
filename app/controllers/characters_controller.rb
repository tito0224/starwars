class CharactersController < ApplicationController

  def index
    ok(Character.all)
  end

  def show
    character = Character.find(params[:id])
    if character
      ok(character)
    else
      not_found
    end
  end
end
