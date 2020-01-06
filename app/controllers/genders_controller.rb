class GendersController < ApplicationController

    def new
      @gender = Gender.new
      @errors = flash[:errors]
    end

    def create
      @gender = Gender.new(gender_params)
        if @gender.valid?
          flash[:success] = "Good job filling out the form!"
          @gender.save
          redirect_to new_character_path
        else
          flash[:errors] = @gender.errors.full_messages          
        end
    end

    private

    def gender_params
      params.require(:gender).permit(:name)
    end

end
