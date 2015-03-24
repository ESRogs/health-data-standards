if RUBY_PLATFORM != "java"

  require_relative 'validation_error'
  require_relative 'base_validator'
  require_relative 'schema_validator'
  require_relative 'schematron_validator'

  module HealthDataStandards
    module Validate

      CDA_SDTC_SCHEMA = 'resources/schema/infrastructure/cda/CDA_SDTC.xsd'
      QRDA_CAT1_SCHEMATRON = 'resources/schematron/qrda/cat_1/QRDA Category I Release 2.sch'
      QRDA_CAT3_SCHEMATRON = 'resources/schematron/qrda/cat_3/QRDA Category III.sch'
      BASE_DIR = File.expand_path("../../../../", __FILE__)

      class CDA < Schema::Validator
        include Singleton

        def initialize
          super("CDA SDTC Validator", File.join(BASE_DIR, CDA_SDTC_SCHEMA))
        end

      end

      class Cat1 < Schematron::Validator
        include Singleton

        def initialize
          super("QRDA Cat 1 Validator", File.join(BASE_DIR, QRDA_CAT1_SCHEMATRON))
        end

      end

      class Cat3 < Schematron::Validator
        include Singleton

        def initialize
          super("QRDA Cat 3 Validator", File.join(BASE_DIR, QRDA_CAT3_SCHEMATRON))
        end
      end
    end
  end
end
