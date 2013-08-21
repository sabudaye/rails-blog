Configus.build Rails.env do
  env :development do
    admin do
      login "dhh"
      pass  "secret"
    end
  end

  env :test, parent: :development do
  end
end