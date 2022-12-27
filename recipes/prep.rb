%w(
  httpd
  php
  mysql-server
  php-mysqlnd
  expect
).each do |pkg|
  package pkg do
    action :remove
  end
end

group 'www' do
  action :delete
end