FactoryBot.define do
  factory :article do
    title { 'My First Article' }
    body { 'こんにちは。初めての記事です。' }
    slug { 'my-first-article' }
    published_on { Date.today }
    draft { false }
  end
end
