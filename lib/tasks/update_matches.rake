desc "Put some match kickoff times into the future"
task update_matches: :environment do
  m1 = Match.find(15)
  m1.kickoff_time = Time.now + 2.days
  m1.save
  m2 = Match.find(16)
  m2.kickoff_time = Time.now + 3.days
  m2.save
  m3 = Match.find(17)
  m3.kickoff_time = Time.now + 4.days
  m3.save
end
