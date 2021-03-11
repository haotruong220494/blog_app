class RobotsTxtsController < ApplicationController
  layout nil

  def index
  	render "index", layout: false, content_type: "text/plain"
  end
end
