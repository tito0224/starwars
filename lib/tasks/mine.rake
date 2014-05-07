require 'nokogiri'
require 'open-uri'

namespace :mine do
  desc "Mines starwars.com enclyopedia"

  task :characters => :environment do
    puts "Starting Mining"
    
    begin
      miner = CharacterMiner.new
      miner.mine
    rescue => e
      puts "Exception while mining."
      puts e.message
      puts e.backtrace
    end
    
    puts "Mining Ended"
  end

  task :character_details => :environment do
    puts "Starting Mining Character Details"

    begin
      miner = CharacterDetailMiner.new
      miner.mine
    rescue => e
      puts "Exception while mining."
      puts e.message
      puts e.backtrace
    end

    puts "Mining Ended"
  end
end