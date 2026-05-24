SMODS.Joker {
  key = "astro",
  atlas = "jokers",
  pos = { x = 0, y = 0 },
  config = { extra = {
    xchips = 1.5,
  } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.xchips
    } }
  end,

  calculate = function(self, card, context)      
    if context.other_joker and context.other_joker:has_attribute("friends_of_astro")
      then return {
        xchips = card.ability.extra.xchips
      }
    end
  end
}
