SMODS.Joker {
    key = "firsttry",
    atlas = "galaxy_jokers",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0},
    config = { extra = {
    } },
    rarity = "star_galaxy",
    cost = 50,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = 500
            }
        end
    end
}
