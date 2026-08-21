Config.JobVehicles['police_ls_halo'] = Config.JobVehicles['police_ls_halo'] or {}

Config.JobVehicles['police_ls_halo']['onx_polmav'] = {
    label = 'Halo',
    model = 'onx_polmav',

    access = {
        minGrade = 0
    },

    plate = {
        type = 'job',
        prefix = 'POLICE'
    },

    appearance = {
        colors = {
            primary = 1,
            secondary = 1
        },
        livery = {
            enabled = true,
            index = 1
        },
        extras = {
            [1] = true,
            [2] = true,
            [3] = true
        }
    },

    inventory = {
        glovebox = {
            {
                name = 'phone',
                count = 1
            }
        }
    }
}
