Config.JobVehicles['sheriff_sandy'] = Config.JobVehicles['sheriff_sandy'] or {}

Config.JobVehicles['sheriff_sandy']['tstudio_polbuffalo4'] = {
    label = 'Bravado Buffalo STX',
    model = 'tstudio_polbuffalo4',

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
