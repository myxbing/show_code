require_relative 'show_code/version'
require_relative 'show_code/source_location'
require_relative 'show_code/syntax_exception'
require_relative 'show_code/code'

module ShowCode

  def self.parse(obj)
    sol  = SourceLocation.new obj
    code = Code.new sol
    puts code.content
    sol.method
  end

  def self.open(obj)
    sol  = SourceLocation.new obj
    file = sol.file
    %x[gedit #{file}]
    if $?.success?
      'File has opened via gedit!'
    else
      'Sorry, cannot open the file.'
    end
  end

end

# ShowCode() runs like ShowCode.parse()
module Kernel

  def ShowCode(target)
    ShowCode.parse target
  end
  module_function :ShowCode

end
