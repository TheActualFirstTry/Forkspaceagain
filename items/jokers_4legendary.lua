SMODS.Joker {
  key = "loop_rooms",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = { xmult = 1, xmult_gain = 1.5 } },
  rarity = 4,
  cost = 20,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "star_i_cant_feel_my_legs",

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
  end,

  calculate = function(self, card, context)
    if context.card_added and not context.blueprint and context.card.ability.consumeable and next(SMODS.find_card(context.card.config.center_key)) then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "xmult",
        scalar_value = "xmult_gain",
        colour = G.C.MULT
      })
    end
    if context.joker_main then
      return { xmult = card.ability.extra.xmult
      }
    end
  end
}

local showman_ref = SMODS.showman
SMODS.showman = function(card_key, ...)
  local center = G.P_CENTERS[card_key]
  if center and SMODS.ConsumableTypes[center.set] and next(SMODS.find_card('j_star_loop_rooms')) then
    return true
  end
  return showman_ref(card_key, ...)
end
