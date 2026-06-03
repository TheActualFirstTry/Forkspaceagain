SMODS.Joker {
    key = "movie_star",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = {} },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if #G.play.cards == 1 and context.after then
            local card = G.play.cards[1]
            if card:get_id() == SMODS.Ranks['star_star'].id then
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        card:set_seal('Gold', nil, true)
                        return true
                    end
                }))
            end
        end
    end
}
