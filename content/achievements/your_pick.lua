SMODS.Achievement{
	key = "your_pick",
	order = 1,
	bypass_all_unlocked = true,
    hidden_name = true,
	atlas = "star_achievements",
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
	unlock_condition = function(self, args)
        if args.type == "crystal" and args.type == "shard" then
		    return true
        end
	end
}