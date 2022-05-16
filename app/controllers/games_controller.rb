require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    alphabet = [*'a'..'z']
    @letters = alphabet.sample(10)
  end

  def score
    answer = params[:answer].split('')
    letters = params[:letters]
    if answer.each { |i| break unless letters.include?(i) }
      @is_valid_word = true
      url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
      response_string = URI.open(url).read #string
      word_data = JSON.parse(response_string) #hash
      @is_english_word = word_data['found']
    else
      @is_valid_word = false
    end
  end
end
