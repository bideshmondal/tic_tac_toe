class HomeController < ApplicationController

  def index

  end

  def create
    player1 = []
    player2 = []
    (0..2).each do |r|
      (0..2).each do |c|
        if params["#{r}#{c}"] == "0"
          player1 << "#{r}#{c}"
        else
          player2 << "#{r}#{c}"
        end
      end
    end
    flash[:notice] = calculated_result(player1,player2)
    redirect_to root_url
  end

  def calculated_result(player1,player2)
    result= {"one"=>["00","01","02"],"two"=>["10","11","12"],"three"=>["20","21","22"],"four"=>["00","10","20"],"five"=>["10","11","21"],"six"=>["02","12","22"],"seven"=>["00","11","22"],"eight"=>["02","11","20"]}
    won = "no one own"
    result.each do |key, value|
      if player2 & value == value
        won = "player x has won"
      elsif player1 & value == value
        won = "player 0 has won"
      end
    end
    return won
  end

end
