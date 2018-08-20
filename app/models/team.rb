class Team < ApplicationRecord

  validates :name,
   :length => { :maximum => 16}


end
