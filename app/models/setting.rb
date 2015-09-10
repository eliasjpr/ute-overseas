class Setting < ActiveRecord::Base
  enum system: [ :SoftCargo, :Ats, :Logisis ]
end
