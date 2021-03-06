class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @shelters = Shelter.all
  end

  def show
    @pet = Pet.find(params[:id])
    @shelter = Shelter.find(@pet.shelter_id)
  end

  def new
    @shelter_id = params[:id]
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    shelter.pets.create(pet_params)

    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)

    redirect_to "/pets/#{pet.id}"
  end

  def delete
    Pet.destroy(params[:id])

    redirect_to '/pets'
  end

  def destroy
    Pet.destroy(params[:id])

    redirect_to '/pets'
  end

  private

    def pet_params
      params.permit(
        :image,
        :name,
        :description,
        :age,
        :sex,
        :status,
        :shelter_id
      )
    end
end
