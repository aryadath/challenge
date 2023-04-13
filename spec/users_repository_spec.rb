require 'users'
require 'users_repository'

def reset_users_table
  seed_sql = File.read('chitter_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end
  it 'creates a user' do
    repo = UserRepository.new

  
    new_user = User.new
    new_user.name = ('Emma')
    new_user.email = ('emma@blip.com')
    new_user.password = ('adesw')
    
    repo.create(new_user)

    users = repo.all

    expect(users.length).to eq(4)
    expect(users.last.name).to eq('Emma')
    expect(users.last.email).to eq ('emma@blip.com')
    expect(users.last.password).to eq ('adesw')
  end

  it 'displays users' do
    repo = UserRepository.new

    users = repo.all
    
    expect(users.length).to eq(3)
    expect(users.last.name).to eq('Mia')
    expect(users.last.email).to eq('mia@blip.com')
    expect(users.last.password).to eq('dsfes')
  end
end

