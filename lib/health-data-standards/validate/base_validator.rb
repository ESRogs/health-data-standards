module HealthDataStandards
  module Validate
    module BaseValidator

      def build_error(msg, loc, file_name)
        ValidationError.new(message: msg, location: loc, file_name: file_name, validator: @name)
      end

      def get_document(doc)
        (doc.kind_of? Nokogiri::XML::Document)? doc : Nokogiri::XML(doc.to_s)
      end
    end

  end
end
