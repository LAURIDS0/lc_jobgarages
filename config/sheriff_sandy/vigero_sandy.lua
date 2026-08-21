Config.JobVehicles['sheriff_sandy'] = Config.JobVehicles['sheriff_sandy'] or {}

Config.JobVehicles['sheriff_sandy']['vigero_sandy'] = {
    label = "Vigero ZX",
    model = "onx_polvigero",

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
        suspension = 3,
        armor = -1,
        turbo = true
    },

    mods = {
        spoiler = -1, -- slot 0 | available: 0-6
        frontBumper = 0, -- slot 1 | available: 0-11
        rearBumper = 9, -- slot 2 | available: 0-9
        sideSkirt = 1, -- slot 3 | available: 0-10
        exhaust = 6, -- slot 4 | available: 0-6
        frame = -1, -- slot 5 | available: 0-9
        grille = 0, -- slot 6 | available: 0-5
        hood = 17, -- slot 7 | available: 0-25
        fender = -1, -- slot 8 | available: 0-5
        rightFender = -1, -- slot 9 | available: 0-3
        engine = 4, -- slot 11 | available: 0-4
        brakes = 2, -- slot 12 | available: 0-2
        transmission = 3, -- slot 13 | available: 0-3
        horns = -1, -- slot 14 | available: 0-0
        suspension = 3, -- slot 15 | available: 0-3
        armor = -1, -- slot 16 | available: 0-4
        mod21 = -1, -- slot 21 | available: 0-0
        frontWheels = 43, -- slot 23 | available: 0-44
        trimA = 4, -- slot 27 | available: 0-7
        ornaments = 6, -- slot 28 | available: 0-44
        dashboard = 2, -- slot 29 | available: 0-2
        dial = 2, -- slot 30 | available: 0-2
        shifterLeavers = 0, -- slot 34 | available: 0-0
        plaques = -1, -- slot 35 | available: 0-0
        archCover = -1, -- slot 42 | available: 0-9
        aerials = -1, -- slot 43 | available: 0-9
        windows = -1, -- slot 46 | available: 0-15
        livery = 2, -- slot 48 | available: 0-25
        lightbar = 3, -- slot 49 | available: 0-19
    },

}