class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :completed_walks
  has_many :walks
  has_many :finished_walks, through: :completed_walks, class: "Walk"
  has_many :ratings
  has_many :users, through: :ratings
end
