class AnimalsController < ApplicationController
    def index
      animals = Animal.all
      render json: animals
    end

    def show
    one_animal = Animal.find(params[:id]).as_json(include: :sightings)
    render json: one_animal
    end

    def create 
    create_animal = Animal.create(animal_params)
    if create_animal.valid? 
        render json: create_animal
    else 
        render json: create_animal.errors
    end
    end 

    def update 
    one_animal = Animal.find(params[:id])
    one_animal.update(animal_params)
    if one_animal.valid? 
        render json: one_animal
    else 
        render json: one_animal.errors
    end
    end

    def destroy
    one_animal = Animal.find(params[:id])
    if one_animal.destroy
        render json: one_animal
    else
        render json: one_animal.errors
    end
    end


    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
end
