require_relative './peeps'

class PeepRepository
  def all
    Peeps = []
    
    sql = 'SELECT id, message, peep_time, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peep.new

      peep.id = record['id']
      peep.message = record['message']
      peep.peep_time = record['peep_time']
      peep.user_id = record['user_id']

      peeps << peep
    end

    return peeps
  end