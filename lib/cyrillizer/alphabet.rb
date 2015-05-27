# encoding: utf-8

require 'yaml'

module Cyrillizer
  attr_writer :language

  class << self
    def language
      @language ||= :mk
    end

    def language=(language)
      @language = language
      @alphabet = nil
    end

    def alphabet_to_lat
      @alphabet_to_lat ||= YAML.load_file(File.join(File.dirname(__FILE__), "../alphabets/#{lang_mapping[language.to_sym][0]}.yml"))
    end

    def alphabet_to_cyr
      @alphabet_to_cyr ||= YAML.load_file(File.join(File.dirname(__FILE__), "../alphabets/#{lang_mapping[language.to_sym][1]}.yml"))
    end

    def lang_mapping
      {
        mk: ["mk_to_lat", "lat_to_mk"],
        bg: ["bg", "bg"],
        rs: ["rs", "rs"],
        uz: ["uz", "uz"]
      }
    end
  end
end
