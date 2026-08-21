Config.JobVehicles['sheriff_sandy'] = Config.JobVehicles['sheriff_sandy'] or {}

Config.JobVehicles['sheriff_sandy']['canisinvictus_sandy'] = {
    label = "Canis Invictus",
    model = "onx_polverus",

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
            [2] = false,
            [3] = 1,
            [4] = 1,
            [5] = 1,
            [11] = 1,
            [12] = false,
        },

        windowTint = -1,
        wheels = {
            type = 4,
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
        engine = -1,
        brakes = 1,
        transmission = 1,
        suspension = 0,
        armor = -1,
        turbo = true
    },

    mods = {
        spoiler = 1, -- slot 0 | available: 0-17
        frontBumper = 1, -- slot 1 | available: 0-7
        rearBumper = 0, -- slot 2 | available: 0-6
        sideSkirt = 0, -- slot 3 | available: 0-5
        frame = -1, -- slot 5 | available: 0-9
        grille = 9, -- slot 6 | available: 0-11
        hood = -1, -- slot 7 | available: 0-7
        fender = -1, -- slot 8 | available: 0-5
        rightFender = -1, -- slot 9 | available: 0-5
        roof = -1, -- slot 10 | available: 0-2
        engine = -1, -- slot 11 | available: 0-4
        brakes = 1, -- slot 12 | available: 0-2
        transmission = 1, -- slot 13 | available: 0-3
        horns = -1, -- slot 14 | available: 0-0
        suspension = 0, -- slot 15 | available: 0-3
        armor = -1, -- slot 16 | available: 0-4
        mod21 = -1, -- slot 21 | available: 0-0
        frontWheels = 41, -- slot 23 | available: 0-49
        vanityPlate = 0, -- slot 26 | available: 0-0
        trimA = 4, -- slot 27 | available: 0-7
        ornaments = 6, -- slot 28 | available: 0-44
        dashboard = 2, -- slot 29 | available: 0-2
        dial = 3, -- slot 30 | available: 0-6
        doorSpeaker = -1, -- slot 31 | available: 0-7
        seats = 1, -- slot 32 | available: 0-10
        shifterLeavers = 0, -- slot 34 | available: 0-0
        trunk = -1, -- slot 37 | available: 0-5
        engineBlock = 3, -- slot 39 | available: 0-9
        archCover = -1, -- slot 42 | available: 0-9
        aerials = -1, -- slot 43 | available: 0-9
        windows = -1, -- slot 46 | available: 0-15
        livery = 2, -- slot 48 | available: 0-25
        lightbar = 3, -- slot 49 | available: 0-19
    },

}