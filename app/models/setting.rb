class Setting < ActiveRecord::Base
  enum system: [ :SoftCargo, :Ats, :Logisis ]

  scope :ordered,     -> { order(sort_order: :asc) }
  scope :soft_cargo,  -> { where(system: 0).ordered.pluck(:name, :value) }
  scope :ats,         -> { where(system: 1).ordered.pluck(:name, :value) }
  scope :logisis,     -> { where(system: 2).ordered.pluck(:name, :value) }


  def self.get(system, name)
    settings = send(system).to_h
    settings.has_key?(name) ? settings[name] :  (raise "Unkown setting: #{name.to_s}")
  end

  def self.header(system)
    Setting.send(system).map do |setting|
      setting.last if !['row_start','id','created_at', 'updated_at'].include?(setting.first)
    end
  end
end
