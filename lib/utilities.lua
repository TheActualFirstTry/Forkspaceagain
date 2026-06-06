STAR_UTIL.enabled_crossmod = {
  nflame = { "clanker" } }

-- custom pronoun sets
if next(SMODS.find_mod("cardpronouns")) then
  CardPronouns.Pronoun {
    colour = CardPronouns.badge_types.he_him.colour,
    text_colour = CardPronouns.badge_types.he_him.text_colour,
    pronoun_table = { "He", "He" },
    in_pool = function()
      return false
    end,
    key = "star_michael_pronoun_jackson",
    classification = "masculine"
  }
  CardPronouns.Pronoun {
    colour = CardPronouns.badge_types.she_her.colour,
    text_colour = CardPronouns.badge_types.she_her.text_colour,
    pronoun_table = { "女性", "She", "Her" },
    in_pool = function()
      return false
    end,
    key = "star_i_cant_feel_my_legs",
    classification = "feminine"
  }
  CardPronouns.Pronoun {
    colour = HEX("80407E"),
    text_colour = G.C.WHITE,
    pronoun_table = { "She", "It" },
    in_pool = function()
      return true
    end,
    key = "she_it"
  }
  CardPronouns.Pronoun {
    colour = HEX("405780"),
    text_colour = G.C.WHITE,
    pronoun_table = { "He", "It" },
    in_pool = function()
      return true
    end,
    key = "he_it"
  }
end
