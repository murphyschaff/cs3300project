FactoryBot.define do
    factory :user do
      trait :normal do
        id {1}
        email {"test@user.com"}
        password {"qwerty"}
      end

      trait :admin do
        id {2}
        email {"admin@admin.com"}
        password {"123456"}
        admin_role {true}
      end
    end

    
  end