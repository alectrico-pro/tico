FactoryGirl.define do
  factory :ticket do
    asunto "My Ticket Title"
    status 1
    contenido "My Content for ticket"
  end
end
