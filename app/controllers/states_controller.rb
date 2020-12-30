class StatesController < ApplicationController

	def index
	  @states = CS.states(:IN)
	end

end	