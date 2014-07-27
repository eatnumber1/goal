class Rubinius::ToolSets::Runtime::Melbourne
  def parse_file
    unless @name and File.exist? @name
      raise Errno::ENOENT, @name.inspect
    end

    contents = File.read(@name)
    contents.gsub!(/\)(\(|al)/, ').\1')
    parse_string(contents)
  end
end

require './goal.rb'
