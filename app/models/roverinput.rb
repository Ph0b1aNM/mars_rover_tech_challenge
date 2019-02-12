class Roverinput < ApplicationRecord
	validates :sopx, presence: true,
						length: {minimum: 1}
end
