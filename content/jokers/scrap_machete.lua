SMODS.Joker {
  key = "scrap_machete",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    t_mult_extra = 6,
    t_mult = 0
  } },
  rarity = 1,
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.t_mult_extra,
      card.ability.extra.t_mult_extra * count_tarots()
    } }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local tarot_count = count_tarots()
      return {mult = tarot_count * card.ability.extra.t_mult_extra} 
    end
end
}
