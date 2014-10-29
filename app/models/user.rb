class User < ActiveRecord::Base
  validates :username, uniqueness: {case_sensitive: false}, length: { minimum: 5 }

  def self.authenticate(username, password)
    account = self.where(username: username)
    if account.count != 0
      if account[0].password == password
        return account[0]
      end
    end
    return nil
  end
end
