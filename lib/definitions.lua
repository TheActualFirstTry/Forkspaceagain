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

SMODS.Gradient {
  key = "astral",
  cycle = 1,
  colours = { HEX("8574CE") } }

SMODS.Gradient {
  key = "trans",
  cycle = 8,
  colours = {
    HEX("76BAD4"),
    HEX("DBACB9"),
    HEX("BAC3C4"),
    HEX("DBACB9") } }

SMODS.Gradient {
  key = "galaxy",
  cycle = 5,
  interpolation = 'trig',
  colours = {
    HEX("9E74CE"),
    HEX("8574CE") } }

SMODS.Rarity {
  key = "galaxy",
  badge_colour = SMODS.Gradients.star_galaxy,
  default_weight = 0 }

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
      "Slipstream",
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
      "jamirror",
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
