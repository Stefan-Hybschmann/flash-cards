FactoryBot.define do
  factory :mind_card do
    title { "mind card title" }
    context { 'This is a random context for this mind card' }
    pronunciation { 'This is a random pronunciation for this mind card' }
  end
end
