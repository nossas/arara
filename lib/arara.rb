require "arara/version"
require "httparty"
require "json"

module Arara
  class Question
    URL = "http://verdadeouconsequencia.org.br/questions.json"

    def self.find_all_by_category_id category_id, options = {}
      JSON.parse(HTTParty.get(URL, :query => {:token => ENV["VOC_TOKEN"], :category_id => category_id}.merge(options)).body)
    end
  end
end
