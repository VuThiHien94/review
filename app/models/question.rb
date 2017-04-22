class Question < ApplicationRecord
	has_many :rates, dependent: :destroy

	validates :file1, presence: true
	validates :file2, presence: true
	validates :flag, presence: true

end
