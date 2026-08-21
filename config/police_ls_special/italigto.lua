Config.JobVehicles['police_ls_special'] = Config.JobVehicles['police_ls_special'] or {}

Config.JobVehicles['police_ls_special']['italigto'] = {
    label = 'Test',
    model = 'italigto',

    access = {
        minGrade = 0
    },

    plate = {
        type = 'job',
        prefix = 'NO'
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
