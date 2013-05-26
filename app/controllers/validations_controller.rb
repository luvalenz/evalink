class ValidationsController < ApplicationController
  def new
    @validation = Validation.new

    @ability = Ability.find(params[:ability_id])
    @validation.user = current_user
    @validation.ability = @ability


    if @validation.save
      redirect_to @ability
    end

  end

  def create
  end

end
