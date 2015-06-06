require 'test_helper'

class PendingLinkTest < ActiveSupport::TestCase
    test "Empty pending link creation" do
        assert_raise ActiveRecord::StatementInvalid  do
            PendingLink.create({})
        end
    end

    test "Invalid pending link creation" do
        assert_raise ActiveRecord::StatementInvalid  do
            PendingLink.create({})
        end
    end

    test "Duplicate" do
        PendingLink.create({uri: '/profile/110884558'})

        assert_raise ActiveRecord::RecordNotUnique do
            PendingLink.create({uri: '/profile/110884558'})
        end
    end

    test "Valid pending link creation" do
        assert_difference 'PendingLink.count', +1 do
            PendingLink.create({uri: '/profile/110884558'})
        end

        assert_difference 'PendingLink.count', +1 do
            PendingLink.create({uri: '/profile/110884558?aum_campaign=ybpnycebqhpgf&aum_content=localproducts'})
        end
    end
end
