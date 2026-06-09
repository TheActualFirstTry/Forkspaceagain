SMODS.Joker {
    key = "flash_card",
    atlas = "jokers",
    pos = { x = 6, y = 2 },
    config = { extra = { xchips_gain = 0.1, xchips = 1, } },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips_gain, card.ability.extra.xchips, } }
    end,

    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['star_flash']) and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xchips",
                scalar_value = "xchips_gain",
                scaling_message = {
                    message = "X" .. (card.ability.extra.xchips + card.ability.extra.xchips_gain) .. " Chips",
                    colour = G.C.CHIPS
                }
            })
        end
        if context.joker_main then
            return { xchips = card.ability.extra.xchips }
        end
    end
}

SMODS.Joker {
    key = "stardrop",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { stardrop_rounds = 0, total_rounds = 3 } },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'tag_voucher', set = 'Tag' }
        return { vars = { localize { type = 'name_text', set = 'Tag', key = 'tag_voucher' }, card.ability.extra.stardrop_rounds, card.ability.extra.total_rounds } }
    end,

    calculate = function(self, card, context)
        if context.selling_self and (card.ability.extra.stardrop_rounds >= card.ability.extra.total_rounds) then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag({ key = 'tag_voucher' })
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return nil, true
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.stardrop_rounds = card.ability.extra.stardrop_rounds + 1
            if card.ability.extra.stardrop_rounds == card.ability.extra.total_rounds then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.extra.stardrop_rounds < card.ability.extra.total_rounds) and
                    (card.ability.extra.stardrop_rounds .. '/' .. card.ability.extra.total_rounds) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
    end
}

SMODS.Joker {
    key = "little_prince",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { dollars = 1, } },
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card:get_id() == SMODS.Ranks['star_star'].id then
                if context.other_card.debuff then
                    return { message = localize('k_debuffed'), colour = G.C.RED }
                else
                    G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                    return {
                        dollars = card.ability.extra.dollars,
                        no_juice = true,
                        func = function() -- This is for timing purposes, it runs after the dollar manipulation
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.dollar_buffer = 0
                                    return true
                                end
                            }))
                        end
                    }
                end
            end
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
    key = "wall_of_flesh",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { mult = 0, mult_gain = 2, mult_loss = -2, } },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        local hand = "[hand type]"
        if card.ability.extra.only_hand then
            hand = localize(card.ability.extra.only_hand, 'poker_hands')
        end
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult_loss, card.ability.extra.mult, hand } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round then
            card.ability.extra.only_hand = nil
        end
        if context.before then
            if not card.ability.extra.only_hand then
                card.ability.extra.only_hand = context.scoring_name
                return
            end

            if card.ability.extra.only_hand == context.scoring_name and not context.blueprint then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "mult_gain",
                    scaling_message = {
                        message = "Upgrade!"
                    }
                })
            elseif card.ability.extra.mult >= 2 and not context.blueprint then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "mult_loss",
                    scaling_message = {
                        message = card.ability.extra.mult_loss .. " Mult",
                        colour = G.C.MULT
                    }
                })
            end
        end
        if context.joker_main then
            return { mult = card.ability.extra.mult }
        end
    end
}

SMODS.Joker {
    key = "magolor",
    atlas = "jokers",
    pos = { x = 0, y = 2 },
    config = { extra = { numerator = 1, denominator = 2, xmult = 2 } },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_lucky']
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator)
        return { vars = { num, denom, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.pseudorandom_probability(card, 'example_prob', card.ability.extra.numerator, card.ability.extra.denominator) and
            SMODS.has_enhancement(context.other_card, 'm_lucky') then
            return { xmult = card.ability.extra.xmult }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
    end
}

SMODS.Joker {
    key = "marx",
    atlas = "jokers",
    pos = { x = 6, y = 5 },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['c_fool']
    end,

    calculate = function(self, card, context)
        if context.skipping_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Tarot',
                                key = 'c_fool'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = "Fool!", colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
        end
    end
}

SMODS.Joker {
    key = "weathergirl",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { draw_num = 2 } },
    rarity = 2,
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.draw_num } }
    end,

    calculate = function(self, card, context)
        if context.drawing_cards and not card.ability.extra.active and G.GAME.current_round.discards_left <= 0 then
            card.ability.extra.active = true
            return { modify = context.amount + card.ability.extra.draw_num, message = "Weathered!" }
        end
        if context.hand_drawn and card.ability.extra.active then
            card.ability.extra.active = false
        end
    end }

SMODS.Joker {
    key = "cassknows",
    atlas = "jokers",
    pos = { x = 9, y = 6 },
    config = { extra = { t_chips = 30 } },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips } }
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
