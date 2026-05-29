SMODS.Joker {
    key = "firsttry",
    atlas = "galaxy_jokers",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    config = { extra = {
        astral_count = 0,
        reset_meter = 4
    } },
    rarity = "star_galaxy",
    cost = 50,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_him",

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.reset_meter, card.ability.extra.astral_count } }
    end,

    calculate = function(self, card, context)

    end
}
