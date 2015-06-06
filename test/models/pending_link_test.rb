require 'test_helper'

class PendingLinkTest < ActiveSupport::TestCase
    test "Empty pending link creation" do
        assert_raise do
            PendingLink.create({})
        end
    end

    test "Invalid pending link creation" do
        assert_raise do
            PendingLink.create({})
        end
    end

    test "Valid pending link creation" do
        assert_difference(PendingLink.count, +1) do
            PendingLink.create({})
        end
    end
end
