module EventsHelper
	def order_participants(participants)
		partHash = Hash.new

		# loop through participants
		participants.each do |part|
			# get first letter of participant's name
			k = part.name.upcase[0,1]
			if !partHash.key?(k)
				# if key doesn't exist, add it
				partHash[k] = []
			end
			partHash[k] << part
		end


		partHash.keys.sort.each do |p|
			# alphabetize the names in each of the arrays
			partHash[p].sort! { |a,b| a.name.downcase <=> b.name.downcase }
		end

		return partHash
	end

	def participant_breaks(participants,count)
		breakPoint = count/3
		breakLetters = []
		amount = 0

		participants.keys.sort.each do |p|
			amount = amount + participants[p].count
			if amount > breakPoint && breakLetters.count == 0
				breakLetters << p
			elsif (amount * 2) > breakPoint && breakLetters.count == 1
				breakLetters << p
			end
		end
		
		return breakLetters
	end


	def google_map_search(venue)
		location = ''
		if venue.address
			venue.address.downcase!
			venue.address.gsub! /\s+/, '+'
			location = location + venue.address + ",+"
		end
		if venue.city
			venue.city.downcase!
			venue.city.gsub! /\s+/, '+'
			location = location + venue.city + ",+"
		end
		if venue.country
			venue.country.downcase!
			venue.country.gsub! /\s+/, '+'
			location = location + venue.country + "+"
		end

		return location
	end
end
