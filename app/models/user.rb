class User < ApplicationRecord
    validates_uniqueness_of :auth0_id
end
