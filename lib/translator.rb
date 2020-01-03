# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  direct_file = YAML.load_file(file)
  result = {}
  result[:get_emoticon] = {}
  result[:get_meaning] = {}
  direct_file.map { |m, (eng, jap)|
    # binding.pry
    if !result[:get_meaning].has_key?(jap)
      result[:get_meaning][jap] = {}
    end
    if !result[:get_meaning][jap].has_key?(m)
      result[:get_meaning][jap] = m
    end
    if !result[:get_emoticon].has_key?(eng)
      result[:get_emoticon][eng] = {}
    end
    if !result[:get_emoticon][eng].has_key?(jap)
      result[:get_emoticon][eng] = jap
    end
  }
  # binding.pry
  return result
end

def get_japanese_emoticon(file, emoji)
   jap_directory = load_library(file)
   jap_emo = "Sorry, that emoticon was not found"
     if jap_directory[:get_emoticon].has_key?(emoji)
       jap_emo = jap_directory[:get_emoticon][emoji]
     end
 return jap_emo
end

def get_english_meaning(file, emoji)
  eng_directory = load_library(file)
  emo_mean = "Sorry, that emoticon was not found"
    if eng_directory[:get_meaning].has_key?(emoji)
      emo_mean = eng_directory[:get_meaning][emoji]
      # binding.pry
    end
  return emo_mean
end
