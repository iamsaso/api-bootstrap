require File.expand_path('../bootstrap.rb', __FILE__)
require 'rake'
require 'dotenv/tasks'
require "sinatra/activerecord/rake"


namespace :scope do
    desc "List application scopes"
    task :list do |t|
      rows = []
      Scope.all.each{|row|
        rows << [row.name, row.description]
      }
      puts Terminal::Table.new :headings => ['Name', 'Description'], :rows => rows
    end

    desc "Add new application scope"
    task :add, [:name, :description] do |t, args|
      scope = Scope.new
      scope.name = args.name
      scope.description = args.description
      scope.save!
    end

    desc "Remove existing application scope"
    task :remove, [:name] do |t, args|
      scope = Scope.find_by_name(args.name)
      scope.destroy
    end
end