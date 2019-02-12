class RoverinputsController < ApplicationController

	layout "application"
	
	def index
		Roverinput.delete_all
	end

	def new
		@mrinput = Roverinput.new
	end

	def show
		@mrinput = Roverinput.find(params[:id])
	end
	
	def create
		@mrinput = Roverinput.new(new_inst_params)

		if(@mrinput.save)
			redirect_to id_roverinputs_path(@mrinput.id)
		else
			render 'new'
		end
	end

	private def new_inst_params
		params.require(:ridata).permit(:sopx, :sopy, :r1px, :r1py, :r1pface, :inst1, :r2px, :r2py, :r2pface, :inst2)
	end
end
