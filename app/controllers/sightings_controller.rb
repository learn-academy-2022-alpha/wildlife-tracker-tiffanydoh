class SightingsController < ApplicationController
    def index
    # sightings = Sighting.all
    #     render json: sightings
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
    end

    def show
    sighting = Sighting.find(params[:id])
    render json: sighting
    end

    def create
    create_sighting = Sighting.create(sighting_params)
    if create_sighting.valid? 
        render json: create_sighting
    else 
        render json: create_sighting.errors
    end
    end

    def update
    sighting = Sighting.find(params[:id])
    sighting.update(sighting_params)
    if sighting.valid?
        render json: sighting
    else 
        render json: sighting.errors
    end
    end

    def destroy 
    sighting = Sighting.find(params[:id])    
    if sighting.destroy
        render json: sighting
    else 
        render json: sighting.errors
    end
    end


    private 
    def sighting_params
        params.require(:sighting).permit(:date, :latitude, :longitude, :animal_id, :start_date, :end_date)
    end

end

