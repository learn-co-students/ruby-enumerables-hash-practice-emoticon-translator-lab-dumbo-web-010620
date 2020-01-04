# require modules here
require "yaml"

def load_library(file_path)
  result = YAML.load_file(file_path)
  final_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  #print result
  #meaning = result.keys; #keys
  #emoticon = result.values #hash

  result.each do |key, hash|
    final_hash["get_meaning"][hash[1]] = key
    final_hash["get_emoticon"][hash[0]] = hash[1]
  end
  final_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  if hash["get_emoticon"][emoticon]
    japanese_emoticon = hash["get_emoticon"][emoticon]
  else
    japanese_emoticon = "Sorry, that emoticon was not found"
  end
  japanese_emoticon
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  if hash["get_meaning"][emoticon]
    english_meaning = hash["get_meaning"][emoticon]
  else
    english_meaning = "Sorry, that emoticon was not found"
  end
  english_meaning
end
