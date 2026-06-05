SMODS.Joker {
    key = "gerson",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = {
        t_score = 0,
        t_score_gain = 250
    } },
    rarity = 1,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he/him",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_score, card.ability.extra.t_score_gain } }
    end,

    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['Straight']) then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "t_score",
                scalar_value = "t_score_gain",
                colour = G.C.PURPLE
            })
        end
        if context.final_scoring_step then
            return {
                score = card.ability.extra.t_score
            }
        end
    end
}
