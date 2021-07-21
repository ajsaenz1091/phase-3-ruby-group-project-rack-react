class Language < ActiveRecord::Base 
    has_many :courses
    has_many :users, through: :courses
end


# -- users ---< courses >--- languages