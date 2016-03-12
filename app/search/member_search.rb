class MemberSearch
  include Virtus.model
  include ActiveModel::Model

  attribute :name, String
  attribute :year, Integer
  attribute :gender, Integer

  def search
    scoped = Member.order("kana_name")
    scoped = scoped.where("name LIKE ?", "%#{name}%" ) if name.present?
    scoped = scoped.where(year: year) if year.present?
    scoped = scoped.where(gender: gender) if gender.present?
    scoped
  end
end