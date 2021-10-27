module Api
  class EchoesController < ApplicationController
    def index
      @result = params[:say] || 'something'
      respond_to do |format|
        format.json
      end
    end
  end
end
