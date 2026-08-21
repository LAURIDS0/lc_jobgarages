Config.JobVehicles['sheriff_sandy'] = Config.JobVehicles['sheriff_sandy'] or {}

Config.JobVehicles['sheriff_sandy']['tstudio_polscorcher'] = {
    label = 'Cykel',
    model = 'tstudio_polscorcher',

    access = {
        minGrade = 0
    },

    plate = {
        type = 'job',
        prefix = 'SHERIFF'
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
