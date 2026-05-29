SMODS.Joker {
  key = "weathergirl",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    t_chips = 125
  } },
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "she_her",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.t_chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability.extra.t_chips
      }
    end
    if context.setting_blind and not context.blueprint then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        func = function()
          ease_discard(-G.GAME.current_round.discards_left, nil, true)
          return true
        end
      }))
      SMODS.calculate_effect(
        { message = "Weathered!" },
        context.blueprint_card or card)
      return true
    end
  end
}
