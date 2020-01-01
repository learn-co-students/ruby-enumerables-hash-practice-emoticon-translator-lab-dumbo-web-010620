# require modules here
require 'YAML'
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)

  new_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |key,value|
    # binding.pry
    new_hash["get_emoticon"][value[0]] = emoticons[key][1]
    new_hash["get_meaning"][value[1]] = key 
  end 
  new_hash
end


def get_japanese_emoticon(file_path, emoticon)
  new_hash = load_library(file_path)

  if new_hash["get_emoticon"].include?(emoticon)
    new_hash["get_emoticon"][emoticon]
  else return "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(file_path, emoticon)
  new_hash = load_library(file_path) 

  
  if new_hash["get_meaning"].include?(emoticon)
    new_hash["get_meaning"][emoticon]
  else return "Sorry, that emoticon was not found"
  end 
end