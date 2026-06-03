SMODS.Challenge {
    key = 'order',
    rules = {
        custom = {
            { id = 'all_common' },
        },
        modifiers = {
            { id = 'joker_slots', value = 8 },
        },
    },

    apply = function(self)
    for k in pairs(SMODS.Rarities) do
        if k~= "Common" then
            G.GAME[k:lower().."_mod"] = 0
        end
    end

end,

    restrictions = {
        banned_cards = {
            { id = 'c_wraith' },
            { id = 'c_soul' },
            { id = 'c_star_starspace' }
        },
        banned_tags = {
            { id = 'tag_rare' },
            { id = 'tag_uncommon' }
        }
    },
}
