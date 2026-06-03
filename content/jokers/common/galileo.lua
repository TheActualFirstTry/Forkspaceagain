SMODS.Joker {
  key = "galileo",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    chipsbuff = 10
  } },
  rarity = 1,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chipsbuff
      }
    }
  end,

  calculate = function(self, card, context)
    if context.poker_hand_changed then
      G.GAME.hands[context.scoring_name].chips = G.GAME.hands[context.scoring_name].chips + card.ability.extra.chipsbuff
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = i == 1 and 0.2 or 0.9,
        func = function()
          play_sound('tarot1')
          card:juice_up(0.8, 0.5)
          G.TAROT_INTERRUPT_PULSE = true
          return true
        end
      }))
      update_hand_text({ delay = 0 }, { chips = G.GAME.hands[context.scoring_name].chips, StatusText = true })
    end
  end
}
