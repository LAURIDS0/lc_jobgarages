function GenerateRandomPlate()
    local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local plate = ''

    for i = 1, 7 do
        local randomIndex = math.random(#chars)
        plate = plate .. chars:sub(randomIndex, randomIndex)
    end

    return plate
end


local function GenerateJobPlate(prefix)
    local plate

    repeat
        local number = math.random(10, 99)
        plate = ('%s%d'):format(prefix, number)
    until not DoesPlateExist(plate)

    return plate
end


function DoesPlateExist(plate)
    for _, vehicle in ipairs(GetGamePool('CVehicle')) do
        local vehiclePlate = GetVehicleNumberPlateText(vehicle)

        if vehiclePlate then
            vehiclePlate = vehiclePlate:gsub('%s+', '')

            if vehiclePlate == plate then
                return true
            end
        end
    end

    return false
end


function GeneratePlate(plateConfig)
    if not plateConfig or plateConfig.type == 'random' then
        return GenerateRandomPlate()
    end

    if plateConfig.type == 'job' then
        return GenerateJobPlate(plateConfig.prefix)
    end

    return GenerateRandomPlate()
end


function IsVehicleSpawnClear(coords, radius)
    local position = vec3(coords.x, coords.y, coords.z)

    local vehicle = lib.getClosestVehicle(
        position,
        radius or 2.5
    )

    return vehicle == nil
end


-- =========================================================
-- VEHICLE MOD NAMES
-- =========================================================

local vehicleModNames = {
    [0]  = 'spoiler',
    [1]  = 'frontBumper',
    [2]  = 'rearBumper',
    [3]  = 'sideSkirt',
    [4]  = 'exhaust',
    [5]  = 'frame',
    [6]  = 'grille',
    [7]  = 'hood',
    [8]  = 'fender',
    [9]  = 'rightFender',
    [10] = 'roof',

    [11] = 'engine',
    [12] = 'brakes',
    [13] = 'transmission',
    [14] = 'horns',
    [15] = 'suspension',
    [16] = 'armor',

    [17] = 'mod17',
    [18] = 'turbo',
    [19] = 'mod19',
    [20] = 'mod20',
    [21] = 'mod21',
    [22] = 'xenon',

    [23] = 'frontWheels',
    [24] = 'rearWheels',

    [25] = 'plateHolder',
    [26] = 'vanityPlate',
    [27] = 'trimA',
    [28] = 'ornaments',
    [29] = 'dashboard',
    [30] = 'dial',
    [31] = 'doorSpeaker',
    [32] = 'seats',
    [33] = 'steeringWheel',
    [34] = 'shifterLeavers',
    [35] = 'plaques',
    [36] = 'speakers',
    [37] = 'trunk',
    [38] = 'hydraulics',
    [39] = 'engineBlock',
    [40] = 'airFilter',
    [41] = 'struts',
    [42] = 'archCover',
    [43] = 'aerials',
    [44] = 'trimB',
    [45] = 'tank',
    [46] = 'windows',
    [47] = 'mod47',
    [48] = 'livery',
    [49] = 'lightbar'
}


-- =========================================================
-- APPLY VEHICLE CONFIG
-- =========================================================

function ApplyJobVehicleConfig(vehicle, config)
    if not DoesEntityExist(vehicle) then
        return
    end

    SetVehicleModKit(vehicle, 0)

    -- =====================================================
    -- APPEARANCE
    -- =====================================================

    local appearance = config.appearance

    if appearance then

        -- Colors
        if appearance.colors then
            SetVehicleColours(
                vehicle,
                appearance.colors.primary or 0,
                appearance.colors.secondary or 0
            )

            SetVehicleExtraColours(
                vehicle,
                appearance.colors.pearlescent or 0,
                appearance.colors.wheel or 0
            )
        end

        -- Plate style
        if appearance.plateIndex ~= nil then
            SetVehicleNumberPlateTextIndex(
                vehicle,
                appearance.plateIndex
            )
        end

        -- Livery
        if appearance.livery then
            if appearance.livery.enabled ~= false then
                local liveryIndex =
                    appearance.livery.index or 0

                local nativeLiveryCount =
                    GetVehicleLiveryCount(vehicle)

                if nativeLiveryCount
                    and nativeLiveryCount > 0
                then
                    SetVehicleLivery(
                        vehicle,
                        liveryIndex
                    )
                elseif GetNumVehicleMods(vehicle, 48) > 0 then
                    SetVehicleMod(
                        vehicle,
                        48,
                        liveryIndex,
                        false
                    )
                end
            end
        end

        -- Extras
        if appearance.extras then
            for extraId, enabled in pairs(
                appearance.extras
            ) do
                extraId = tonumber(extraId)

                if extraId
                    and DoesExtraExist(
                        vehicle,
                        extraId
                    )
                then
                    local shouldEnable =
                        enabled == true
                        or enabled == 1

                    SetVehicleExtra(
                        vehicle,
                        extraId,
                        not shouldEnable
                    )
                end
            end
        end

        -- Window tint
        if appearance.windowTint ~= nil then
            SetVehicleWindowTint(
                vehicle,
                appearance.windowTint
            )
        end

        -- Wheels
        if appearance.wheels then
            if appearance.wheels.type ~= nil then
                SetVehicleWheelType(
                    vehicle,
                    appearance.wheels.type
                )
            end

            if appearance.wheels.color ~= nil then
                local pearlescent = 0

                if appearance.colors
                    and appearance.colors.pearlescent ~= nil
                then
                    pearlescent =
                        appearance.colors.pearlescent
                end

                SetVehicleExtraColours(
                    vehicle,
                    pearlescent,
                    appearance.wheels.color
                )
            end
        end
    end


    -- =====================================================
    -- LIGHTS
    -- =====================================================

    local lights = config.lights

    if lights then

        -- Xenon
        if lights.xenon then
            ToggleVehicleMod(
                vehicle,
                22,
                lights.xenon.enabled == true
            )

            if lights.xenon.color ~= nil then
                SetVehicleXenonLightsColor(
                    vehicle,
                    lights.xenon.color
                )
            end
        end

        -- Neon
        if lights.neon then
            local neon = lights.neon
            local sides = neon.sides or {}

            SetVehicleNeonLightEnabled(
                vehicle,
                0,
                sides.left == true
            )

            SetVehicleNeonLightEnabled(
                vehicle,
                1,
                sides.right == true
            )

            SetVehicleNeonLightEnabled(
                vehicle,
                2,
                sides.front == true
            )

            SetVehicleNeonLightEnabled(
                vehicle,
                3,
                sides.back == true
            )

            if neon.color then
                SetVehicleNeonLightsColour(
                    vehicle,
                    neon.color.r or 255,
                    neon.color.g or 255,
                    neon.color.b or 255
                )
            end
        end
    end


    -- =====================================================
    -- PERFORMANCE
    -- =====================================================

    local performance = config.performance

    if performance then
        local performanceMods = {
            engine = 11,
            brakes = 12,
            transmission = 13,
            suspension = 15,
            armor = 16
        }

        for name, modType in pairs(
            performanceMods
        ) do
            if performance[name] ~= nil then
                SetVehicleMod(
                    vehicle,
                    modType,
                    performance[name],
                    false
                )
            end
        end

        if performance.turbo ~= nil then
            ToggleVehicleMod(
                vehicle,
                18,
                performance.turbo == true
            )
        end
    end


    -- =====================================================
    -- ALL COSMETIC MODS
    -- =====================================================

    local mods = config.mods

    if mods then
        for name, value in pairs(mods) do
            local modType

            for slot, modName in pairs(
                vehicleModNames
            ) do
                if modName == name then
                    modType = slot
                    break
                end
            end

            if modType
                and value ~= nil
            then
                local count =
                    GetNumVehicleMods(
                        vehicle,
                        modType
                    )

                if count
                    and count > 0
                then
                    SetVehicleMod(
                        vehicle,
                        modType,
                        value,
                        false
                    )
                end
            end
        end
    end
end


-- =========================================================
-- COLLECT INVENTORY ITEMS
-- =========================================================

local function CollectVehicleItems(title)
    local items = {}

    while true do
        local input = lib.inputDialog(title, {
            {
                type = 'input',
                label = 'Item spawn name',
                description =
                    'Exact ox_inventory item name',
                required = true
            },

            {
                type = 'number',
                label = 'Amount',
                description =
                    'How many of this item?',
                required = true,
                min = 1,
                default = 1
            },

            {
                type = 'checkbox',
                label = 'Add another item',
                checked = false
            }
        })

        if not input then
            break
        end

        local itemName = input[1]
        local amount = tonumber(input[2])

        if not itemName
            or itemName == ''
        then
            lib.notify({
                title = 'LC Garages',
                description =
                    'You must enter an item name.',
                type = 'error'
            })

            goto continue
        end

        if not amount
            or amount < 1
        then
            lib.notify({
                title = 'LC Garages',
                description =
                    'Amount must be at least 1.',
                type = 'error'
            })

            goto continue
        end

        items[#items + 1] = {
            name = itemName,
            count = amount
        }

        if not input[3] then
            break
        end

        ::continue::
    end

    return items
end


-- =========================================================
-- TEST VEHICLE MODS / CONFIG GENERATOR
-- =========================================================

RegisterCommand('creategaragecar', function()
    local vehicle =
        GetVehiclePedIsIn(
            PlayerPedId(),
            false
        )

    if vehicle == 0 then
        lib.notify({
            title = 'LC Garages',
            description =
                'You must be sitting in a vehicle.',
            type = 'error'
        })

        return
    end

    SetVehicleModKit(
        vehicle,
        0
    )

    -- =====================================================
    -- BASIC CONFIG INPUT
    -- =====================================================

    local input = lib.inputDialog(
        'Vehicle Config Generator',
        {
            {
                type = 'input',
                label = 'Label',
                description =
                    'Name shown in the garage menu',
                required = true
            },

            {
                type = 'input',
                label = 'Model / Spawncode',
                description =
                    'Vehicle spawncode',
                required = true
            },

            {
                type = 'number',
                label = 'Minimum Grade',
                description =
                    'Minimum job grade allowed',
                required = true,
                default = 0,
                min = 0
            },

            {
                type = 'input',
                label = 'Plate Prefix',
                description =
                    'For example POLICE, EMS or SHERIFF',
                required = true,
                default = 'POLICE'
            },

            {
                type = 'select',
                label = 'Glovebox Items',
                description =
                    'Should the vehicle have default glovebox items?',
                required = true,
                options = {
                    {
                        value = 'yes',
                        label = 'Yes'
                    },
                    {
                        value = 'no',
                        label = 'No'
                    }
                },
                default = 'no'
            },

            {
                type = 'select',
                label = 'Trunk Items',
                description =
                    'Should the vehicle have default trunk items?',
                required = true,
                options = {
                    {
                        value = 'yes',
                        label = 'Yes'
                    },
                    {
                        value = 'no',
                        label = 'No'
                    }
                },
                default = 'no'
            }
        }
    )

    if not input then
        return
    end

    local label = input[1]
    local model = input[2]
    local minGrade = tonumber(input[3]) or 0
    local platePrefix = input[4]

    local gloveboxItems = {}
    local trunkItems = {}

    -- =====================================================
    -- COLLECT GLOVEBOX ITEMS
    -- =====================================================

    if input[5] == 'yes' then
        gloveboxItems =
            CollectVehicleItems(
                'Glovebox Item'
            )
    end

    -- =====================================================
    -- COLLECT TRUNK ITEMS
    -- =====================================================

    if input[6] == 'yes' then
        trunkItems =
            CollectVehicleItems(
                'Trunk Item'
            )
    end


    -- =====================================================
    -- GET VEHICLE PROPERTIES
    -- =====================================================

    local props =
        lib.getVehicleProperties(
            vehicle
        )

    if not props then
        lib.notify({
            title = 'LC Garages',
            description =
                'Could not get vehicle properties.',
            type = 'error'
        })

        return
    end


    -- =====================================================
    -- LUA VALUE HELPER
    -- =====================================================

    local function lua(value)
        if type(value) == 'string' then
            return string.format(
                '%q',
                value
            )
        end

        if type(value) == 'boolean' then
            return value
                and 'true'
                or 'false'
        end

        if value == nil then
            return 'nil'
        end

        return tostring(value)
    end


    -- =====================================================
    -- HEADER
    -- =====================================================

    print('')
    print('^2==========================================================')
    print('^2              LC GARAGES VEHICLE CONFIG')
    print('^2==========================================================')
    print('')
    print('^7Copy the complete block below.^0')
    print('')


    print('return {')
    print('')

    print(('    label = %s,'):format(
        lua(label)
    ))

    print(('    model = %s,'):format(
        lua(model)
    ))

    print('')


    -- =====================================================
    -- ACCESS
    -- =====================================================

    print('    access = {')

    print(('        minGrade = %s'):format(
        lua(minGrade)
    ))

    print('    },')
    print('')


    -- =====================================================
    -- PLATE
    -- =====================================================

    print('    plate = {')

    print('        type = "job",')

    print(('        prefix = %s'):format(
        lua(platePrefix)
    ))

    print('    },')
    print('')


    -- =====================================================
    -- APPEARANCE
    -- =====================================================

    print('    appearance = {')

    -- Colors
    print('        colors = {')

    print(('            primary = %s,'):format(
        lua(props.color1 or 0)
    ))

    print(('            secondary = %s,'):format(
        lua(props.color2 or 0)
    ))

    print(('            pearlescent = %s,'):format(
        lua(props.pearlescentColor or 0)
    ))

    print(('            wheel = %s'):format(
        lua(props.wheelColor or 0)
    ))

    print('        },')
    print('')

    -- Plate style
    print(('        plateIndex = %s,'):format(
        lua(props.plateIndex or 0)
    ))
    print('')

    -- Livery
    local liveryIndex = -1

    local nativeLiveryCount =
        GetVehicleLiveryCount(vehicle)

    if nativeLiveryCount
        and nativeLiveryCount > 0
    then
        liveryIndex =
            GetVehicleLivery(vehicle)
    else
        local mod48Count =
            GetNumVehicleMods(
                vehicle,
                48
            )

        if mod48Count
            and mod48Count > 0
        then
            liveryIndex =
                GetVehicleMod(
                    vehicle,
                    48
                )
        end
    end

    print('        livery = {')

    print(('            enabled = %s,'):format(
        lua(liveryIndex >= 0)
    ))

    print(('            index = %s'):format(
        lua(math.max(liveryIndex, 0))
    ))

    print('        },')
    print('')

    -- Extras
    print('        extras = {')

    local hasExtras = false

    for extraId = 1, 20 do
        if DoesExtraExist(
            vehicle,
            extraId
        ) then
            hasExtras = true

            local enabled =
                IsVehicleExtraTurnedOn(
                    vehicle,
                    extraId
                )

            print(('            [%d] = %s,'):format(
                extraId,
                lua(enabled)
            ))
        end
    end

    if not hasExtras then
        print('            -- No extras')
    end

    print('        },')
    print('')

    -- Window tint
    print(('        windowTint = %s,'):format(
        lua(props.windowTint or -1)
    ))

    -- Wheels
    print('        wheels = {')

    print(('            type = %s,'):format(
        lua(props.wheels or 0)
    ))

    print(('            color = %s'):format(
        lua(props.wheelColor or 0)
    ))

    print('        }')

    print('    },')
    print('')


    -- =====================================================
    -- LIGHTS
    -- =====================================================

    print('    lights = {')

    -- Xenon
    print('        xenon = {')

    print(('            enabled = %s,'):format(
        lua(props.modXenon == true)
    ))

    print(('            color = %s'):format(
        lua(props.xenonColor or 255)
    ))

    print('        },')
    print('')

    -- Neon
    local neonEnabled =
        props.neonEnabled or {
            false,
            false,
            false,
            false
        }

    local neonColor =
        props.neonColor or {
            255,
            255,
            255
        }

    local neonActive =
        neonEnabled[1] == true
        or neonEnabled[2] == true
        or neonEnabled[3] == true
        or neonEnabled[4] == true

    print('        neon = {')

    print(('            enabled = %s,'):format(
        lua(neonActive)
    ))

    print('            color = {')

    print(('                r = %s,'):format(
        lua(neonColor[1] or 255)
    ))

    print(('                g = %s,'):format(
        lua(neonColor[2] or 255)
    ))

    print(('                b = %s'):format(
        lua(neonColor[3] or 255)
    ))

    print('            },')

    print('            sides = {')

    print(('                left = %s,'):format(
        lua(neonEnabled[1] == true)
    ))

    print(('                right = %s,'):format(
        lua(neonEnabled[2] == true)
    ))

    print(('                front = %s,'):format(
        lua(neonEnabled[3] == true)
    ))

    print(('                back = %s'):format(
        lua(neonEnabled[4] == true)
    ))

    print('            }')
    print('        }')

    print('    },')
    print('')


    -- =====================================================
    -- PERFORMANCE
    -- =====================================================

    print('    performance = {')

    print(('        engine = %s,'):format(
        lua(props.modEngine or -1)
    ))

    print(('        brakes = %s,'):format(
        lua(props.modBrakes or -1)
    ))

    print(('        transmission = %s,'):format(
        lua(props.modTransmission or -1)
    ))

    print(('        suspension = %s,'):format(
        lua(props.modSuspension or -1)
    ))

    print(('        armor = %s,'):format(
        lua(props.modArmor or -1)
    ))

    print(('        turbo = %s'):format(
        lua(props.modTurbo == true)
    ))

    print('    },')
    print('')


    -- =====================================================
    -- ALL VEHICLE MODS
    -- =====================================================

    print('    mods = {')

    local foundMods = false

    for modType = 0, 49 do
        local count =
            GetNumVehicleMods(
                vehicle,
                modType
            )

        if count
            and count > 0
        then
            local name =
                vehicleModNames[modType]

            if not name then
                name =
                    ('mod%d'):format(
                        modType
                    )
            end

            local value =
                GetVehicleMod(
                    vehicle,
                    modType
                )

            foundMods = true

            print((
                '        %s = %s, -- slot %d | available: 0-%d'
            ):format(
                name,
                lua(value),
                modType,
                count - 1
            ))
        end
    end

    if not foundMods then
        print('        -- No cosmetic mods')
    end

    print('    },')
    print('')


    -- =====================================================
    -- INVENTORY
    -- =====================================================

    if #gloveboxItems > 0
        or #trunkItems > 0
    then
        print('    inventory = {')

        if #gloveboxItems > 0 then
            print('        glovebox = {')

            for _, item in ipairs(
                gloveboxItems
            ) do
                print('            {')

                print(('                name = %s,'):format(
                    lua(item.name)
                ))

                print(('                count = %s'):format(
                    lua(item.count)
                ))

                print('            },')
            end

            print('        }')

            if #trunkItems > 0 then
                print('        ,')
            end
        end

        if #trunkItems > 0 then
            print('        trunk = {')

            for _, item in ipairs(
                trunkItems
            ) do
                print('            {')

                print(('                name = %s,'):format(
                    lua(item.name)
                ))

                print(('                count = %s'):format(
                    lua(item.count)
                ))

                print('            },')
            end

            print('        }')
        end

        print('    }')
        print('')
    end


    -- =====================================================
    -- END
    -- =====================================================

    print('}')
    print('')

    print('^2==========================================================')
    print('^2                 END VEHICLE CONFIG')
    print('^2==========================================================')
    print('')
end)