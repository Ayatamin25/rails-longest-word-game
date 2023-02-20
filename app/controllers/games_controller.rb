class GamesController < ApplicationController

  require 'json'
  require 'open-uri'

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @input = params[:score]
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@input}"
    word_serialized = URI.open(url).read
    word = JSON.parse(word_serialized)

    if word['found'] && @letters.split('').include?(@input.split(''))
      @congrats = "Congratulations #{@input} is a valid English Word!"
    else
      @congrats = "sorry but #{@input} cant be built out of #{@letters} "
    end
    @congrats = "sorry but #{@input} does not seem to be a valid english word.." if word['found'] == false
  end
end

# I have params word back
# check if my word is english
# if it is then check if it is in in the grid
# if it is display "Congratulations #{@input} is a valid English Word!"
# if it is not in the grid display "sorry but #{@input} cant be built out of #{@letters} "
# if it is not display
