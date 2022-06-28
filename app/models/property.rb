class Property < ApplicationRecord
  belongs_to :agent
  has_one :address

  def self.available
    Property.find_by_sql("SELECT ag.first_name, ag.last_name, ag.email, p.id as property_id, p.beds, p.baths, p.sq_ft, p.price, a.street, a.id as address_id
    FROM properties AS p
    INNER JOIN addresses AS a
    ON p.id = a.property_id
    INNER JOIN agents as ag
    ON ag.id = p.agent_id
    WHERE p.SOLD <> TRUE;")
  end

  # def available
  # end
end
