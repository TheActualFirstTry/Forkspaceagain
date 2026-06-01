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
                        message = "Charged",
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
                    if random_key then SMODS.add_card{key = random_key} end
                    card.ability.immutable.astral = 0
                return {
                    message = "Busted!",
                    colour = SMODS.Gradients["star_fast_rainbow"],
                   card = card
                }
            end
        end
    end
end
}
