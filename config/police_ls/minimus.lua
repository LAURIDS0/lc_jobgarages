Config.JobVehicles['police_ls'] = Config.JobVehicles['police_ls'] or {}

Config.JobVehicles['police_ls']['minimus'] = {
    label = "Annis Minimus",
    model = "tstudio_polminimus",

    access = {
        minGrade = 0
    },

    plate = {
        type = "job",
        prefix = "POL"
    },

    appearance = {
        colors = {
            primary = 111,
            secondary = 111,
            pearlescent = 0,
            wheel = 0
        },

        plateIndex = 4,

        livery = {
            enabled = true,
            index = 1
        },

        extras = {
            [1] = false,
            [2] = false,
            [3] = false,
            [4] = 1,
            [5] = false,
        },

        windowTint = -1,
        wheels = {
            type = 5,
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
        brakes = -1,
        transmission = -1,
        suspension = -1,
        armor = -1,
        turbo = false
    },

    mods = {
        frame = -1, -- slot 5 | available: 0-9
        fender = -1, -- slot 8 | available: 0-4
        roof = -1, -- slot 10 | available: 0-6
        mod21 = -1, -- slot 21 | available: 0-0
        frontWheels = -1, -- slot 23 | available: 0-52
        ornaments = -1, -- slot 28 | available: 0-0
        shifterLeavers = -1, -- slot 34 | available: 0-5
        plaques = -1, -- slot 35 | available: 0-8
        trunk = -1, -- slot 37 | available: 0-2
        archCover = -1, -- slot 42 | available: 0-9
        aerials = -1, -- slot 43 | available: 0-9
        trimB = -1, -- slot 44 | available: 0-9
        tank = -1, -- slot 45 | available: 0-9
        windows = -1, -- slot 46 | available: 0-2
        livery = 1, -- slot 48 | available: 0-3
        lightbar = -1, -- slot 49 | available: 0-2
    },

}