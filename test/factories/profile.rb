FactoryGirl.define do
    sequence :id do |n|
        n.to_i
    end

    sequence :picture do |n|
        "#{n}picture.jpg"
    end

    factory :profile do
        id {generate :id}
        picture {generate :picture}
        popularity 0
        mails 0
        charms 0
        visits 0
        buckets 0
        total 0
        last_connection 0.seconds.ago
        online true
    end
end