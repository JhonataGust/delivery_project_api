class Client < ApplicationRecord
  belongs_to :user

  validates :company_name, presence: true, on: :create
  validates :short_name, presence: true, on: :create
  validates :number, presence: true, on: :create
  validates :uid, uniqueness: true

  before_create :make_uid

  has_one_attached :logo

  def self.type_search
    [
      '',
      'More Viewed',
      'More Relevant',
      'More Evaluated',
      'Hyped'
    ]
  end

  def self.make_param(param, user_id)
    return Client.make_param_more_viewed if param == '1' || param.blank?
    return Client.user(user_id) if param == 'user'
    return Client.search(param) if param.include?('/')
  end

  def self.make_param_more_viewed
    Client.where('company_relevance >= 3 AND completed = true').limit(3)
  end

  def self.user(user_id)
    Client.where(user_id: user_id)
  end

  def self.search(search)
    search = search.delete('/')
    Client.where("company_name LIKE :company_name",company_name: "%#{search.upcase_first}%")
    .or(Client.where("short_name LIKE :short_name",short_name: "%#{search.upcase_first}%"))
  end
end
