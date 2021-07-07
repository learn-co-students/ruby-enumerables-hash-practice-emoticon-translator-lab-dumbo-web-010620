# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emote_hash = {:get_meaning => {}, :get_emoticon => {}}

  emoticons.each do |english_word, emote_set|
    emote_hash[:get_emoticon][emote_set.first] = emote_set.last
    emote_hash[:get_meaning][emote_set.last] = english_word
  end
  return emote_hash
  # code goes here
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash[:get_emoticon][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  return result
  # code goes here
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash[:get_meaning][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  return result
  # code goes here
end
