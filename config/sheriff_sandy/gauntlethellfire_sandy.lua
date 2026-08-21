Config.JobVehicles['sheriff_sandy'] = Config.JobVehicles['sheriff_sandy'] or {}

Config.JobVehicles['sheriff_sandy']['gauntlethellfire_sandy'] = {
    label = "Gauntlet Hellfire",
    model = "onx_polgaunt",

    access = {
        minGrade = 0
    },

    plate = {
        type = "job",
        prefix = "SHERIFF"
    },

    appearance = {
        colors = {
            primary = 0,
            secondary = 0,
            pearlescent = 0,
            wheel = 0
        },

        plateIndex = 4,

        livery = {
            enabled = true,
            index = 2
        },

        extras = {
            [1] = 1,
            [2] = 1,
            [3] = 1,
            [4] = 1,
            [5] = 1,
            [8] = 1,
            [9] = 1,
        },

        windowTint = -1,
        wheels = {
            type = 1,
            color = 0
        }
    },

    lights = {
        xenon = {
            enabled = false,
            color = 255
        },

        neon = {
            enabled = false,
            color = {
                r = 255,
                g = 255,
                b = 255
            },
            sides = {
                left = false,
                right = false,
                front = false,
                back = false
            }
        }
    },

    performance = {
        engine = 4,
        brakes = 2,
        transmission = 3,
        suspension = 1,
        armor = -1,
        turbo = true
    },

    mods = {
        spoiler = -1, -- slot 0 | available: 0-3
        frontBumper = 0, -- slot 1 | available: 0-5
        sideSkirt = -1, -- slot 3 | available: 0-1
        exhaust = 2, -- slot 4 | available: 0-4
        frame = -1, -- slot 5 | available: 0-9
        grille = 5, -- slot 6 | available: 0-5
        hood = 0, -- slot 7 | available: 0-5
        fender = -1, -- slot 8 | available: 0-5
        rightFender = -1, -- slot 9 | available: 0-3
        roof = -1, -- slot 10 | available: 0-0
        engine = 4, -- slot 11 | available: 0-4
        brakes = 2, -- slot 12 | available: 0-2
        transmission = 3, -- slot 13 | available: 0-3
        horns = -1, -- slot 14 | available: 0-0
        suspension = 1, -- slot 15 | available: 0-3
        armor = -1, -- slot 16 | available: 0-4
        mod21 = -1, -- slot 21 | available: 0-0
        frontWheels = 36, -- slot 23 | available: 0-44
        trimA = 4, -- slot 27 | available: 0-7
        ornaments = 6, -- slot 28 | available: 0-44
        dashboard = 2, -- slot 29 | available: 0-2
        dial = 1, -- slot 30 | available: 0-2
        shifterLeavers = 0, -- slot 34 | available: 0-0
        plaques = -1, -- slot 35 | available: 0-0
        trunk = 1, -- slot 37 | available: 0-2
        archCover = -1, -- slot 42 | available: 0-9
        aerials = -1, -- slot 43 | available: 0-9
        trimB = -1, -- slot 44 | available: 0-9
        tank = -1, -- slot 45 | available: 0-9
        windows = -1, -- slot 46 | available: 0-15
        livery = 2, -- slot 48 | available: 0-25
        lightbar = 3, -- slot 49 | available: 0-19
    },

}