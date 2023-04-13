require 'peeps'
require 'peeps_repository'

def reset_peeps_table
  seed_sql = File.read('chitter_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it 'creates a peep' do
    repo = PeepRepository.new

  
    new_peep = Peep.new
    new_peep.message = ('Bubbles')
    new_peep.peep_time = ('2023-02-06 05:00:00')
    new_peep.user_id = (6)
    
    repo.create(new_peep)

    peeps = repo.all

    expect(peeps.length).to eq(6)
    expect(peeps.first.message).to eq('Bubbles')
    expect(peeps.first.peep_time).to eq ('2023-02-06 05:00:00')
    expect(peeps.first.user_id).to eq (6)
  end


  it 'returns all peeps in reverse chronological order' do
    repo = PeepRepository.new

    peeps = repo.all

    expect(peeps.length).to eq(5)
    expect(peeps.last.message).to eq('Monkeys')
    expect(peeps.last.peep_time).to eq ('2022-02-09 10:00:00')
    expect(peeps.last.user_id).to eq (5)
  end
end