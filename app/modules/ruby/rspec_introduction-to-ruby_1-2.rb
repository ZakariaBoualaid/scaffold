$usertoken = ARGV[0]
ARGV[0] = nil

require_relative 'zaks_test_unit'

class TestUnit < ZaksTestUnit

do_require!(File.basename(__FILE__), $usertoken)

	def test_scaffold
		zaks_assert_equal($my_num, "$my_num", 25)
		zaks_assert_equal($my_boolean, "$my_boolean", true)
		zaks_assert_equal($my_string, "$my_string", "Ruby")
	end

end
