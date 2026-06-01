SMODS.Joker {
    key = "firsttry",
    atlas = "galaxy_jokers",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    config = { extra = {

    }, immutable = { 
        astral = 0, astral_inc = 1, astral_max = 4
     } },
    rarity = "star_galaxy",
    cost = 50,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.immutable.astral, card.ability.immutable.astral_max, " " } }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == 'star_astral' then
            SMODS.scale_card(card, {
                    ref_table = card.ability.immutable,
                    ref_value = "astral",
                    scalar_value = "astral_inc",
                    scaling_message = {
                        message = (card.ability.immutable.astral + card.ability.immutable.astral_inc) .. "/" .. card.ability.immutable.astral_max,
                        colour = SMODS.Gradients["star_fast_rainbow"],
                    },
                })
                if card.ability.immutable.astral >= card.ability.immutable.astral_max then
            local pool = {}
                    for _,v in ipairs(G.P_CENTER_POOLS.Consumeables) do
                      if v.hidden and v.key ~= "c_star_starspace" then pool[#pool+1] = v.key end
                end
                local random_key = pseudorandom_element(pool, "random_rare_consumeable")
                if (#G.consumeables.cards < G.consumeables.config.card_limit) then
                    if random_key then
                        G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.8,
                        func = (function()
                        SMODS.calculate_effect({message = "Charged!", colour = SMODS.Gradients["star_fast_rainbow"], card = card})
                        return true
                    end)
                }))
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                        SMODS.calculate_effect({message = "Busted!", colour = SMODS.Gradients["star_fast_rainbow"], card = card})
                        SMODS.add_card{key = random_key, skip_materialize = false}
                        return true
                    end)
                }))
                    end
                    card.ability.immutable.astral = 0
            end
        end
    end
end
}
