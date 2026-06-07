SMODS.Joker {
    key = "astroling",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",
}

SMODS.Joker {
    key = "scrap_machete",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { t_mult_extra = 6, t_mult = 0 } },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",


    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_mult_extra, card.ability.extra.t_mult_extra * count_tarots() } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local tarot_count = count_tarots()
            return { mult = tarot_count * card.ability.extra.t_mult_extra }
        end
    end
}

SMODS.Joker {
    key = "copper_shortsword",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { t_chips_gain = 13, t_chips = 0 } },
    rarity = 1,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips_gain, card.ability.extra.t_chips } }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local destroyed_cards = 0
            for _, removed_card in ipairs(context.removed) do
                destroyed_cards = destroyed_cards + 1
            end
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "t_chips",
                scalar_value = "t_chips_gain",
                scalar_table = { t_chips_gain = (card.ability.extra.t_chips_gain * destroyed_cards) },
                colour = G.C.CHIPS
            })
        end
        if context.joker_main then
            return { chips = card.ability.extra.t_chips }
        end
    end
}

SMODS.Joker {
    key = "galileo",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { chipsbuff = 10 } },
    rarity = 1,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chipsbuff } }
    end,

    calculate = function(self, card, context)
        if context.poker_hand_changed then
            local blueprint = context.blueprint_card
            G.GAME.hands[context.scoring_name].chips = G.GAME.hands[context.scoring_name].chips +
                card.ability.extra.chipsbuff
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = i == 1 and 0.2 or 0.9,
                func = function()
                    (blueprint or card):juice_up()
                    play_sound('tarot1')
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = G.GAME.hands[context.scoring_name].chips, StatusText = true })
        end
    end
}

SMODS.Joker {
    key = "gerson",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { t_score = 0, t_score_gain = 250 } },
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
        if context.before and not context.blueprint and next(context.poker_hands['Straight']) then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "t_score",
                scalar_value = "t_score_gain",
                colour = G.C.PURPLE
            })
        end
        if context.final_scoring_step then
            return { score = card.ability.extra.t_score }
        end
    end
}

SMODS.Joker {
    key = "michael_jackson",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { xmult = 1.5 } },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "star_michael_pronoun_jackson",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local last_face = false
            for _, playing_card in ipairs(context.scoring_hand) do
                if playing_card:is_face() then last_face = playing_card end
            end
            if not last_face then return end
            if last_face == context.other_card then
                return { xmult = card.ability.extra.xmult }
            end
        end
    end
}

SMODS.Joker {
    key = "astrophage",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { dollars = 2 } },
    rarity = 1,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.change_suit then
            local blueprint = context.blueprint_card
            return {
                dollars = card.ability.extra.dollars,
                message_card = context.other_card,
                G.E_MANAGER:add_event(Event({
                    func = function()
                        (blueprint or card):juice_up()
                        G.GAME.dollar_buffer = 0
                        return true
                    end
                }))
            }
        end
    end
}

SMODS.Joker {
    key = "radiant_joker",
    atlas = "jokers",
    pos = { x = 0, y = 5 },
    config = { extra = { t_mult = 10, } },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['star_flash']) then
            return { mult = card.ability.extra.t_mult }
        end
    end
}

SMODS.Joker {
    key = "starwalker",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { t_mult = 0, t_mult_gain = 1 } },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_mult, card.ability.extra.t_mult_gain } }
    end,

    calculate = function(self, card, context)
        if context.discard and context.other_card:get_id() == SMODS.Ranks['star_star'].id and not context.other_card.debuff and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "t_mult",
                scalar_value = "t_mult_gain",
                scaling_message = {
                    message = "Upgrade!"
                }
            })
        end
        if context.joker_main then
            return { mult = card.ability.extra.t_mult }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card:get_id() == SMODS.Ranks['star_star'].id then
                return true
            end
        end
        return false
    end
}

SMODS.Joker {
    key = "subtle_joker",
    atlas = "jokers",
    pos = { x = 1, y = 5 },
    config = { extra = { t_chips = 80 } },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['star_flash']) then
            return { chips = card.ability.extra.t_chips }
        end
    end
}

local smods_smeared_check_ref = SMODS.smeared_check
function SMODS.smeared_check(card, suit, ...)
    if next(SMODS.find_card("j_star_astroling")) then
        if (card.base.suit == 'Clubs' or card.base.suit == 'Spades') and (suit == 'Clubs' or suit == 'Spades') then
            return true
        end
    end
    return smods_smeared_check_ref(card, suit, ...)
end
