Config.JobVehicles['sheriff_sandy'] = Config.JobVehicles['sheriff_sandy'] or {}

Config.JobVehicles['sheriff_sandy']['sandkingd155_sandy'] = {
    label = "Sandking D155",
    model = "onx_polsandk2",

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
            secondary = 112,
            pearlescent = 0,
            wheel = 156
        },

        plateIndex = 4,

        livery = {
            enabled = true,
            index = 2
        },

        extras = {
            [1] = 1,
            [2] = false,
            [3] = 1,
            [4] = 1,
            [6] = 1,
            [7] = 1,
            [11] = 1,
        },

        windowTint = -1,
        wheels = {
            type = 4,
            color = 156
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
        engine = 2,
        brakes = 1,
        transmission = 1,
        suspension = 1,
        armor = -1,
        turbo = true
    },

    mods = {
        spoiler = -1, -- slot 0 | available: 0-9
        frontBumper = 3, -- slot 1 | available: 0-3
        rearBumper = 2, -- slot 2 | available: 0-2
        sideSkirt = 3, -- slot 3 | available: 0-3
        exhaust = 2, -- slot 4 | available: 0-7
        frame = -1, -- slot 5 | available: 0-9
        grille = 2, -- slot 6 | available: 0-7
        fender = -1, -- slot 8 | available: 0-5
        rightFender = -1, -- slot 9 | available: 0-3
        roof = -1, -- slot 10 | available: 0-13
        engine = 2, -- slot 11 | available: 0-4
        brakes = 1, -- slot 12 | available: 0-2
        transmission = 1, -- slot 13 | available: 0-3
        horns = -1, -- slot 14 | available: 0-0
        suspension = 1, -- slot 15 | available: 0-3
        armor = -1, -- slot 16 | available: 0-4
        mod21 = -1, -- slot 21 | available: 0-0
        frontWheels = 4, -- slot 23 | available: 0-49
        vanityPlate = 0, -- slot 26 | available: 0-0
        trimA = 4, -- slot 27 | available: 0-7
        ornaments = 6, -- slot 28 | available: 0-44
        dial = 3, -- slot 30 | available: 0-6
        seats = 1, -- slot 32 | available: 0-2
        shifterLeavers = 0, -- slot 34 | available: 0-0
        plaques = 3, -- slot 35 | available: 0-3
        trunk = 1, -- slot 37 | available: 0-2
        engineBlock = -1, -- slot 39 | available: 0-3
        archCover = -1, -- slot 42 | available: 0-9
        aerials = -1, -- slot 43 | available: 0-9
        trimB = -1, -- slot 44 | available: 0-9
        tank = -1, -- slot 45 | available: 0-9
        windows = -1, -- slot 46 | available: 0-15
        livery = -1, -- slot 48 | available: 0-25
        lightbar = 1, -- slot 49 | available: 0-19
    },

}