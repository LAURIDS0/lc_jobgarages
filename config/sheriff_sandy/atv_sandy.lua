Config.JobVehicles['sheriff_sandy'] = Config.JobVehicles['sheriff_sandy'] or {}

Config.JobVehicles['sheriff_sandy']['atv_sandy'] = {
    label = "ATV",
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
            [2] = 1,
            [3] = 1,
            [4] = 1,
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
        engine = 1,
        brakes = 0,
        transmission = 0,
        suspension = -1,
        armor = -1,
        turbo = true
    },

    mods = {
        exhaust = 2, -- slot 4 | available: 0-2
        frame = -1, -- slot 5 | available: 0-9
        hood = -1, -- slot 7 | available: 0-0
        fender = -1, -- slot 8 | available: 0-2
        rightFender = -1, -- slot 9 | available: 0-1
        roof = 2, -- slot 10 | available: 0-2
        engine = 1, -- slot 11 | available: 0-4
        brakes = 0, -- slot 12 | available: 0-2
        transmission = 0, -- slot 13 | available: 0-3
        horns = -1, -- slot 14 | available: 0-0
        suspension = -1, -- slot 15 | available: 0-3
        armor = -1, -- slot 16 | available: 0-4
        mod21 = -1, -- slot 21 | available: 0-0
        frontWheels = -1, -- slot 23 | available: 0-49
        trimA = 4, -- slot 27 | available: 0-7
        dial = 3, -- slot 30 | available: 0-7
        plaques = 1, -- slot 35 | available: 0-3
        trunk = -1, -- slot 37 | available: 0-0
        archCover = -1, -- slot 42 | available: 0-9
        aerials = -1, -- slot 43 | available: 0-9
        windows = -1, -- slot 46 | available: 0-15
        livery = 2, -- slot 48 | available: 0-24
    },

}