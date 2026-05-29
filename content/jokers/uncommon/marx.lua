SMODS.Joker {
  key = "marx",
  atlas = "jokers",
  pos = { x = 6, y = 5 },
  config = { extra = {
  } },
  rarity = 2,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS['c_fool']
    return {
      vars = {

      }
    }
  end,

  calculate = function(self, card, context)
    if context.skipping_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      G.E_MANAGER:add_event(Event({
        func = (function()
          G.E_MANAGER:add_event(Event({
            func = function()
              SMODS.add_card {
                set = 'Tarot',
                key = 'c_fool'
              }
              G.GAME.consumeable_buffer = 0
              return true
            end
          }))
          SMODS.calculate_effect({ message = "Fool!", colour = G.C.PURPLE },
            context.blueprint_card or card)
          return true
        end)
      }))
    end
  end
}
