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
            local key = SMODS.poll_object{
        pool = SMODS.Consumable.legendaries,
        seed = "astroseed",
        filter = function(pool)
            local newpool = {}
            for _,item in ipairs(pool) do
                local center = G.P_CENTERS[item.key]
                if center and center.key ~= "c_star_starspace" then
                    newpool[#newpool+1] = item
                end
            end
            return newpool
        end
    }
    if (#G.consumeables.cards < G.consumeables.config.card_limit) then
                    if key then SMODS.add_card{key = key} end
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
