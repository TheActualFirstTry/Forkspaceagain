SMODS.Joker {
    key = "shard",
    atlas = "jokers",
    pos = { x = 6, y = 0 },
    config = { extra = {

    } },
    rarity = 3,
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "she_her",

    add_to_deck = function(self, card, from_debuff)
        if next(SMODS.find_card("j_star_crystal")) then
            check_for_unlock { type = "joker_set", set = "ach_star_yuri" }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {

            }
        }
    end,

    calculate = function(self, card, context)

    end
}
