class User < ApplicationRecord
  validations: :email, presence: true, uniqueness: true
end