require 'erubis'
require 'active_support'
require 'mongoid'
require 'uuid'
require 'builder'
require 'csv'
require 'nokogiri'
require 'ostruct'
require 'log4r'

# Freedom patches
require_relative 'health-data-standards/ext/symbol'
require_relative 'health-data-standards/ext/string'

require_relative 'health-data-standards/util/hl7_helper'
require_relative 'health-data-standards/util/code_system_helper'
require_relative 'health-data-standards/util/hqmf_template_helper'
require_relative 'health-data-standards/util/vs_api'

require_relative 'health-data-standards/export/template_helper'
require_relative 'health-data-standards/export/view_helper'
require_relative 'health-data-standards/export/rendering_context'
require_relative 'health-data-standards/export/c32'
require_relative 'health-data-standards/export/ccda'
require_relative 'health-data-standards/export/ccr'
require_relative 'health-data-standards/export/csv'
require_relative 'health-data-standards/export/helper/html_view_helper'
require_relative 'health-data-standards/export/html'
require_relative 'health-data-standards/export/hdata/metadata'

require_relative 'health-data-standards/export/helper/gc32_view_helper'
require_relative 'health-data-standards/export/green_c32/record'
require_relative 'health-data-standards/export/green_c32/entry'
require_relative 'health-data-standards/export/green_c32/export_generator'

require_relative 'health-data-standards/import/provider_import_utils'
require_relative 'health-data-standards/import/hdata/metadata_importer'

require_relative 'health-data-standards/models/thing_with_codes'
require_relative 'health-data-standards/models/result_value'
require_relative 'health-data-standards/models/coded_result_value'
require_relative 'health-data-standards/models/physical_quantity_result_value'
require_relative 'health-data-standards/models/cda_identifier'
require_relative 'health-data-standards/models/entry'
require_relative 'health-data-standards/models/allergy'
require_relative 'health-data-standards/models/encounter'
require_relative 'health-data-standards/models/condition'
require_relative 'health-data-standards/models/immunization'
require_relative 'health-data-standards/models/fulfillment_history'
require_relative 'health-data-standards/models/order_information'
require_relative 'health-data-standards/models/medication'
require_relative 'health-data-standards/models/procedure'
require_relative 'health-data-standards/models/lab_result'
require_relative 'health-data-standards/models/functional_status'
require_relative 'health-data-standards/models/medical_equipment'  
require_relative 'health-data-standards/models/record'
require_relative 'health-data-standards/models/personable'
require_relative 'health-data-standards/models/provider'
require_relative 'health-data-standards/models/provider_performance'
require_relative 'health-data-standards/models/support'
require_relative 'health-data-standards/models/vital_sign'
require_relative 'health-data-standards/models/insurance_provider'
require_relative 'health-data-standards/models/guarantor'
require_relative 'health-data-standards/models/person'
require_relative 'health-data-standards/models/organization'
require_relative 'health-data-standards/models/address'
require_relative 'health-data-standards/models/telecom'
require_relative 'health-data-standards/models/svs/value_set'
require_relative 'health-data-standards/models/svs/concept'
require_relative 'health-data-standards/models/facility'
require_relative 'health-data-standards/models/metadata/base'
require_relative 'health-data-standards/models/metadata/author'
require_relative 'health-data-standards/models/metadata/change_info'
require_relative 'health-data-standards/models/metadata/link_info'
require_relative 'health-data-standards/models/metadata/pedigree'

require_relative 'health-data-standards/export/qrda/entry_template_resolver'
require_relative 'health-data-standards/export/helper/cat1_view_helper'
require_relative 'health-data-standards/export/cat_1'

require_relative 'health-data-standards/import/cda/narrative_reference_handler'
require_relative 'health-data-standards/import/cda/entry_finder'
require_relative 'health-data-standards/import/cda/locatable_import_utils'
require_relative 'health-data-standards/import/cda/section_importer'
require_relative 'health-data-standards/import/cda/provider_importer'
require_relative 'health-data-standards/import/cda/organization_importer'
require_relative 'health-data-standards/import/cda/allergy_importer'
require_relative 'health-data-standards/import/cda/condition_importer'
require_relative 'health-data-standards/import/cda/encounter_importer'
require_relative 'health-data-standards/import/cda/medical_equipment_importer'
require_relative 'health-data-standards/import/cda/medication_importer'
require_relative 'health-data-standards/import/cda/procedure_importer'
require_relative 'health-data-standards/import/cda/result_importer'
require_relative 'health-data-standards/import/cda/vital_sign_importer'

require_relative 'health-data-standards/import/c32/condition_importer'
require_relative 'health-data-standards/import/c32/immunization_importer'
require_relative 'health-data-standards/import/c32/patient_importer'
require_relative 'health-data-standards/import/c32/insurance_provider_importer'
require_relative 'health-data-standards/import/c32/care_goal_importer'

require_relative 'health-data-standards/import/ccr/patient_importer'
require_relative 'health-data-standards/import/ccr/provider_importer'
require_relative 'health-data-standards/import/ccr/section_importer'
require_relative 'health-data-standards/import/ccr/result_importer'
require_relative 'health-data-standards/import/ccr/simple_importer'
require_relative 'health-data-standards/import/ccr/product_importer'

require_relative 'health-data-standards/import/ccda/patient_importer'
require_relative 'health-data-standards/import/ccda/allergy_importer'
require_relative 'health-data-standards/import/ccda/condition_importer'
require_relative 'health-data-standards/import/ccda/encounter_importer'
require_relative 'health-data-standards/import/ccda/immunization_importer'
require_relative 'health-data-standards/import/ccda/procedure_importer'
require_relative 'health-data-standards/import/ccda/result_importer'
require_relative 'health-data-standards/import/ccda/vital_sign_importer'
require_relative 'health-data-standards/import/ccda/medication_importer'
require_relative 'health-data-standards/import/ccda/care_goal_importer'
require_relative 'health-data-standards/import/ccda/medical_equipment_importer'
require_relative 'health-data-standards/import/ccda/insurance_provider_importer'

require_relative 'health-data-standards/import/green_c32/section_importer'
require_relative 'health-data-standards/import/green_c32/result_importer'
require_relative 'health-data-standards/import/green_c32/condition_importer'
require_relative 'health-data-standards/import/green_c32/vital_sign_importer'
require_relative 'health-data-standards/import/green_c32/procedure_importer'
require_relative 'health-data-standards/import/green_c32/encounter_importer'
require_relative 'health-data-standards/import/green_c32/medication_importer'
require_relative 'health-data-standards/import/green_c32/allergy_importer'
require_relative 'health-data-standards/import/green_c32/social_history_importer'
require_relative 'health-data-standards/import/green_c32/immunization_importer' 
require_relative 'health-data-standards/import/green_c32/support_importer'
require_relative 'health-data-standards/import/green_c32/advance_directive_importer'
require_relative 'health-data-standards/import/green_c32/medical_equipment_importer'
require_relative 'health-data-standards/import/green_c32/care_goal_importer'

require_relative 'health-data-standards/import/cat1/gestational_age_importer'
require_relative 'health-data-standards/import/cat1/procedure_intolerance_importer'
require_relative 'health-data-standards/import/cat1/procedure_performed_importer'
require_relative 'health-data-standards/import/cat1/procedure_order_importer'
require_relative 'health-data-standards/import/cat1/diagnosis_active_importer'
require_relative 'health-data-standards/import/cat1/diagnosis_inactive_importer'
require_relative 'health-data-standards/import/cat1/patient_importer'
require_relative 'health-data-standards/import/cat1/lab_order_importer'
require_relative 'health-data-standards/import/cat1/medication_dispensed_importer'
require_relative 'health-data-standards/import/cat1/encounter_order_importer'
require_relative 'health-data-standards/import/cat1/diagnostic_study_order_importer'
require_relative 'health-data-standards/import/cat1/tobacco_use_importer'
require_relative 'health-data-standards/import/cat1/entry_package'

require_relative 'health-data-standards/models/cqm/bundle'
require_relative 'health-data-standards/models/cqm/measure'
require_relative 'health-data-standards/import/bundle/importer'


module HealthDataStandards
  class << self
    attr_accessor :logger
  end
end

if defined?(Rails)
  require_relative 'health-data-standards/railtie' 
else
  HealthDataStandards.logger = Log4r::Logger.new("Health Data Standards")
  HealthDataStandards.logger.outputters = Log4r::Outputter.stdout
end
