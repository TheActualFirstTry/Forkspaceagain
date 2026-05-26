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
    if context.skipping_booster then
      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card {
            set = 'Tarot',
            key = 'c_fool'
          }
          return true
        end,
      }))
      G.E_MANAGER:add_event(Event({
        func = function()
          card:juice_up(0.3, 0.5)
          play_sound('timpani')
          return true
        end
      }))
      return {
        message = "Haha! See you later!",
        colour = G.C.PURPLE
      }
    end
  end
}
