class WelcomeController < ApplicationController
  def index
    render html: "Hello World"
  end

  def about
    render html: "Hello World About"
  end
end
