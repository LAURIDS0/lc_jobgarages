Config.JobVehicles['sheriff_sandy'] = Config.JobVehicles['sheriff_sandy'] or {}

Config.JobVehicles['sheriff_sandy']['dominatorgt_sandy'] = {
    label = "Dominator GT Interceptor ",
    model = "onx_poldom",

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

        plateIndex = 11,

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
        spoiler = -1, -- slot 0 | available: 0-18
        frontBumper = 7, -- slot 1 | available: 0-8
        rearBumper = 3, -- slot 2 | available: 0-3
        sideSkirt = 0, -- slot 3 | available: 0-2
        exhaust = 3, -- slot 4 | available: 0-4
        frame = -1, -- slot 5 | available: 0-9
        grille = 5, -- slot 6 | available: 0-9
        hood = 1, -- slot 7 | available: 0-14
        fender = -1, -- slot 8 | available: 0-7
        rightFender = -1, -- slot 9 | available: 0-3
        engine = 4, -- slot 11 | available: 0-4
        brakes = 2, -- slot 12 | available: 0-2
        transmission = 3, -- slot 13 | available: 0-3
        horns = -1, -- slot 14 | available: 0-0
        suspension = 1, -- slot 15 | available: 0-3
        armor = -1, -- slot 16 | available: 0-4
        mod21 = -1, -- slot 21 | available: 0-0
        frontWheels = 7, -- slot 23 | available: 0-44
        trimA = 4, -- slot 27 | available: 0-7
        ornaments = 3, -- slot 28 | available: 0-44
        dashboard = 2, -- slot 29 | available: 0-2
        dial = 2, -- slot 30 | available: 0-2
        shifterLeavers = 0, -- slot 34 | available: 0-0
        plaques = -1, -- slot 35 | available: 0-0
        speakers = -1, -- slot 36 | available: 0-2
        archCover = -1, -- slot 42 | available: 0-9
        aerials = -1, -- slot 43 | available: 0-9
        windows = -1, -- slot 46 | available: 0-15
        mod47 = -1, -- slot 47 | available: 0-1
        livery = 2, -- slot 48 | available: 0-25
        lightbar = 2, -- slot 49 | available: 0-19
    },

}