require_relative 'zaks_test_unit'

class TestUnit < ZaksTestUnit

	do_require!(__FILE__)

	def test
		zaks_assert_equal($mynum, "$mynum", 25)
		zaks_assert_equal($myboolean, "$myboolean", true)
		zaks_assert_equal($my_string, "$my_string", "Ruby")
	end

end