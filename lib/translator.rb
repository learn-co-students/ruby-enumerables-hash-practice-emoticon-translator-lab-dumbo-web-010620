require "yaml"
require "pry"


def load_library(file)
  
  emoticons = YAML.load_file(file)
  
  hash = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  emoticons.each do |key,value|
    hash[:get_emoticon][value[0]] = emoticons[key][1]
    hash[:get_meaning][value[1]] = key
    
 end 
 hash 
end

def get_japanese_emoticon(file, emoticon)
 emotes = load_library(file)
 
 if emotes[:get_emoticon].include?(emoticon)
   emotes[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end 
  
end

def get_english_meaning(file,emoticon)
  emotes = load_library(file)
  
  if emotes[:get_meaning].include?(emoticon)
    emotes[:get_meaning][emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end 
end