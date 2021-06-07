class EmployersController < ApplicationController
    def index
        @employers = Employer.all
    end
    def show
        @employer = Employer.find(params[:id])
    end

    def destroy
        @employer = Employer.find(params[:id])
        @employer.destroy

        redirect_to employers_path
    end

    def new
        @employer = Employer.new
    end

    def create
        @employer = Employer.new(employer_params)
        if @employer.save
            redirect_to employers_path
          else
            render 'new'
          end
    end

    def edit
      @employer = Employer.find(params[:id])
    end

    def update
      @employer = Employer.find(params[:id])

      if @employer.update(employer_params)
        redirect_to employers_path
      else
        render 'edit'
      end
    end

    private

    def employer_params
        params.require(:employer).permit(:name, :email, :phone_number)
    end
end
