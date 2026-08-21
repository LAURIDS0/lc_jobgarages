Config.JobVehicles['police_ls'] = Config.JobVehicles['police_ls'] or {}

Config.JobVehicles['police_ls']['tstudio_polcypher'] = {

    label = "test car",
    model = "tstudio_polcypher",

    access = {
        minGrade = 0
    },

    plate = {
        type = "job",
        prefix = "test"
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
            index = 0
        },

        extras = {
            [1] = 1,
            [2] = 1,
            [3] = false,
            [4] = 1,
            [5] = 1,
        },

        windowTint = 4,
        wheels = {
            type = 7,
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
        engine = 3,
        brakes = 2,
        transmission = 2,
        suspension = 0,
        armor = -1,
        turbo = true
    },

    mods = {
        frame = -1, -- slot 5 | available: 0-9
        fender = -1, -- slot 8 | available: 0-4
        roof = 0, -- slot 10 | available: 0-6
        engine = 3, -- slot 11 | available: 0-3
        brakes = 2, -- slot 12 | available: 0-2
        transmission = 2, -- slot 13 | available: 0-2
        horns = 1, -- slot 14 | available: 0-57
        suspension = 0, -- slot 15 | available: 0-2
        armor = -1, -- slot 16 | available: 0-4
        unk21 = -1, -- slot 21 | available: 0-0
        frontWheels = -1, -- slot 23 | available: 0-86
        ornaments = 0, -- slot 28 | available: 0-0
        shifterLeavers = 1, -- slot 34 | available: 0-1
        plaques = 1, -- slot 35 | available: 0-8
        trunk = 2, -- slot 37 | available: 0-2
        archCover = -1, -- slot 42 | available: 0-9
        aerials = -1, -- slot 43 | available: 0-9
        windows = 0, -- slot 46 | available: 0-2
        livery = 0, -- slot 48 | available: 0-3
        lightbar = 2, -- slot 49 | available: 0-2
    }

}