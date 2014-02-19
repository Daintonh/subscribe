Warden::Strategies.add(:password) do
  def subdomain
    ActionDispatch::Http::URL.extract_subdomains(request.host, 1)
  end
  def valid?
    subdomain.present? && params['user']
  end

  def authenticate!
    account = Subscribe::Account.find_by_subdomain(subdomain)
    if account
      u = account.users.find_by_email(params['user']['email'])
      if u.nil?
        fail!
      else
        u.authenticate(params['user']['password']) ? success!(u) : fail!
      end
    else
      fail!
    end
    #return fail! unless account = Subscribe::Account.find_by(subdomain: subdomain)
    #return fail! unless user = account.users.find_by(email: params["user"]["email]                                                                          "])
    #return fail! unless user.authenticate(params["user"]["password"])
    #success! user
  end
end