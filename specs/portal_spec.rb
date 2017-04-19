require('minitest/autorun')
require('minitest/rg')
require('../portal.rb')

class TestPortal < MiniTest::Test
  
  def test_can_create_portal
    portal = Portal.new(5)
    refute_nil(portal)
  end

  def test_can_get_length
    portal = Portal.new(3)
    assert_equal(3, portal.length)
  end

  def test_can_get_negative_length
    portal = Portal.new(-3)
    assert_equal(-3, portal.length)
  end
end

