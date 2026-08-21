# LC Garages - Job Garage Documentation

This document explains how to configure the **job garage system** in `lc_garages`.

The job garage configuration is intentionally split into two levels:

- `config/jobgarages.lua` contains the **garage itself**.
- Each garage has its own folder containing the **vehicle configuration files** for that garage.

The structure should look like this:

```text
config/
├── config.lua
├── jobgarages.lua
│
├── police_ls/
│   ├── tstudio_polomnisegt.lua
│   ├── tstudio_polcypher.lua
│   └── ...
│
├── police_special/
│   └── ...
│
├── police_halo/
│   └── ...
│
├── ems_sandy/
│   ├── tstudio_meddoradostx.lua
│   └── ...
│
└── sheriff_sandy/
    ├── tstudio_poldoradostx.lua
    └── ...
```

---

# 1. `config/jobgarages.lua`

This file describes **where the garage is, who can use the garage, whether it has a blip, and where vehicles spawn**.

Vehicle-specific settings do **not** belong here.

Example:

```lua
Config.JobGarages = {

    ['police_ls'] = {

        label = 'Los Santos Police Garage',

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
            vec4(438.10, -985.48, 20.1, 88.58),
            vec4(438.07, -980.72, 20.1, 88.98)
        }
    }
}
```

## Required garage fields

These are required:

```text
label
jobs
zone
spawnPoints
```

`blip` is optional.

---

# 2. Garage `label`

```lua
label = 'Los Santos Police Garage'
```

**Required:** Yes

The text displayed for the garage.

---

# 3. Garage `jobs`

```lua
jobs = {
    police = 0
}
```

**Required:** Yes

Defines which jobs can use the garage and the minimum grade required for each job.

Format:

```lua
jobs = {
    jobName = minimumGrade
}
```

Example:

```lua
jobs = {
    police = 0,
    bcso = 2
}
```

This means:

- Police grade `0+` can use the garage.
- BCSO grade `2+` can use the garage.

You can add multiple jobs to the same garage.

---

# 4. Garage `blip`

```lua
blip = {
    enabled = true,
    sprite = 357,
    color = 38,
    scale = 0.8,
    shortRange = true
}
```

**Required:** No

If `blip` is omitted, the garage does not create a blip.

## `blip.enabled`

```lua
enabled = true
```

**Required:** No, if the `blip` section exists.

- `true` = create the blip.
- `false` = do not create the blip.

## `blip.sprite`

```lua
sprite = 357
```

**Required:** No

The GTA blip sprite ID.

## `blip.color`

```lua
color = 38
```

**Required:** No

The GTA blip color ID.

## `blip.scale`

```lua
scale = 0.8
```

**Required:** No

Blip scale.

## `blip.shortRange`

```lua
shortRange = true
```

**Required:** No

Controls whether the blip is short range.

---

# 5. Garage `zone`

```lua
zone = {
    coords = vec3(432.95, -974.71, 21.95),
    size = vec3(31.0, 17.0, 3.0),
    rotation = 90.0
}
```

**Required:** Yes

The garage uses an `ox_lib` box zone.

## `zone.coords`

```lua
coords = vec3(432.95, -974.71, 21.95)
```

**Required:** Yes

The center of the box zone.

## `zone.size`

```lua
size = vec3(31.0, 17.0, 3.0)
```

**Required:** Yes

The size of the box zone.

## `zone.rotation`

```lua
rotation = 90.0
```

**Required:** Yes

The rotation of the box zone.

---

# 6. Garage `spawnPoints`

```lua
spawnPoints = {
    vec4(438.21, -988.45, 20.1, 89.73),
    vec4(438.10, -985.48, 20.1, 88.58),
    vec4(438.07, -980.72, 20.1, 88.98)
}
```

**Required:** Yes

A list of `vec4` spawn positions.

The format is:

```text
vec4(x, y, z, heading)
```

The script checks the spawn points in order and uses the first free position.

If every spawn point is occupied, the vehicle will not spawn.

---

# 7. Vehicle configuration files

Each garage has its own vehicle folder.

For example:

```text
config/police_ls/tstudio_polcypher.lua
```

The vehicle file registers itself like this:

```lua
Config.JobVehicles['police_ls'] = Config.JobVehicles['police_ls'] or {}

Config.JobVehicles['police_ls']['tstudio_polcypher'] = {
    -- vehicle configuration
}
```

The garage name must match exactly.

If the garage is renamed from:

```lua
['police_garage_main'] = {
```

to:

```lua
['police_ls'] = {
```

then the vehicle files must also change from:

```lua
Config.JobVehicles['police_garage_main']
```

to:

```lua
Config.JobVehicles['police_ls']
```

The folder must also be renamed to match:

```text
config/police_ls/
```

---

# 8. Vehicle base configuration

A vehicle file can start like this:

```lua
Config.JobVehicles['police_ls'] = Config.JobVehicles['police_ls'] or {}

Config.JobVehicles['police_ls']['tstudio_polcypher'] = {
    label = 'Commissioner Cypher',
    model = 'tstudio_polcypher'
}
```

## Required vehicle fields

These are required:

```text
label
model
```

Everything else described below is optional.

---

# 9. Vehicle `label`

```lua
label = 'Commissioner Cypher'
```

**Required:** Yes

This is the name shown in the `ox_lib` vehicle selection menu.

---

# 10. Vehicle `model`

```lua
model = 'tstudio_polcypher'
```

**Required:** Yes

This is the vehicle spawn code/model name.

---

# 11. Vehicle `access`

```lua
access = {
    minGrade = 3
}
```

**Required:** No

If `access` is omitted, every grade that can enter the garage can use the vehicle.

## `access.minGrade`

```lua
minGrade = 3
```

**Required:** No

The player must have this grade or higher.

Example:

```lua
access = {
    minGrade = 4
}
```

Grades `0-3` cannot use the vehicle.

Grade `4+` can use it.

## `access.maxGrade`

```lua
access = {
    minGrade = 2,
    maxGrade = 4
}
```

**Required:** No

If present, the player must also be at or below the maximum grade.

The example allows grades `2`, `3`, and `4`.

---

# 12. Vehicle `plate`

```lua
plate = {
    type = 'job',
    prefix = 'POLICE'
}
```

**Required:** No

If omitted, the normal random plate generator is used.

## `plate.type`

Supported values:

```text
job
random
```

### `job`

```lua
plate = {
    type = 'job',
    prefix = 'POLICE'
}
```

Creates a job-style plate using the prefix and a random number.

Example:

```text
POLICE27
POLICE84
```

### `random`

```lua
plate = {
    type = 'random'
}
```

Uses the normal random plate generator.

## `plate.prefix`

```lua
prefix = 'POLICE'
```

**Required:** Only when `type = 'job'` is used.

---

# 13. `appearance`

```lua
appearance = {
    ...
}
```

**Required:** No

Controls visual vehicle settings.

If omitted, no custom appearance settings are applied.

---

# 14. `appearance.colors`

```lua
colors = {
    primary = 0,
    secondary = 0,
    pearlescent = 0,
    wheel = 0
}
```

**Required:** No

Each value is optional.

## `primary`

Primary vehicle color ID.

## `secondary`

Secondary vehicle color ID.

## `pearlescent`

Pearlescent color ID.

## `wheel`

Wheel color ID.

A color value should come from the values supported by the vehicle/game setup you are using.

---

# 15. `appearance.plateIndex`

```lua
plateIndex = 4
```

**Required:** No

Controls the visual plate style/index.

This is separate from the actual text of the plate.

---

# 16. `appearance.livery`

```lua
livery = {
    enabled = true,
    index = 0
}
```

**Required:** No

The script supports both normal GTA livery handling and vehicles that expose livery through mod slot `48`.

## `enabled`

```lua
enabled = true
```

- `true` = apply the configured livery.
- `false` = do not apply the livery.

## `index`

```lua
index = 1
```

The livery index to apply.

The correct index depends on the specific vehicle.

---

# 17. `appearance.extras`

```lua
extras = {
    [1] = true,
    [2] = false,
    [3] = true
}
```

**Required:** No

Only extras that actually exist on the vehicle are changed.

- `true` = enable the extra.
- `false` = disable the extra.
- `1` is also accepted as enabled.

You do not have to define every extra.

---

# 18. `appearance.windowTint`

```lua
windowTint = 4
```

**Required:** No

Vehicle window tint value.

---

# 19. `appearance.wheels`

```lua
wheels = {
    type = 7,
    color = 0
}
```

**Required:** No

## `wheels.type`

Wheel type ID.

## `wheels.color`

Wheel color ID.

Both values are optional.

---

# 20. `lights`

```lua
lights = {
    ...
}
```

**Required:** No

Contains configurable lighting.

---

# 21. `lights.xenon`

```lua
xenon = {
    enabled = false,
    color = 255
}
```

**Required:** No

## `enabled`

```lua
enabled = true
```

Enables/disables xenon.

## `color`

```lua
color = 255
```

Xenon light color ID.

---

# 22. `lights.neon`

```lua
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
```

**Required:** No

## `neon.color`

RGB values:

```lua
color = {
    r = 255,
    g = 255,
    b = 255
}
```

Each value is `0-255`.

## `neon.sides`

Controls each neon side independently:

```lua
sides = {
    left = true,
    right = true,
    front = false,
    back = false
}
```

All four fields are optional.

---

# 23. `performance`

```lua
performance = {
    engine = 3,
    brakes = 2,
    transmission = 2,
    suspension = 0,
    armor = -1,
    turbo = true
}
```

**Required:** No

These are vehicle performance mod values.

Every field is optional.

## Supported performance fields

```text
engine
brakes
transmission
suspension
armor
turbo
```

`engine`, `brakes`, `transmission`, `suspension`, and `armor` use the vehicle's available mod index.

`turbo` is a boolean.

---

# 24. `mods`

```lua
mods = {
    roof = 0,
    frame = -1,
    frontWheels = 5,
    lightbar = 1
}
```

**Required:** No

This section contains cosmetic/vehicle modification slots.

Only values that are present in the config are applied.

The exact available values depend on the vehicle.

For example:

```lua
roof = 0 -- available: 0-6
```

means that the vehicle reports mod slot `10` with six available options, indexed `0-6`.

A value of `-1` normally means the base/default option for a mod slot.

---

# 25. Supported named mod slots

The configuration uses readable names instead of raw GTA mod type numbers where the slot is known.

Current named mappings include:

```text
0  spoiler
1  frontBumper
2  rearBumper
3  sideSkirt
4  exhaust
5  frame
6  grille
7  hood
8  fender
9  rightFender
10 roof

11 engine
12 brakes
13 transmission
14 horns
15 suspension
16 armor

18 turbo

23 frontWheels
24 rearWheels

25 plateHolder
26 vanityPlate
27 trimA
28 ornaments
29 dashboard
30 dial
31 doorSpeaker
32 seats
33 steeringWheel
34 shifterLeavers
35 plaques
36 speakers
37 trunk
38 hydraulics
39 engineBlock
40 airFilter
41 struts
42 archCover
43 aerials
44 trimB
45 tank
46 windows
48 livery
49 lightbar
```

Some slots are handled separately by `appearance`, `lights`, or `performance` and therefore should normally be configured there instead of duplicated in `mods`.

---

# 26. Unknown vehicle mod slots

The `/testvehiclemods` command scans mod slots `0-49` on the current vehicle.

If a slot does not have a known readable name, the generator can output a generic name such as:

```lua
mod17 = 0
```

The generated comment also tells you the raw slot and available range:

```lua
mod17 = 0, -- slot 17 | available: 0-2
```

This is useful when an addon vehicle uses a non-standard slot.

---

# 27. The `/testvehiclemods` command

`/testvehiclemods` is the recommended way to generate a vehicle configuration from a vehicle that is already set up in-game.

## How to use it

1. Sit in the vehicle you want to configure.
2. Run:

```text
/testvehiclemods
```

3. Fill in the `ox_lib` input dialog:

```text
Label
Model / Spawncode
Minimum Grade
Plate Prefix
```

4. The command reads the current vehicle.
5. It prints a complete Lua configuration to the F8 console.
6. Copy the generated block into the vehicle file.

The generator reads the current vehicle's actual properties instead of making you manually determine every value.

---

# 28. What `/testvehiclemods` generates

The generated configuration contains:

```text
label
model
access
plate
appearance
lights
performance
mods
```

The generated output is intended to be copied into the vehicle registration block.

Your vehicle file should start with:

```lua
Config.JobVehicles['police_ls'] = Config.JobVehicles['police_ls'] or {}

Config.JobVehicles['police_ls']['tstudio_polcypher'] = {
```

Then paste the generated contents after the opening `{`.

For example:

```lua
Config.JobVehicles['police_ls'] = Config.JobVehicles['police_ls'] or {}

Config.JobVehicles['police_ls']['tstudio_polcypher'] = {
    label = 'Commissioner Cypher',
    model = 'tstudio_polcypher',

    access = {
        minGrade = 0
    },

    -- generated configuration...
}
```

Do not add another `return { ... }` around the generated block if you are using the registration style above.

---

# 29. Why the generator is useful

Vehicle addon creators can expose different combinations of:

- Liveries
- Extras
- Lightbars
- Wheels
- Interior mods
- Cosmetic mods
- Performance mods
- Xenon
- Neon
- Plate styles
- Window tint

The generator reads the currently configured vehicle and reports the values it can retrieve.

It also shows the available range for discovered mod slots, for example:

```lua
roof = 0, -- slot 10 | available: 0-6
```

This tells you which values are available for that specific vehicle.

---

# 30. `inventory`

```lua
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
```

**Required:** No

If `inventory` is omitted, the job garage does not add configured starter items.

---

# 31. `inventory.glovebox`

```lua
glovebox = {
    {
        name = 'phone',
        count = 1
    }
}
```

**Required:** No

Each item needs:

```lua
name = 'item_name'
count = 1
```

The item must exist in `ox_inventory`.

Multiple items can be configured:

```lua
glovebox = {
    {
        name = 'phone',
        count = 1
    },
    {
        name = 'radio',
        count = 1
    }
}
```

---

# 32. `inventory.trunk`

```lua
trunk = {
    {
        name = 'kegle',
        count = 10
    },
    {
        name = 'medbag',
        count = 1
    }
}
```

**Required:** No

If the vehicle should not receive configured trunk items, omit `trunk`.

This is useful for vehicles that do not have a usable trunk or for aircraft that only need a glovebox.

---

# 33. Full generated vehicle example

A generated vehicle can look like this:

```lua
Config.JobVehicles['police_ls'] = Config.JobVehicles['police_ls'] or {}

Config.JobVehicles['police_ls']['tstudio_polcypher'] = {
    label = 'Commissioner Cypher',
    model = 'tstudio_polcypher',

    access = {
        minGrade = 0
    },

    plate = {
        type = 'job',
        prefix = 'Komm'
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
            index = 0
        },

        extras = {
            [1] = true,
            [2] = true,
            [3] = false,
            [4] = true,
            [5] = true
        },

        windowTint = 4,

        wheels = {
            type = 7,
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
        engine = 3,
        brakes = 2,
        transmission = 2,
        suspension = 0,
        armor = -1,
        turbo = true
    },

    mods = {
        frame = -1,
        fender = -1,
        roof = 0,
        frontWheels = -1,
        ornaments = 0,
        shifterLeavers = 1,
        plaques = 1,
        trunk = 2,
        archCover = -1,
        aerials = -1,
        windows = 0,
        livery = 0,
        lightbar = 1
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
                name = 'kegle',
                count = 10
            },
            {
                name = 'medbag',
                count = 1
            }
        }
    }
}
```

---

# 34. Minimal vehicle example

You can also keep a vehicle very simple:

```lua
Config.JobVehicles['police_ls'] = Config.JobVehicles['police_ls'] or {}

Config.JobVehicles['police_ls']['tstudio_polscorcher'] = {
    label = 'Police Bike',
    model = 'tstudio_polscorcher'
}
```

Everything except `label` and `model` is optional.

---

# 35. Recommended workflow for adding a vehicle

The easiest workflow is:

1. Make sure the vehicle resource is running.
2. Spawn the vehicle you want to use.
3. Set the vehicle up exactly as you want it in-game.
4. Sit in the vehicle.
5. Run:

```text
/testvehiclemods
```

6. Enter the label, spawncode, minimum grade, and plate prefix.
7. Copy the generated configuration from F8.
8. Paste it into the corresponding vehicle file.
9. Add the vehicle file to the correct garage folder.
10. Restart `lc_garages`.
11. Test the vehicle from the job garage.

This avoids manually guessing most appearance and mod values.

---

# 36. Important notes

- The garage ID and vehicle folder name must match.
- The garage ID used in `Config.JobVehicles[...]` must match the garage ID in `Config.JobGarages`.
- `label` and `model` are required for every vehicle.
- All other vehicle sections are optional.
- Inventory item names must exist in `ox_inventory`.
- Mod values are vehicle-specific. Use `/testvehiclemods` on the exact vehicle you are configuring.
- Do not assume that the same mod index exists on every addon vehicle.
- `/testvehiclemods` scans mod slots `0-49` on the current vehicle and reports available ranges for discovered slots.
- Garage debug visualization is controlled by `Config.Debug` in `config/config.lua`.

---

# 37. Debug mode

In `config/config.lua`:

```lua
Config.Debug = true
```

When enabled, garage box zones are shown using the `ox_lib` zone debug visualization.

Set it to `false` when you no longer need to debug the garage positions.

---

# 38. Quick reference

## Garage

```text
Required:
- label
- jobs
- zone
- spawnPoints

Optional:
- blip
```

## Vehicle

```text
Required:
- label
- model

Optional:
- access
- plate
- appearance
- lights
- performance
- mods
- inventory
```

## Appearance

```text
Optional:
- colors
- plateIndex
- livery
- extras
- windowTint
- wheels
```

## Lights

```text
Optional:
- xenon
- neon
```

## Performance

```text
Optional:
- engine
- brakes
- transmission
- suspension
- armor
- turbo
```

## Inventory

```text
Optional:
- glovebox
- trunk
```

---

# 39. Dependencies

The job garage system currently depends on:

```text
qbx_core
qbx_vehiclekeys
ox_lib
ox_inventory
oxmysql
```

Make sure these resources are started before `lc_garages`.
