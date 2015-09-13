class Setting < ActiveRecord::Base
  enum system: [ :SoftCargo, :Ats, :Logisis ]


  scope :soft_cargo,  ->{ where(system: 0).pluck(:name, :value) }
  scope :ats,         ->{ where(system: 1).pluck(:name, :value)  }
  scope :logisis,     ->{ where(system: 2).pluck(:name, :value)  }


  def self.get(system, name)
    settings = send(system).to_h
    settings.has_key?(name) ? settings[name] :  (raise "Unkown setting: #{name.to_s}")
  end
end
