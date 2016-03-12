module MembersHelper
  def gender_displayed(gender)
    gender == 1 ? gender="男性" :gender="女性"
  end
end
