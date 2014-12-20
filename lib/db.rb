require 'pg'

class DB

  def initialize
    @db = PG.connect(host: 'localhost', dbname: 'bitcoin_sentiment', user: 'postgres', password: 'postgres')
    @prepared_statements = {insert_data: false}
  end

  def save(data)
    unless @prepared_statements[:insert_data]
      @db.prepare('insert_data', 'INSERT INTO "data" ("keyword", "sentiment") VALUES ($1, $2);')
      @prepared_statements[:insert_data] = true
    end

    @db.exec_prepared('insert_data', data)
  end

  def get_by_keyword(keyword); end
  def get_by_date(date); end

end
