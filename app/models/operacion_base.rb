class OperacionBase < ActiveRecord::Base
  self.abstract_class = true
  def self.table_name_prefix
    'operacion_'
  end
end
