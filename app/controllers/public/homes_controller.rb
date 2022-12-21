class Public::HomesController < ApplicationController

  def top
    @review = Review.all
  end

end
