SMODS.Joker {
    key = "felli",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = { extra = { xmult = 1, xmult_gain = 1 } },
    rarity = 'star_galaxy',
    cost = 50,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "she_her",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "star_spellbound_mimic", set = "Other", vars = SMODS.Stickers.star_spellbound:loc_vars(info_queue, card).vars }
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,

    calculate = function(self, card, context)
        if context.card_added and not context.blueprint and context.card.ability.set == 'Joker' then
            local joker = context.card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    play_sound('tarot1')
                    play_sound('gold_seal', 1.2, 0.4)
                    card:juice_up()
                    joker:juice_up()
                    joker:add_sticker('star_spellbound', true)
                    return true
                end
            }))
        end
        if context.selling_card and context.card.set == 'Joker' then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain",
                colour = G.C.MULT
            })
        end
        if context.joker_main then
            return { xmult = card.ability.extra.xmult }
        end
    end
}

SMODS.Joker {
    key = "firsttry",
    unlocked = false,
    atlas = "galaxy_jokers",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    config = { immutable = { astral = 4, astral_inc = -1, astral_max = 4 } },
    rarity = "star_galaxy",
    cost = 50,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.immutable.astral, card.ability.immutable.astral_max } }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == 'star_astral' and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.immutable,
                ref_value = "astral",
                scalar_value = "astral_inc",
                no_message = true
            })
            if card.ability.immutable.astral >= 1 then
                SMODS.calculate_effect({
                    message = (card.ability.immutable.astral) ..
                        "/" .. card.ability.immutable.astral_max,
                    colour = SMODS.Gradients["star_fast_rainbow"],
                    card = card
                })
            else
                if card.ability.immutable.astral <= 0 then
                    local pool = {}
                    for _, v in ipairs(G.P_CENTER_POOLS.Consumeables) do
                        if v.hidden and v.key ~= "c_star_starspace" then pool[#pool + 1] = v.key end
                    end
                    local random_key = pseudorandom_element(pool, "random_rare_consumeable")
                    if (#G.consumeables.cards < G.consumeables.config.card_limit) then
                        if random_key then
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.calculate_effect({
                                        message = "Busted!",
                                        colour = SMODS.Gradients
                                            ["star_fast_rainbow"],
                                        card = card
                                    })
                                    SMODS.add_card { key = random_key, skip_materialize = false }
                                    return true
                                end)
                            }))
                        end
                        card.ability.immutable.astral = card.ability.immutable.astral_max
                    end
                end
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == "spawn_rarity" then
            if args.set == "galaxy" then
                return true
            end
        end
    end
}
