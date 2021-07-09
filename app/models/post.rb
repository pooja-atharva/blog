class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    # self.per_page = 1
    paginates_per 1
    # visitable :ahoy_visit
    has_many :comments
    belongs_to :user
end
