SMODS.Joker {
  key = "flash_card",
  atlas = "jokers",
  pos = { x = 6, y = 2 },
  config = { extra = {
    xchips_gain = 0.1,  
    xchips = 1, 
  } },
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.xchips_gain,
      card.ability.extra.xchips,
    } 
  }
  end,

  calculate = function(self, card, context)
    if context.before and context.poker_hands['star_flash'] then
    card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_gain
    return {
      message = localize {
        type = 'variable',
        key = 'a_xchips',
        vars = { card.ability.extra.xchips },
      },
        colour = G.C.CHIPS
    }
  end
    if context.joker_main then
      return {
      x_chips = card.ability.extra.xchips
      }
    end
  end
}
