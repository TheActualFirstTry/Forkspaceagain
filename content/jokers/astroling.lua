SMODS.Joker {
  key = "astroling",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  rarity = 1,
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
    } }
  end,

  calculate = function(self, card, context)

  end
}

local smods_smeared_check_ref = SMODS.smeared_check
function SMODS.smeared_check(card, suit, ...)
    if next(SMODS.find_card("j_star_astroling")) then
        if (card.base.suit == 'Clubs' or card.base.suit == 'Spades') and (suit == 'Clubs' or suit == 'Spades') then
            return true
        end
    end
    return smods_smeared_check_ref(card, suit, ...)
end
