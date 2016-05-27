module Blorgh
  class Article < ActiveRecord::Base
    attr_accessor :author_name
    belongs_to :author, class_name: Blorgh.author_class

    before_validation :set_author

    has_many :comments

    private
    def set_author
      self.author = Blorgh.author_class.constantize.find_or_create_by(name: author_name)
    end
  end
end
