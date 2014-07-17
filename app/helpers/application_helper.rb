module ApplicationHelper
	require 'test/unit'

	class ZaksTestUnit < Test::Unit::TestCase

		class << self
			def do_require!(filename)
				begin
					require_relative "../#{filename.split('_')[1]}_#{filename.split('_')[2]}"
				rescue Exception => e
					f = File.new("error_console.log", "w")
					f.truncate(0)
					f.puts e
					f.close
				end
			end
		end


		def zaks_assert_equal(input, input_str, expecting, error_message = nil)
			message = "ERROR : Make sure that '#{input_str}' is equal to '#{expecting}'."
			assert_block(message) do
				input == expecting
			end
		end
		
	end
end
