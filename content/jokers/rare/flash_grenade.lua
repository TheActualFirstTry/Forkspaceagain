SMODS.Joker {
    key = "flash_grenade",
    atlas = "jokers",
    pos = { x = 6, y = 1 },
    config = { extra = {
        primed = false,
    } },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "it_its",

    loc_vars = function(self, info_queue, card)
        local _handname, _played = 'High Card', -1
        for hand_key, hand in pairs(G.GAME.hands) do
            if hand.played > _played then
                _played = hand.played
                _handname = hand_key
            end
        end
        local most_played = _handname
        return {
            vars = {
                localize(most_played, 'poker_hands')
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['star_flash']) then
            card.ability.extra.primed = true
            local eval = function()
                return card.ability.extra.primed
            end
            juice_card_until(card, eval)
            return {
                message = "Active!"
            }
        end
        if card.ability.extra.primed == true then
            local _handname, _played = 'High Card', -1
            for hand_key, hand in pairs(G.GAME.hands) do
                if hand.played > _played then
                    _played = hand.played
                    _handname = hand_key
                end
            end
            local most_played = _handname
            if context.evaluate_poker_hand then
                return {
                    replace_scoring_name = most_played
                }
            end
            if card.ability.extra.primed == true and context.before then
                card.ability.extra.primed = false
            end
        end
    end
}
