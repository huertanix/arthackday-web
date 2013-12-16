module EventsHelper
	def order_participants(participants)
		partHash = Hash.new
		# partCount = participants.length

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

		# $i = 0
		# $col = 2

		# colCount = 0

		# until $i > $col  do
		# 	# each column has a hash
		# 	partHash[$i] = Hash.new

		# 	for partHash.keys.sort.each do 
				
		# 	end
		# end

		return partHash
	end
end
