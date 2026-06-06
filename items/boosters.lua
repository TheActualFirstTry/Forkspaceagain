SMODS.Booster {
    key = "star_space_pack_1",
    weight = 1,
    kind = 'star_space',
    cost = 4,
    atlas = "boosters",
    pos = { x = 0, y = 0 },
    config = { extra = 2, choose = 1 },
    group_key = "k_star_space_pack",
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return { vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(SMODS.Gradients.star_astral, 0.4), lighten(SMODS.Gradients.star_astral, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _card = {
            set = "star_astral",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "star_sp1"
        }
        return _card
    end,
}

SMODS.Booster {
    key = "star_space_pack_2",
    weight = 1,
    kind = 'star_space',
    cost = 4,
    atlas = "boosters",
    pos = { x = 1, y = 0 },
    config = { extra = 2, choose = 1 },
    group_key = "k_star_space_pack",
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return { vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(SMODS.Gradients.star_astral, 0.4), lighten(SMODS.Gradients.star_astral, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _card = {
            set = "star_astral",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "star_sp1"
        }
        return _card
    end,
}

SMODS.Booster {
    key = "star_space_jumbo_1",
    weight = 1,
    kind = 'star_space',
    cost = 4,
    atlas = "boosters",
    pos = { x = 2, y = 0 },
    config = { extra = 4, choose = 1 },
    group_key = "k_star_space_jumbo",
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return { vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
        }
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(SMODS.Gradients.star_astral, 0.4), lighten(SMODS.Gradients.star_astral, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _card = {
            set = "star_astral",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "star_sp1"
        }
        return _card
    end,
}

SMODS.Booster {
    key = "star_space_mega_1",
    weight = 1,
    kind = 'star_space',
    cost = 4,
    atlas = "boosters",
    pos = { x = 3, y = 0 },
    config = { extra = 4, choose = 2 },
    group_key = "k_star_space_mega",
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return { vars = {
                math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
                    math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
                math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
            key = self.key:sub(1, -3),
}
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(SMODS.Gradients.star_astral, 0.4), lighten(SMODS.Gradients.star_astral, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _card = {
            set = "star_astral",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "star_sp1"
        }
        return _card
    end,
}
