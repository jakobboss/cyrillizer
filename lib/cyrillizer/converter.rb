# encoding: utf-8

module Cyrillizer
  module Converter

    def to_cyr
      code(self.dup, alphabet(:to_cyr))
    end

    def to_cyr!
      code(self, alphabet(:to_cyr))
    end

    def to_lat
      code(self.dup, alphabet(:to_lat))
    end

    def to_lat!
      code(self, alphabet(:to_lat))
    end

    private

    def code(text, alphabet)
      alphabet.each do |from, to|
        text.gsub!(from, to)
      end
      text
    end

    def alphabet type
      case type
      when :to_lat
        Cyrillizer.alphabet_to_lat
      when :to_cyr
        Cyrillizer.alphabet_to_cyr
      end
    end
  end
end
