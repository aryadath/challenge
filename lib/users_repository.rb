require_relative './users'

class UserRepository
  def all
    sql = 'SELECT id, name, email, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql , [])

    users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.email = record['email']
      user.password = record['password']

      users << user
    end

    return users
  end
end