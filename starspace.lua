STAR_UTIL = {}
local mod_path = "" .. SMODS.current_mod.path

SMODS.current_mod.menu_cards = function()
	return {
		{set = 'Joker'}, -- adds a random Tarot to the menu
	}
end

for _, f in ipairs(NFS.getDirectoryItems(mod_path .. "lib")) do
  assert(SMODS.load_file("lib/" .. f))()
end

-- joker sounds
SMODS.Sound {
  key = "flashbang_equip",
  path = "flashbang_equip.ogg"
}

SMODS.Sound {
  key = "flashbang_explode",
  path = "flashbang_explode.ogg"
}

-- placeholder atlas
SMODS.Atlas {
  key = "placeholder",
  path = "placeholder.png",
  px = 71, py = 95
}

-- consumable atlas
SMODS.Atlas {
  key = "consumables",
  path = "consumables.png",
  px = 71, py = 95
}

-- booster pack atlas
SMODS.Atlas {
  key = "boosters",
  path = "boosters.png",
  px = 71, py = 95
}

-- astral card atlas
SMODS.Atlas {
  key = "astral_cards",
  path = "astral_cards.png",
  px = 71, py = 95
}

--achievements atlas
SMODS.Atlas {
  key = "star_achievements",
  path = "star_achievements.png",
  px = 66, py = 66
}

-- deck atlas
SMODS.Atlas {
  key = "decks",
  path = "decks.png",
  px = 71, py = 95
}

-- main joker atlas
SMODS.Atlas {
  key = "jokers",
  path = "jokers.png",
  px = 71, py = 95
}

-- galaxy joker atlas
SMODS.Atlas {
  key = "galaxy_jokers",
  path = "galaxy_jokers.png",
  px = 71, py = 95
}

-- rank atlas
SMODS.Atlas {
  key = "ranks_lc",
  path = "ranks_lc.png",
  px = 71, py = 95
}

-- thanks neonflame
for _, f in ipairs(NFS.getDirectoryItems(mod_path .. "items")) do
  local objs = assert(SMODS.load_file("items/" .. f))() or {}
  for _, o in ipairs(objs) do table.insert(regtable, o) end
end

for _, f in ipairs(NFS.getDirectoryItems(mod_path .. "crossmod")) do
  local key, _ = string.gsub(f, "%..*$", "")
  if next(SMODS.find_mod(key)) then
    local objs = assert(SMODS.load_file("crossmod/" .. f))() or {}
    for _, o in ipairs(objs) do
      o.order = 10 -- put crossmod jokers at the VERY end
      o.pools = o.pools or {}
      o.pools.crossmod = true
      table.insert(regtable, o)
    end
  end
end
