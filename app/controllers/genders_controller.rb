class GendersController < ApplicationController

    def new
      @gender = Gender.new
      @errors = flash[:errors]
    end

    def create
      @gender = Gender.new(gender_params)
        if @gender.valid?
          @gender.save
          redirect_to new_character_path
          flash[:success] = "Good job filling out the form!"
        else
          flash[:errors] = @gender.errors.full_messages          render :new
        end
    end

    private

    def get_gender
      @gender = Gender.find(params[:id])
    end

    def gender_params
      params.require(:gender).permit(:name)
    end

end
