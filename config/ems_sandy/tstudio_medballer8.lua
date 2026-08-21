Config.JobVehicles['ems_sandy'] = Config.JobVehicles['ems_sandy'] or {}

Config.JobVehicles['ems_sandy']['tstudio_medballer8'] = {
    label = 'Baller ST-D',
    model = 'tstudio_medballer8',

    access = {
        minGrade = 0
    },

    plate = {
        type = 'job',
        prefix = 'EMS'
    },

    appearance = {
        livery = {
            enabled = true,
            index = 2
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
