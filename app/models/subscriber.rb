class Subscriber < ApplicationRecord
  validates :f_name, :l_name, :email, :country,
            presence: true


end
