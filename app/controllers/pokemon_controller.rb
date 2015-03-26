class PokemonController < ApplicationController
	
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer = current_trainer
		@pokemon.save 
        redirect_to root_path
	end

	def damage 
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health -= 10
		if @pokemon.health <= 0
			@pokemon.destroy
		else
			@pokemon.save
		end
		redirect_to trainer_path(current_trainer)
	end

	def new
        @pokemon = Pokemon.new 
    end

	def create
	    @pokemon = Pokemon.create(pokemon_params)
	    @pokemon.health = 100
	    @pokemon.level = 1
	    @pokemon.trainer = current_trainer
	    if @pokemon.save 
	        redirect_to trainer_path(current_trainer)
	    else
	        flash[:error] = @pokemon.errors.full_messages.to_sentence
	        render "new" 
	    end
	end

	private

  	def pokemon_params
    	params.require(:pokemon).permit(:name) 
  	end

end
