Config.JobVehicles['sheriff_sandy'] = Config.JobVehicles['sheriff_sandy'] or {}

Config.JobVehicles['sheriff_sandy']['tstudio_polstanier'] = {
    label = 'Vapid Stanier',
    model = 'tstudio_polstanier',

    access = {
        minGrade = 0
    },

    plate = {
        type = 'job',
        prefix = 'SHERIFF'
    },

    appearance = {
        livery = {
            enabled = true,
            index = 1
        }
    },

    inventory = {
        glovebox = {
            {
                name = 'phone',
                count = 1
            }
        },
        trunk = {
            {
                name = 'ammo-9',
                count = 50
            }
        }
    }
}
