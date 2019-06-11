class Comment < ApplicationRecord
  # Direct associations

  belongs_to :author,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
