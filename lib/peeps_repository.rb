require_relative 'peeps'

class PeepRepository
  def all
    peeps = []

    sql = 'SELECT * FROM peeps ORDER BY peep_time DESC;'
    result = DatabaseConnection.exec_params(sql, [])

    result.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.message = record['message']
      peep.peep_time = record['peep_time']
      peep.user_id = record['user_id'].to_i

      peeps << peep
    end
    return peeps
  end

  def create(peep) 
    sql = 'INSERT INTO peeps (message, peep_time, user_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.message, peep.peep_time, peep.user_id])
  
    return peep
  end
end