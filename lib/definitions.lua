function count_tarots()
  local tarot_counter = 0
  if G.consumeables then
    for _, card in pairs(G.consumeables.cards) do
      if card.ability.set == "Tarot" then
        tarot_counter = tarot_counter + 1
      end
    end
  end
  return tarot_counter
end

if CardPronouns then
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
end

SMODS.Gradient {
  key = "trans",
  cycle = 10,
  colours = {
    HEX("73CFF4"),
    HEX("EDAEBF"),
    HEX("D6D6D6"),
    HEX("EDAEBF"),
    HEX("73CFF4"),
  }
}

SMODS.Rarity {
  key = "galaxy",
  badge_colour = HEX("B775E0"),
  default_weight = 0
}

-- credits defined here
STAR_UTIL.credits = {
  squad = {
    colour = G.C.GREEN,
    entries = {
      "Astro",
      "Crystal",
      "Meta",
    }
  },
  artists = {
    colour = G.C.CHIPS,
    entries = {
      "Astro",
      "Camostar34",
      "candycane",
      "FirstTry",
      "Lyre",
      "SDM_0"
    }
  },
  coders = {
    colour = G.C.PURPLE,
    entries = {
      "Astro",
      "Meta",
      "ThunderEdge",
      "wingedcatgirl",
      "CodeRevo",
      "GhostSalt",
      "candycane"

    }
  },
  shaders = {
    colour = G.C.MULT,
    entries = {
      "cassknows",
      "Meta"
    }
  }
}
