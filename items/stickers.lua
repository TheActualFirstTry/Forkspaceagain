SMODS.Sticker {
    key = "spellbound",
    default_compat = true,
    pos = { x = 0, y = 0 },
    rate = 0.3,
    config = { perish_tally = 3 },
    badge_colour = G.C.RED,
    sets = { Joker = true },
    needs_enable_flag = true,
    should_apply = function(self, card, center, area, bypass_roll)
        return G.GAME.modifiers.enable_star_spellbound and
            SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { ((card.ability or {}).star_spellbound or self.config).perish_tally, 3 } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false then
            if card.ability.star_spellbound.perish_tally > 0 then
                if card.ability.star_spellbound.perish_tally == 1 and card.ability.star_spellbound.perish_tally ~= 0 then
                    card.ability.star_spellbound.perish_tally = 0
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        func = function()
                            play_sound('tarot1')
                            play_sound('gold_seal', 1.2, 0.4)
                            card:juice_up()
                            card:remove_sticker('star_spellbound')
                            return true
                        end
                    }))
                else
                    card.ability.star_spellbound.perish_tally = card.ability.star_spellbound.perish_tally - 1
                    return {
                        message = localize { type = 'variable', key = 'a_remaining', vars = { card.ability.star_spellbound.perish_tally } },
                        colour = G.C.FILTER,
                        delay = 0.45
                    }
                end
            end
        end
    end
}

local smods_is_eternal_ref = SMODS.is_eternal
function SMODS.is_eternal(card, trigger, ...)
    return card.ability.star_spellbound or smods_is_eternal_ref(card, trigger, ...)
end
