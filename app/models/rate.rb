class Rate < ApplicationRecord
	belongs_to :question
	belongs_to :user

	validates :point, presence: true
	validates :flag, presence: true
	validates :user_id, presence: true
  	validates :question_id, presence: true
end
