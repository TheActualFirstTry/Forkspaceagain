SMODS.Achievement {
    key = "your_pick",
    order = 1,
    bypass_all_unlocked = true,
    hidden_name = true,
    atlas = "star_achievements",
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 0, y = 0 },
    unlock_condition = function(self, args)
        if args and args.type == "joker_set" then
            if args.set == "ach_star_yuri" then
                return true
            end
        end
    end
}