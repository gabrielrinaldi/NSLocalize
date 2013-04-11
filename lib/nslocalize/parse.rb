# This class is responsible for parsing all strings in a given text or file.
module NSLocalize
  module Parse
    # Parse a project.
    #
    # Example:
    #   >> NSLocalize::Parse.project('/path/to/project')
    #   => [ { :file => <File>, :strings => <MatchData> }, { :file => <File>, :strings => <MatchData> } ]
    #
    # @param directory [String] path to be searched
    # @return (see parse)
    def self.project(directory)
      results = Array.new
      self.recursive_list(directory) do |file|
        if File.extname(file.path) == '.m'
          strings = self.file(File.absolute_path(file.path))
          if strings.count > 0
            results << { :file => file, :strings => strings }
          end
        end
      end

      results
    end

    # Parse a file.
    #
    # Example:
    #   >> NSLocalize::Parse.file('/path/to/file')
    #   => [ <MatchData>, <MatchData>, <MatchData> ]
    #
    # @param file [String] path to be searched
    # @return (see parse)
    def self.file(file)
      content = IO.read(file)

      if content
        self.content(content)
      else
        nil
      end
    end

    # Parse a string.
    #
    # Example:
    #   >> NSLocalize::Parse.content('[UIAlertView showWithTitle:NSLocalizedString(@\"Oops...\", nil) message:...]')
    #   => [ <MatchData> ]
    #
    # @param content [String] to be searched
    # @return [Array<MatchData>] with found results (or an empty array if no results found).
    def self.content(content)
      content.to_enum(:scan, /NSLocalizedString\((@".*?")[, ]{1,2}(@".*?"|nil)\)/).map {
        Regexp.last_match
      }
    end

    private
    # List all files recursively in a directory.
    #
    # Example:
    #   >> self.recursive_list('/path/to/list/') do |f| puts f end
    #   => [ <File>, <File> ]
    #
    # @param directory [String] to be searched
    # @return yields [<File>] with found files.
    def self.recursive_list(directory)
      Dir.foreach(directory) do |filename|
        if filename == '.' || filename == '..'
          next
        end

        filename = directory + '/' + filename
        if File.directory? filename
          self.recursive_list(File.absolute_path filename) do |file|
            yield file
          end
        else
          file = File.new(filename)

          yield file
        end
      end
    end
  end
end
