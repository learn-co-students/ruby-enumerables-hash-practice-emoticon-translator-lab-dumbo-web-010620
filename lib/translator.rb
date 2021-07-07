require 'yaml'
require 'pry'


def load_library(file_path)
    file_path = YAML.load_file('./lib/emoticons.yml')
    new_hash = {
      :get_meaning => {},
      :get_emoticon => {}
    }
    translate_hash = file_path.reduce({}) do |memo, key|
      new_hash[:get_meaning]["#{key[1][1]}"] = key[0]
      new_hash[:get_emoticon]["#{key[1][0]}"] = key[1][1]
      #new_hash[:get_meaning] = key[1][1]
      #binding.pry
      end
    new_hash
end
  

def get_japanese_emoticon(file_path = YAML.load_file('./lib/emoticons.yml'),emoticon)
  emo_list = load_library(file_path)
  #we want to access emo_list[:get_emoticon] values when the grinning emoticon is typed
  j_emo = emo_list[:get_emoticon][emoticon]
  if j_emo
    j_emo
  else
    "Sorry, that emoticon was not found"
  end
  #binding.pry
end

def get_english_meaning(file_path = YAML.load_file('./lib/emoticons.yml'),emoticon)
  emo_list = load_library(file_path)
  #we want to access the emo_list[:get_meaning] values when the japanese emoticon is type
  e_meaning = emo_list[:get_meaning][emoticon]
  if e_meaning
    e_meaning
  else
    "Sorry, that emoticon was not found"
  end
end
