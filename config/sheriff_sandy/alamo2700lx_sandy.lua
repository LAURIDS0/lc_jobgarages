Config.JobVehicles['sheriff_sandy'] = Config.JobVehicles['sheriff_sandy'] or {}

Config.JobVehicles['sheriff_sandy']['alamo2700lx_sandy'] = {
    label = "Alamo 2700LX",
    model = "onx_polalamo",

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

        windowTint = 4,
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
        engine = -1,
        brakes = 0,
        transmission = 2,
        suspension = 2,
        armor = -1,
        turbo = true
    },

    mods = {
        frontBumper = 1, -- slot 1 | available: 0-1
        exhaust = 1, -- slot 4 | available: 0-1
        frame = -1, -- slot 5 | available: 0-9
        fender = -1, -- slot 8 | available: 0-5
        rightFender = -1, -- slot 9 | available: 0-3
        roof = 2, -- slot 10 | available: 0-14
        engine = -1, -- slot 11 | available: 0-4
        brakes = 0, -- slot 12 | available: 0-2
        transmission = 2, -- slot 13 | available: 0-3
        horns = -1, -- slot 14 | available: 0-0
        suspension = 2, -- slot 15 | available: 0-3
        armor = -1, -- slot 16 | available: 0-4
        mod21 = -1, -- slot 21 | available: 0-0
        frontWheels = 36, -- slot 23 | available: 0-44
        vanityPlate = 0, -- slot 26 | available: 0-0
        trimA = 4, -- slot 27 | available: 0-7
        ornaments = 6, -- slot 28 | available: 0-44
        dial = 1, -- slot 30 | available: 0-4
        seats = 1, -- slot 32 | available: 0-5
        shifterLeavers = 0, -- slot 34 | available: 0-0
        plaques = 3, -- slot 35 | available: 0-3
        trunk = 13, -- slot 37 | available: 0-32
        archCover = -1, -- slot 42 | available: 0-9
        aerials = -1, -- slot 43 | available: 0-9
        trimB = -1, -- slot 44 | available: 0-9
        tank = -1, -- slot 45 | available: 0-9
        windows = -1, -- slot 46 | available: 0-15
        livery = 2, -- slot 48 | available: 0-25
        lightbar = 2, -- slot 49 | available: 0-19
    },

}