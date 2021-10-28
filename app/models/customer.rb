class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  # enum is_active: { Available: true,  Invalid: false } #Available:有効  Invalid:退会

  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :last_name_kana,  presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :postal_code,  presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  def active_for_authentication?
    super && (is_active == true)
  end

end
