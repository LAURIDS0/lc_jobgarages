Config.JobVehicles['police_ls'] = Config.JobVehicles['police_ls'] or {}

Config.JobVehicles['police_ls']['tstudio_polsentinel5'] = {
    label = 'Ubermacht Sentinel',
    model = 'tstudio_polsentinel5',

    access = {
        minGrade = 0
    },

    plate = {
        type = 'job',
        prefix = 'POLICE'
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
