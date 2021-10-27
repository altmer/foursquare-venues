module Api
  class EchoesController < ApplicationController
    def index
      @result = params[:say] || 'something'
    end
  end
end
