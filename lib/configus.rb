Configus.build Rails.env do
  env :development do
    admin do
      login "dhh"
      pass  "secret"
    end

    carrierwave do
      storage :file
    end

    mailer do
      from "noreply@blog.ru"
    end
  end

  env :test, parent: :development do
  end

  env :production, parent: :development do
  end
end
