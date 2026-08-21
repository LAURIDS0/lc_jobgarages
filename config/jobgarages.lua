Config.JobGarages = {

    ['police_ls'] = {
        label = 'Politiets Garage',

        jobs = {
            police = 0
        },

        blip = {
            enabled = false,
            sprite = 357,
            color = 38,
            scale = 0.8,
            shortRange = true
        },

        zone = {
            coords = vec3(432.95, -974.71, 21.95),
            size = vec3(31.0, 17.0, 3.0),
            rotation = 90.0 
        },

        spawnPoints = {
            vec4(438.21, -988.45, 20.1, 89.73),
            vec4(438.1, -985.48, 20.1, 88.58),
            vec4(438.07, -980.72, 20.1, 88.98),
            vec4(438.06, -977.81, 20.1, 90.45),
            vec4(437.98, -971.68, 20.1, 90.51),
            vec4(438.12, -968.77, 20.1, 89.16),
            vec4(438.02, -964.04, 20.1, 88.09),
            vec4(438.15, -960.97, 20.1, 89.36),
            vec4(427.9, -988.58, 20.1, 269.66),
            vec4(427.73, -985.42, 20.1, 270.07),
            vec4(427.72, -980.78, 20.1, 270.78),
            vec4(427.46, -977.64, 20.1, 268.82),
            vec4(427.87, -971.79, 20.1, 269.58),
            vec4(427.8, -968.66, 20.1, 269.84),
            vec4(427.67, -963.99, 20.1, 269.74),
            vec4(427.87, -961.01, 20.1, 271.54),
        }
    },

    ['police_ls_special'] = {
        label = 'Afdeling Garage',

        jobs = {
            police = 0
        },

        blip = {
            enabled = false,
            sprite = 357,
            color = 38,
            scale = 0.8,
            shortRange = true
        },

        zone = {
            coords = vec3(409.82, -957.97, 21.95),
            size = vec3(15.0, 8.0, 3.0),
            rotation = 90.0 
        },

        spawnPoints = {
            vec4(410.84, -963.73, 20.1, 270.93),
            vec4(410.52, -960.83, 20.1, 268.5),
            vec4(410.77, -955.09, 20.1, 269.97),
            vec4(410.7, -952.11, 20.1, 271.36),
        }
    },

    ['police_ls_halo'] = {
        label = 'Politiets Helikopter Garage',

        jobs = {
            police = 0
        },

        blip = {
            enabled = false,
            sprite = 357,
            color = 38,
            scale = 0.8,
            shortRange = true
        },

        zone = {
            coords = vec3(440.97, -995.97, 49.32),
            size = vec3(15.0, 15.0, 3.0),
            rotation = 90.0 
        },

        spawnPoints = {
            vec4(441.03, -996.12, 48.21, 359.09),
        }
    },

    ['ems_sandy'] = {
        label = 'EMS Garage',

        jobs = {
            ambulance = 0
        },

        blip = {
            enabled = false,
            sprite = 357,
            color = 38,
            scale = 0.8,
            shortRange = true
        },

        zone = {
            coords = vec3(1726.6, 3622.7, 35.58),
            size = vec3(15.0, 10.0, 5.0),
            rotation = 30.0 
        },

        spawnPoints = {
            vec4(1723.2, 3619.85, 33.06, 210.5),
            vec4(1732.87, 3619.14, 33.22, 170.12),
        }
    },

    ['sheriff_sandy'] = {
        label = 'Sheriff Garage',

        jobs = {
            bcso = 0
        },

        blip = {
            enabled = false,
            sprite = 357,
            color = 38,
            scale = 0.8,
            shortRange = true
        },

        zone = {
            coords = vec3(1849.91, 3694.95, 32.74),
            size = vec3(35.0, 6.0, 5.0),
            rotation = 30.0 
        },

        spawnPoints = {
            vec4(1839.42, 3689.32, 32.77, 78.8),
            vec4(1842.45, 3691.44, 32.67, 78.48),
            vec4(1845.96, 3693.33, 32.54, 79.28),
            vec4(1850.26, 3695.42, 32.43, 78.44),
            vec4(1853.79, 3697.38, 32.45, 79.85),
            vec4(1857.14, 3699.61, 32.44, 78.68),
            vec4(1860.85, 3701.59, 32.42, 79.05),
        }
    }

}
