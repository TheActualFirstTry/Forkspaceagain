SMODS.Joker {
    key = "shard",
    atlas = "jokers",
    pos = { x = 6, y = 0 },
    config = { extra = {
        xmult = 1,
        xmult_gain = 0.25
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
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain
            }
        }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'star_astral' then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain",
                scaling_message = {
                    message = "X" .. (card.ability.extra.xmult + card.ability.extra.xmult_gain) .. " Mult",
                }
            })
        end
    end
}
