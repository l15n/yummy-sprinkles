package :postgres, :provides => :database do
  description 'PostgreSQL database'
  yum %w( postgresql postgresql-server postgresql-libs postgresql-devel postgresql-contrib)
  
  verify do
    has_executable 'psql'
  end
end
 
package :postgresql_driver, :provides => :ruby_database_driver do
  description 'Ruby PostgreSQL database driver'
  gem 'postgres'
  
  verify do
    has_gem 'postgres'
  end
  
  requires :postgres, :ruby_enterprise
end
