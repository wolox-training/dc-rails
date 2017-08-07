class FullBookSerializer < OneBookSerializer
  attributes :actual_rent

  has_one :actual_rent
end
