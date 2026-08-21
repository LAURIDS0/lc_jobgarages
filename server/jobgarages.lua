local function HasGarageAccess(player, garage)
    if not player or not player.PlayerData.job then
        return false
    end

    local jobName = player.PlayerData.job.name
    local grade = player.PlayerData.job.grade.level or 0

    local minimumGrade = garage.jobs[jobName]

    if minimumGrade == nil then
        return false
    end

    return grade >= minimumGrade
end


local function HasVehicleAccess(player, vehicle)
    if not player or not player.PlayerData.job then
        return false
    end

    local access = vehicle.access

    if not access then
        return true
    end

    local grade =
        player.PlayerData.job.grade.level or 0

    if access.minGrade
        and grade < access.minGrade
    then
        return false
    end

    if access.maxGrade
        and grade > access.maxGrade
    then
        return false
    end

    return true
end


local function SetupInventory(inventoryId, items, label)
    if not items then
        return
    end

    local success, inventory = pcall(function()
        return exports.ox_inventory:GetInventory(
            inventoryId
        )
    end)

    if not success then
        print((
            '[lc_garages] Failed to load %s inventory %s'
        ):format(label, inventoryId))

        return
    end

    if not inventory then
        print((
            '[lc_garages] Inventory %s does not exist'
        ):format(inventoryId))

        return
    end

    exports.ox_inventory:ClearInventory(
        inventoryId
    )

    for _, item in ipairs(items) do

        local added, response =
            exports.ox_inventory:AddItem(
                inventoryId,
                item.name,
                item.count
            )

        print((
            '[lc_garages] %s | %s x%s | success=%s'
        ):format(
            label,
            item.name,
            item.count,
            tostring(added)
        ))

        if not added then
            print((
                '[lc_garages] Inventory error: %s'
            ):format(
                tostring(response)
            ))
        end
    end
end


RegisterNetEvent(
    'lc_garages:server:setupJobVehicle',
    function(garageName, vehicleId, netId)

        local source = source

        if not garageName
            or not vehicleId
            or not netId
        then
            return
        end

        local player =
            exports.qbx_core:GetPlayer(source)

        if not player then
            return
        end

        local garage =
            Config.JobGarages[garageName]

        if not garage then
            return
        end

        if not HasGarageAccess(
            player,
            garage
        ) then
            print((
                '[lc_garages] Player %s attempted to use garage %s without access'
            ):format(
                source,
                garageName
            ))

            return
        end

        local vehicles =
            Config.JobVehicles[garageName]

        if not vehicles then
            return
        end

        local vehicle =
            vehicles[vehicleId]

        if not vehicle then
            return
        end

        if not HasVehicleAccess(
            player,
            vehicle
        ) then
            print((
                '[lc_garages] Player %s attempted to use vehicle %s without access'
            ):format(
                source,
                vehicleId
            ))

            return
        end

        local entity = 0
        local timeout = GetGameTimer() + 5000

        while GetGameTimer() < timeout do
            entity = NetworkGetEntityFromNetworkId(netId)

            if entity
                and entity ~= 0
                and DoesEntityExist(entity)
            then
                break
            end

            Wait(100)
        end

        if not entity
            or entity == 0
            or not DoesEntityExist(entity)
        then
            print((
                '[lc_garages] Could not resolve vehicle entity for netId %s'
            ):format(netId))

            return
        end

        local plate =
            GetVehicleNumberPlateText(entity)

        if not plate
            or plate == ''
        then
            return
        end

        plate =
            plate:gsub('%s+', '')

        Entity(entity).state:set(
            'lcJobVehicle',
            true,
            true
        )

        exports.qbx_vehiclekeys:GiveKeys(
            source,
            entity
        )

        if vehicle.inventory then

            SetupInventory(
                'glove' .. plate,
                vehicle.inventory.glovebox,
                'Glovebox'
            )

            SetupInventory(
                'trunk' .. plate,
                vehicle.inventory.trunk,
                'Trunk'
            )
        end

        print((
            '[lc_garages] Job vehicle ready: %s (%s)'
        ):format(
            vehicle.label,
            plate
        ))
    end
)