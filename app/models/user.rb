class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rates, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def rated? question_id
  	rates.find_by question_id: question_id
  end

	def tyledung user_id
		@user = User.find_by_id user_id
		@sum = 0
		if @user.rates.present?
			@user.rates.each do |rate|
				if rate.flag == 1
					@sum += rate.point
				else
					@sum += (100 - rate.point)
				end
			end
			return (@sum.to_f.round(2) / @user.rates.count)
		else
			return 0
		end
	end

	def diemdanhgia user_id
		@user = User.find_by_id user_id
		if @user.rates.present?
			return @user.rates.where(flag: 0).average(:point)
		else
			return 0
		end
	end

end
