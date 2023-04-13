require_relative './users'

class UserRepository
  def all
    users = []

    sql = 'SELECT id, name, email, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql , [])
    
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

  def create(user) 
    sql = 'INSERT INTO users (name, email, password) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [user.name, user.email, user.password])
  
    return user
  end
end