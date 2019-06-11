class Restaurant < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  has_many   :favorites,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
