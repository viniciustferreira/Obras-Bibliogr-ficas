module Author
  class Translator
    class << self
      MIDDLE_LINK_NAME_LIST = ["da", "de", "do", "das", "dos"]
      ANCESTOR_NAME = ["filho", "filha", "neto", "neta", "sobrinho", "sobrinha", "junior"]

      def translate(author_name)
        format_complete_name(author_name.split(' '))
      end

      def format_complete_name(complete_name)
        return complete_name.join.capitalize if complete_name.first == complete_name.last

        last_name = complete_name
          .delete_at(complete_name.size-1)
        first_name = complete_name.delete_at(0)

        complete_name.each do |middle_name|
          if ANCESTOR_NAME.include?(last_name)
            last_name = last_name.prepend("#{middle_name} ") 
          end

          if MIDDLE_LINK_NAME_LIST.include?(middle_name)
            first_name << " #{middle_name}"
          end
        end
        [last_name.upcase.concat(', '), first_name.capitalize].join
      end
    end
  end
end