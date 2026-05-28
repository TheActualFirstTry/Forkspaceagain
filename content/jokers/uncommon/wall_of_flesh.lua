SMODS.Joker {
  key = "wall_of_flesh",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    mult = 0,
    mult_gain = 2,
    mult_loss = -2,
  } },
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    local hand = "[Hand type]"
    if card.ability.extra.only_hand then
      hand = localize(card.ability.extra.only_hand, 'poker_hands')
    end

    return {
      vars = {
        card.ability.extra.mult_gain,
        card.ability.extra.mult_loss,
        card.ability.extra.mult,
        hand
      }
    }
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      card.ability.extra.only_hand = nil
    end
    if context.before then
      if not card.ability.extra.only_hand then
        card.ability.extra.only_hand = context.scoring_name
        return
      end

      if card.ability.extra.only_hand == context.scoring_name then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          scaling_message = {
            message = "Upgrade!"
          }
        })
      elseif card.ability.extra.mult >=1 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_loss",
          scaling_message = {
            message = card.ability.extra.mult_loss .. " Mult",
            colour = G.C.MULT
          }
        })
      end
    end

    if context.joker_main then
      return { mult = card.ability.extra.mult }
    end
  end
}
