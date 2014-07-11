namespace :first_namespace do
  desc " This task give winner of game"
  task task1: :environment do
    # athlete = Athlete.find(24)
    # puts "hello #{athlete.name}"
    # athlete.name = "sahrukh"
    # athlete.save!
    # ath = Athlete.find(24)
    # puts "hello #{ath.name}"
    score = Score.find(6)
    game_time = Game.find(score.game_id).end_time
    if Time.now > game_time
      puts "current time is #{Time.now} and game End Time is #{game_time}"

      if score.score1 < score.score2
        puts "#{Team.find(score.team1).name} teams of #{Team.find(score.team1).school.name} is winner"
      else
        puts "#{Team.find(score.team2).name} teams of #{Team.find(score.team2).school.name} is winner"
      end
    else
      puts "Game not played till now"
    end
  end

  desc "TODO"
  task task2: :environment do
    puts "how are you"
  end

end
