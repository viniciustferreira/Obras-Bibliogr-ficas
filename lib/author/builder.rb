module Author
  class Builder
    class << self
      def create(author_name)
        begin 
          return true if Bibliography.create(name: author_name).persisted?
        rescue
          return false 
        end
      end
    end
  end
end