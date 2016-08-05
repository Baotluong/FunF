# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nameslist = ['Bao', 'Lana', 'Lee', 'Josh', 'Karen', 'Greg', 
	         'Graham', 'Anh', 'Mike', 'Brian', 'Jake', 'Alex',
	         'Archer', 'Scott', 'Jenna', 'Pete', 'Jeremy', 'Bryce',
	         'Charlie', 'Kelly', 'Brett', 'Moose', 'Monkey']

actionlist = ['is going to the mall', 'is meeting someone', 'is doing a science experiment',
              'is getting married', 'is having a party', 'bumped into a stranger',
              'is playing a game', 'is watching a movie', 'is taking a bath',
              'is learning to be a Jedi', 'won the lottery', 'is fighting a dragon',
              'is reanimating a corpse', 'is planning something']

locationlist = ['under the sea', 'on Mars', 'in space', 'tomorrow',
                'in Idaho', 'on Mount Olymbus', 'in an alternate reality',
                'at King\'s Landing', 'in Gotham City', 'in a dream',
                'at Hogsmeade', 'in Pallet Town', 'nowhere special', 'under a bridge']        	         

nameslist.each do |t|
	PromptName.create(name: t)
end

actionlist.each do |t|
	PromptAction.create(action: t)
end

locationlist.each do |t|
	PromptLocation.create(location: t)
end

25.times do
	story1 = Story.create(start_f:  [true, false].sample,
				          max:      rand(20..30))

	Line.create(story: 	  story1,
	            line:     PromptName.order("RANDOM()").first.name + " " + PromptAction.order("RANDOM()").first.action + " " + PromptLocation.order("RANDOM()").first.location,
	            is_f:     story1.start_f,
			    report:   0)
end