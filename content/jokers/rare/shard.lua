SMODS.Joker {
    key = "shard",
    atlas = "jokers",
    pos = { x = 6, y = 0 },
    config = { extra = {
        dollars = 4
    } },
    rarity = 3,
    cost = 8,
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
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and G.GAME.dollars <= card.ability.extra.dollars then
           G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag({ key = 'tag_coupon' })
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    card:juice_up(0.8, 0.5)
                    return true
                end)
            })) 
        end
    end
}
