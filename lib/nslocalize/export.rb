# This class is responsible for exporting all strings.
module NSLocalize
  module Export
    # Export to apple strings file.
    #
    # Example:
    #   >> NSLocalize::Export.apple(Array<MatchData>])
    #   => "String" = "Translation"
    #
    # @param strings [Array<MatchData>] to be exported
    # @return [String] following Apple format
    def self.apple(strings)
      file = ""

      strings.each do |string|
        cleaned_string = string[1].gsub(/^(@")(.*)(")$/, '\2')
        file = file + "\"#{cleaned_string}\" = \"#{cleaned_string}\"" + "\n"
      end

      file
    end
  end
end
