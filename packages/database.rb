package :postgres, :provides => :database do
  describe 'Postgres database server and client'
  apt 'postgresql postgresql-client'

  verify do
    has_executable 'psql'
  end
end
