class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  #Validates       
  validates :email, :username, :name, presence: true
  #Associations
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar  # para permitir adjuntar imagenes.
  
  after_commit :add_default_avatar, on: %i[create update]
  
  private
  #Para cuando creas un usuario nuevo y no le asignas una imagen, por defecto se agregara esta imagen(user_default).
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(io: File.open(
        Rails.root.join('app', 'assets', 'images', 'users', 'default.png')
      ), filename: "user_default")
    end
  end

end
