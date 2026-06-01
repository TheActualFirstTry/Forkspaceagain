SMODS.Joker {
    key = "cassknows",
    atlas = "jokers",
    pos = { x = 9, y = 6 },
    config = { extra = {
        t_chips = 30
    } },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "she_her",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.t_chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.other_consumeable and context.other_consumeable.ability.set == 'star_astral' and G.GAME[context.other_consumeable.config.center.key .. "_used"] then
            return {
                chips = card.ability.extra.t_chips * G.GAME[context.other_consumeable.config.center.key .. "_used"],
                message_card = context.other_consumeable
            }
        end
    end
}
