SMODS.Joker {
    key = "ruby",
    atlas = "jokers",
    pos = { x = 8, y = 6 },
    config = { extra = {
        t_mult = 0,
        t_mult_gain = 6
    } },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "she_her",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.t_mult,
                card.ability.extra.t_mult_gain
            }
        }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'star_astral' then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "t_mult",
                scalar_value = "t_mult_gain",
            })
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.t_mult
            }
        end
    end
}
