SMODS.Joker {
  key = "giant_pizza",
  atlas = "jokers",
  pos = { x = 2, y = 6 },
  config = { extra = { xmult_loss = 1, xmult = 8 } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "it_its",

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_loss, card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if context.after and not context.blueprint then
      if card.ability.extra.xmult - card.ability.extra.xmult_loss <= 1 then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.RED
        }
      else
        card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_loss
        return {
          message = "-X1 Mult",
          colour = G.C.RED
        }
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end
}
