Config = {}

-- General Config
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use psr-target interactions (don't change this, go to your server.cfg and add setr UseTarget true)
Config.DebugPoly = true
Config.MinimalDoctors = 2 -- How many players with the doctor job to prevent the hospital check-in system from being used
Config.DocCooldown = 1 -- Cooldown between doctor calls allowed, in minutes
Config.WipeInventoryOnRespawn = true -- Enable or disable removing all the players items when they respawn at the hospital
Config.AlertShowInfo = 2 -- How many injuries a player must have before being alerted about them
Config.DispatchTimer = 180

-- Payments
Config.BillCost = 2000 -- Price that players are charged for using the hospital check-in system
Config.DeathTime = 300 -- How long the timer is for players to bleed out completely and respawn at the hospital

-- Healing / Injuries / Bleeding / Damage Rates
Config.MorphineInterval = 60 -- Set the length of time morpine last (per one)
Config.HealthDamage = 5 -- Minumum damage done to health before checking for injuries
Config.ArmorDamage = 5 -- Minumum damage done to armor before checking for injuries
Config.ForceInjury = 35 -- Maximum amount of damage a player can take before limb damage & effects are forced to occur
Config.AlwaysBleedChance = 70 -- Set the chance out of 100 that if a player is hit with a weapon, that also has a random chance, it will cause bleeding
Config.BleedTickRate = 30 -- How much time, in seconds, between bleed ticks
Config.BleedMovementTick = 10 -- How many seconds is taken away from the bleed tick rate if the player is walking, jogging, or sprinting
Config.BleedMovementAdvance = 3 -- How much time moving while bleeding adds
Config.BleedTickDamage = 8 -- The base damage that is multiplied by bleed level everytime a bleed tick occurs

-- Timers
Config.MessageTimer = 12 -- How long it will take to display limb/bleed message
Config.AIHealTimer = 20 -- How long it will take to be healed after checking in, in seconds
Config.FadeOutTimer = 2 -- How many bleed ticks occur before fadeout happens
Config.BlackoutTimer = 10 -- How many bleed ticks occur before blacking out
Config.AdvanceBleedTimer = 10 -- How many bleed ticks occur before bleed level increases
Config.HeadInjuryTimer = 30 -- How much time, in seconds, do head injury effects chance occur
Config.ArmInjuryTimer = 30 -- How much time, in seconds, do arm injury effects chance occur
Config.LegInjuryTimer = 15 -- How much time, in seconds, do leg injury effects chance occur

-- Chances
Config.HeadInjuryChance = 25 -- The chance, in percent, that head injury side-effects get applied
Config.LegInjuryChance = { -- The chance, in percent, that leg injury side-effects get applied
    Running = 50,
    Walking = 15
}
Config.MajorArmoredBleedChance = 45 -- The chance, in percent, that a player will get a bleed effect when taking heavy damage while wearing armor
Config.MaxInjuryChanceMulti = 3 -- How many times the HealthDamage value above can divide into damage taken before damage is forced to be applied
Config.DamageMinorToMajor = 35 -- How much damage would have to be applied for a minor weapon to be considered a major damage event. Put this at 100 if you want to disable it

Config.Locations = {
    ["checking"] = {
	    [1] = vector3(-286.28, 804.77, 119.3), -- Valentine
    },
    ["duty"] = {
        [1] = vector3(-284.63, 808.36, 119.39), -- Valentine
        [2] = vector3(2385.24, -1374.19, 46.55), -- Saint Denis
        [3] = vector3(-3650.37, -2645.63, -13.45), -- Armadillo
    },
    ["vehicle"] = {
        [1] = vector4(-387.12, 775.3, 115.79, 189.93), -- Valentine Stable
        [2] = vector4(2396.21, -1350.28, 45.74, 118.78), -- Saint Denis
        [3] = vector4(-3666.87, -2643.86, -13.75, 280.63), -- Armadillo
    },
    ["armory"] = {
        [1] = vector3(-289.913, 816.26, 119.38), -- Valentine
        [2] = vector3(2382.31, -1372.55, 46.55), -- Saint Denis
        [3] = vector3(-3651.38, -2653.74, -13.45), -- Armadillo
    },
    ["stash"] = {
        [1] = vector3(-288.79, 808.83, 119.38), -- Valentine
        [2] = vector3(2378.21, -1370.32, 45.82), -- Saint Denis
        [3] = vector3(-3648.06, -2647.18, -13.46), -- Armadillo
    },
    ["beds"] = {
        [1] = {coords = vector4(-282.19, 814.46, 118.9, 96.10), taken = false, model = -2121768533}, -- Valentine 1
        [2] = {coords = vector4(-284.01, 813.39, 118.9, 5.67), taken = false, model = -2121768533}, -- Valentine 2
        [3] = {coords = vector4(2392.70, -1373.21, 45.45, 65.5), taken = false, model = 158978}, -- Saint Denis 1 /stream/SaintDenis.ymap
        [4] = {coords = vector4(2390.11, -1377.52, 45.45, 65.5), taken = false, model = 158978}, -- Saint Denis 2 /stream/SaintDenis.ymap
        [5] = {coords = vector4(-3655.04, -2645.26, -14.46, -94.0), taken = false, model = 247554}, -- Armadillo Custom Dotcors Office /stream/Armadillo.ymap
        [6] = {coords = vector4(-3654.89, -2650.54, -14.46, -94.0), taken = false, model = 247554}, -- Armadillo Custom Dotcors Office /stream/Armadillo.ymap
    },
    ["stations"] = {
        [1] = {label = Lang:t('info.v_hospital'), coords = vector4(-284.49, 807.49, 119.38, 104.89)}, -- Valentine
        [2] = {label = Lang:t('info.sd_hospital'), coords = vector4(2387.306, -1369.280, 46.541, 242.542)}, -- Saint Denis
        [3] = {label = Lang:t('info.a_hospital'), coords = vector4(-3651.82, -2649.4, -13.45, 99.22)}, -- Armadillo
    }
}

Config.AuthorizedCarts = { -- Vehicles players can use based on their doctor job grade level
	-- Grade 0
	[0] = {
		["doctor"] = "Ambulance",
	},
	-- Grade 1
	[1] = {
		["doctor"] = "Ambulance",

	},
	-- Grade 2
	[2] = {
		["doctor"] = "Ambulance",
	},
	-- Grade 3
	[3] = {
		["doctor"] = "Ambulance",
	},
	-- Grade 4
	[4] = {
		["doctor"] = "Ambulance",
	}
}

Config.Items = { -- Items for doctors
    label = Lang:t('info.safe'),
    slots = 30,
    items = {
        [1] = {
            name = "radio",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
    }
}

Config.WeaponClasses = { -- Define RDR2 Weapon Classes
    ['SMALL_CALIBER'] = 1,
    ['MEDIUM_CALIBER'] = 2,
    ['HIGH_CALIBER'] = 3,
    ['SHOTGUN'] = 4,
    ['CUTTING'] = 5,
    ['LIGHT_IMPACT'] = 6,
    ['HEAVY_IMPACT'] = 7,
    ['EXPLOSIVE'] = 8,
    ['FIRE'] = 9,
    ['SUFFOCATING'] = 10,
    ['OTHER'] = 11,
    ['WILDLIFE'] = 12,
    ['NOTHING'] = 13
}

Config.MinorInjurWeapons = { -- Define which weapons cause small injuries
    [Config.WeaponClasses['SMALL_CALIBER']] = true,
    [Config.WeaponClasses['MEDIUM_CALIBER']] = true,
    [Config.WeaponClasses['CUTTING']] = true,
    [Config.WeaponClasses['WILDLIFE']] = true,
    [Config.WeaponClasses['OTHER']] = true,
    [Config.WeaponClasses['LIGHT_IMPACT']] = true,
}

Config.MajorInjurWeapons = { -- Define which weapons cause large injuries
    [Config.WeaponClasses['HIGH_CALIBER']] = true,
    [Config.WeaponClasses['HEAVY_IMPACT']] = true,
    [Config.WeaponClasses['SHOTGUN']] = true,
    [Config.WeaponClasses['EXPLOSIVE']] = true,
}

Config.AlwaysBleedChanceWeapons = { -- Define which weapons will always cause bleedign
    [Config.WeaponClasses['SMALL_CALIBER']] = true,
    [Config.WeaponClasses['MEDIUM_CALIBER']] = true,
    [Config.WeaponClasses['CUTTING']] = true,
    [Config.WeaponClasses['WILDLIFE']] = false,
}

Config.ForceInjuryWeapons = { -- Define which weapons will always cause injuries
    [Config.WeaponClasses['HIGH_CALIBER']] = true,
    [Config.WeaponClasses['HEAVY_IMPACT']] = true,
    [Config.WeaponClasses['EXPLOSIVE']] = true,
}

Config.CriticalAreas = { -- Define body areas that will always cause bleeding if wearing armor or not
    ['UPPER_BODY'] = { armored = false },
    ['LOWER_BODY'] = { armored = true },
    ['SPINE'] = { armored = true },
}

Config.StaggerAreas = { -- Define body areas that will always cause staggering if wearing armor or not
    ['SPINE'] = { armored = true, major = 60, minor = 30 },
    ['UPPER_BODY'] = { armored = false, major = 60, minor = 30 },
    ['LLEG'] = { armored = true, major = 100, minor = 85 },
    ['RLEG'] = { armored = true, major = 100, minor = 85 },
    ['LFOOT'] = { armored = true, major = 100, minor = 100 },
    ['RFOOT'] = { armored = true, major = 100, minor = 100 },
}

Config.WoundStates = { -- Translate wound alerts
    Lang:t('states.irritated'),
    Lang:t('states.quite_painful'),
    Lang:t('states.painful'),
    Lang:t('states.really_painful'),
}

Config.BleedingStates = { -- Translate bleeding alerts
    [1] = {label = Lang:t('states.little_bleed')},
    [2] = {label = Lang:t('states.bleed')},
    [3] = {label = Lang:t('states.lot_bleed')},
    [4] = {label = Lang:t('states.big_bleed')},
}

Config.MovementRate = { -- Set the player movement rate based on the level of damage they have
    0.98,
    0.96,
    0.94,
    0.92,
}

Config.Bones = { -- Correspond bone hash numbers to their label
    [0]     = 'NONE',
    [31085] = 'HEAD',
    [31086] = 'HEAD',
    [39317] = 'NECK',
    [57597] = 'SPINE',
    [23553] = 'SPINE',
    [24816] = 'SPINE',
    [24817] = 'SPINE',
    [24818] = 'SPINE',
    [10706] = 'UPPER_BODY',
    [64729] = 'UPPER_BODY',
    [11816] = 'LOWER_BODY',
    [45509] = 'LARM',
    [61163] = 'LARM',
    [18905] = 'LHAND',
    [4089] = 'LFINGER',
    [4090] = 'LFINGER',
    [4137] = 'LFINGER',
    [4138] = 'LFINGER',
    [4153] = 'LFINGER',
    [4154] = 'LFINGER',
    [4169] = 'LFINGER',
    [4170] = 'LFINGER',
    [4185] = 'LFINGER',
    [4186] = 'LFINGER',
    [26610] = 'LFINGER',
    [26611] = 'LFINGER',
    [26612] = 'LFINGER',
    [26613] = 'LFINGER',
    [26614] = 'LFINGER',
    [58271] = 'LLEG',
    [63931] = 'LLEG',
    [2108] = 'LFOOT',
    [14201] = 'LFOOT',
    [40269] = 'RARM',
    [28252] = 'RARM',
    [57005] = 'RHAND',
    [58866] = 'RFINGER',
    [58867] = 'RFINGER',
    [58868] = 'RFINGER',
    [58869] = 'RFINGER',
    [58870] = 'RFINGER',
    [64016] = 'RFINGER',
    [64017] = 'RFINGER',
    [64064] = 'RFINGER',
    [64065] = 'RFINGER',
    [64080] = 'RFINGER',
    [64081] = 'RFINGER',
    [64096] = 'RFINGER',
    [64097] = 'RFINGER',
    [64112] = 'RFINGER',
    [64113] = 'RFINGER',
    [36864] = 'RLEG',
    [51826] = 'RLEG',
    [20781] = 'RFOOT',
    [52301] = 'RFOOT',
}

Config.BoneIndexes = { -- Correspond bone labels to their hash number
    ['NONE'] = 0,
    -- ['HEAD'] = 31085,
    ['HEAD'] = 31086,
    ['NECK'] = 39317,
    -- ['SPINE'] = 57597,
    -- ['SPINE'] = 23553,
    -- ['SPINE'] = 24816,
    -- ['SPINE'] = 24817,
    ['SPINE'] = 24818,
    -- ['UPPER_BODY'] = 10706,
    ['UPPER_BODY'] = 64729,
    ['LOWER_BODY'] = 11816,
    -- ['LARM'] = 45509,
    ['LARM'] = 61163,
    ['LHAND'] = 18905,
    -- ['LFINGER'] = 4089,
    -- ['LFINGER'] = 4090,
    -- ['LFINGER'] = 4137,
    -- ['LFINGER'] = 4138,
    -- ['LFINGER'] = 4153,
    -- ['LFINGER'] = 4154,
    -- ['LFINGER'] = 4169,
    -- ['LFINGER'] = 4170,
    -- ['LFINGER'] = 4185,
    -- ['LFINGER'] = 4186,
    -- ['LFINGER'] = 26610,
    -- ['LFINGER'] = 26611,
    -- ['LFINGER'] = 26612,
    -- ['LFINGER'] = 26613,
    ['LFINGER'] = 26614,
    -- ['LLEG'] = 58271,
    ['LLEG'] = 63931,
    -- ['LFOOT'] = 2108,
    ['LFOOT'] = 14201,
    -- ['RARM'] = 40269,
    ['RARM'] = 28252,
    ['RHAND'] = 57005,
    -- ['RFINGER'] = 58866,
    -- ['RFINGER'] = 58867,
    -- ['RFINGER'] = 58868,
    -- ['RFINGER'] = 58869,
    -- ['RFINGER'] = 58870,
    -- ['RFINGER'] = 64016,
    -- ['RFINGER'] = 64017,
    -- ['RFINGER'] = 64064,
    -- ['RFINGER'] = 64065,
    -- ['RFINGER'] = 64080,
    -- ['RFINGER'] = 64081,
    -- ['RFINGER'] = 64096,
    -- ['RFINGER'] = 64097,
    -- ['RFINGER'] = 64112,
    ['RFINGER'] = 64113,
    -- ['RLEG'] = 36864,
    ['RLEG'] = 51826,
    -- ['RFOOT'] = 20781,
    ['RFOOT'] = 52301,
}

Config.Weapons = { -- Correspond weapon names to their class number
    -- Lassos
    [`WEAPON_LASSO`] = Config.WeaponClasses['NONE'],
    [`WEAPON_LASSO_REINFORCED`] = Config.WeaponClasses['NONE'],

    -- Arrows
    [`WEAPON_BOW`] = Config.WeaponClasses['ARROW'],
    [`WEAPON_BOW_IMPROVED`] = Config.WeaponClasses['ARROW'],

    -- Melee
    [`WEAPON_MELEE_KNIFE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_MELEE_KNIFE_JAWBONE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_MELEE_HAMMER`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_MELEE_CLEAVER`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_MELEE_TORCH`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_MELEE_HATCHET`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_MELEE_MACHETE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_THROWN_THROWING_KNIVES`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_THROWN_TOMAHAWK`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_THROWN_TOMAHAWK_ANCIENT`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_THROWN_BOLAS`] = Config.WeaponClasses['CUTTING'],

    -- Fire
    [`WEAPON_MELEE_LANTERN`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_MELEE_DAVY_LANTERN`] = Config.WeaponClasses['FIRE'],

    -- Explosives
    [`WEAPON_THROWN_DYNAMITE`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_THROWN_MOLOTOV`] = Config.WeaponClasses['EXPLOSIVE'],

    -- Small Caliber
    [`WEAPON_REVOLVER_CATTLEMAN`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_REVOLVER_CATTLEMAN_MEXICAN`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_REVOLVER_DOUBLEACTION_GAMBLER`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_REVOLVER_SCHOFIELD`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_REVOLVER_LEMAT`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_REVOLVER_NAVY`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_PISTOL_VOLCANIC`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_PISTOL_M1899`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_PISTOL_MAUSER`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_PISTOL_SEMIAUTO`] = Config.WeaponClasses['SMALL_CALIBER'],

    -- Mid Caliber
    [`WEAPON_REPEATER_CARBINE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_REPEATER_WINCHESTER`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_REPEATER_HENRY`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_REPEATER_EVANS`] = Config.WeaponClasses['MEDIUM_CALIBER'],

    -- HHigh Caliber
    [`WEAPON_RIFLE_VARMINT`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_RIFLE_SPRINGFIELD`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_RIFLE_BOLTACTION`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_RIFLE_ELEPHANT`] = Config.WeaponClasses['HIGH_CALIBER'],

    -- shotgun
    [`WEAPON_SHOTGUN_DOUBLEBARREL`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_SHOTGUN_SAWEDOFF`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_SHOTGUN_SEMIAUTO`] = Config.WeaponClasses['SHOTGUN'],
    -- sniper rifle
    [`WEAPON_SNIPERRIFLE_ROLLINGBLOCK`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_SNIPERRIFLE_ROLLINGBLOCK_EXOTIC`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_SNIPERRIFLE_CARCANO`] = Config.WeaponClasses['HIGH_CALIBER'],
}

Config.VehicleSettings = { -- Enable or disable vehicle extras when pulling them from the doctor job vehicle spawner
    ["cart1"] = { -- Model name
        ["extras"] = {
            ["1"] = false, -- on/off
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
        }
    },
}
