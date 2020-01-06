class RacesController < ApplicationController

      def new
        @race = Race.new
        @errors = flash[:errors]
      end

      def create
        @race = Race.new(race_params)
          if @race.valid?
            flash[:success] = "Good job filling out the form!"
            @race.save
            redirect_to new_character_path
          else
            flash[:errors] = @race.errors.full_messages            
            render :new
          end
      end

      private

      def race_params
        params.require(:race).permit(:name)
      end
end
