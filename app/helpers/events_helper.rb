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
	end
end
