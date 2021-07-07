# require modules here
require "yaml"

def load_library(emoticons)
  # code goes here
  emoticons = YAML.load_file('./lib/emoticons.yml')
  hash={:get_meaning =>{}, :get_emoticon =>{}}
  emoticons.each do |meaning, translation|
    english=translation[0]
    japanese=translation[1]
    hash[:get_meaning][japanese]=meaning
    hash[:get_emoticon][english]=japanese
  end
  return hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library=load_library(file_path)
  if library[:get_emoticon].include?(emoticon)
    library[:get_emoticon][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library=load_library(file_path)
  if library[:get_meaning].include?(emoticon)
    library[:get_meaning][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end