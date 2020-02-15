class GestionBase < ActiveRecord::Base
  self.abstract_class = true
  def self.table_name_prefix
    'gestion_'
  end
end
