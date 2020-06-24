module Author
  class Translator
    class << self
      MIDDLE_LINK_NAME_LIST = ["da", "de", "do", "das", "dos"]
      ANCESTOR_MIDDLE_NAME = ["filho", "filha", "neto", "neta", "sobrinho", "sobrinha", "junior"]

      def translate(author_name)
        check_first_name(author_name.split(' '))
      end

      def check_first_name(complete_name)
        complete_name[0] = complete_name[0].capitalize
        return complete_name if complete_name[0] == complete_name.last
        check_middle_name(complete_name)
      end

      def check_middle_name(complete_name)
        if complete_name.last == complete_name[1]
          complete_name[1] = "#{complete_name[1].upcase}, "
          return complete_name.reverse.join
        else
          if MIDDLE_LINK_NAME_LIST.include?(complete_name[1])
            complete_name[0] << " #{complete_name[1]}"
          end
          check_last_name(complete_name)
        end
      end

      def check_last_name(complete_name)
        formatted_name = [complete_name[0]]
        if ANCESTOR_MIDDLE_NAME.include?(complete_name[2])
          formatted_name << "#{complete_name[1].upcase} #{complete_name[2].upcase}, "
        else
          formatted_name << "#{complete_name[2].upcase}, "
        end
        return formatted_name.reverse.join
      end
    end
  end
end