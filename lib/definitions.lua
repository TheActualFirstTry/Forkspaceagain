G.ARGS.LOC_COLOURS.star_friend = HEX("6bcfdd")

-- Friends of Astro pool
SMODS.Attribute {
  key = "friends_of_astro"
}

local pools = {
  friend = { 
    default = "friends_of_astro", 
  badge_text_colour = "star_friend" }
}

local scmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
  if obj and obj.pools and obj.pools["friends_of_astro"] then
    badges[#badges + 1] = create_badge(localize("k_friend_badge"), G.ARGS.LOC_COLOURS["star_friend"])
  end
  return scmb(obj, badges)
end

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

SMODS.ObjectType {
  key = "friends_of_astro",
  default = "j_star_astro",
  cards = {}
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
