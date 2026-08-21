local function HasGarageAccess(garage)
    local player = exports.qbx_core:GetPlayerData()

    if not player.job then
        return false
    end

    local grade = player.job.grade.level or 0
    local minimumGrade = garage.jobs[player.job.name]

    if minimumGrade == nil then
        return false
    end

    return grade >= minimumGrade
end


local function HasVehicleAccess(vehicle)
    local player = exports.qbx_core:GetPlayerData()

    if not player.job then
        return false
    end

    local access = vehicle.access

    if not access then
        return true
    end

    local grade = player.job.grade.level or 0

    if access.minGrade and grade < access.minGrade then
        return false
    end

    if access.maxGrade and grade > access.maxGrade then
        return false
    end

    return true
end


local function CreateGarageBlips()
    for _, garage in pairs(Config.JobGarages) do
        if garage.blip and garage.blip.enabled then
            local coords = garage.zone.coords

            local blip = AddBlipForCoord(
                coords.x,
                coords.y,
                coords.z
            )

            SetBlipSprite(
                blip,
                garage.blip.sprite or 357
            )

            SetBlipColour(
                blip,
                garage.blip.color or 0
            )

            SetBlipScale(
                blip,
                garage.blip.scale or 0.8
            )

            SetBlipAsShortRange(
                blip,
                garage.blip.shortRange ~= false
            )

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(garage.label)
            EndTextCommandSetBlipName(blip)
        end
    end
end


CreateThread(function()
    CreateGarageBlips()

    for garageName, garage in pairs(Config.JobGarages) do

        lib.zones.box({
            coords = garage.zone.coords,
            size = garage.zone.size,
            rotation = garage.zone.rotation,
            debug = Config.Debug,

            onEnter = function()
                if not HasGarageAccess(garage) then
                    return
                end

                lib.showTextUI(
                    '[E] - ' .. garage.label
                )
            end,

            onExit = function()
                lib.hideTextUI()
            end,

            inside = function()
                if not HasGarageAccess(garage) then
                    return
                end

                if not IsControlJustReleased(0, 38) then
                    return
                end

                local playerPed = PlayerPedId()
                local currentVehicle =
                    GetVehiclePedIsIn(playerPed, false)

                -- =========================
                -- PARK JOB VEHICLE
                -- =========================

                if currentVehicle ~= 0
                    and GetPedInVehicleSeat(
                        currentVehicle,
                        -1
                    ) == playerPed
                    and Entity(currentVehicle).state.lcJobVehicle
                then

                    DeleteVehicle(currentVehicle)

                    lib.notify({
                        title = garage.label,
                        description = 'Jobbilen er parkeret.',
                        type = 'success'
                    })

                    return
                end

                -- =========================
                -- VEHICLE MENU
                -- =========================

                local vehicles =
                    Config.JobVehicles[garageName] or {}

                local vehicleCount = 0

                for _ in pairs(vehicles) do
                    vehicleCount += 1
                end

                print(('[lc_garages] Garage %s has %s vehicles'):format(
                    garageName,
                    vehicleCount
                ))

                local player = exports.qbx_core:GetPlayerData()

                print(('[lc_garages] Player job: %s | grade: %s'):format(
                    player.job and player.job.name or 'nil',
                    player.job and player.job.grade.level or 'nil'
                ))

                local options = {}

                for vehicleId, vehicle in pairs(vehicles) do

                    if HasVehicleAccess(vehicle) then

                        options[#options + 1] = {
                            title = vehicle.label,
                            description = vehicle.model,
                            icon = 'car',

                            onSelect = function()

                                local spawnPoint

                                for _, point in ipairs(
                                    garage.spawnPoints
                                ) do
                                    if IsVehicleSpawnClear(
                                        point,
                                        3.0
                                    ) then
                                        spawnPoint = point
                                        break
                                    end
                                end

                                if not spawnPoint then
                                    lib.notify({
                                        title = garage.label,
                                        description =
                                            'Der er ingen ledige spawnpladser.',
                                        type = 'error'
                                    })

                                    return
                                end

                                local plate =
                                    GeneratePlate(
                                        vehicle.plate
                                    )

                                local model =
                                    joaat(vehicle.model)

                                lib.requestModel(model)

                                local spawnedVehicle =
                                    CreateVehicle(
                                        model,
                                        spawnPoint.x,
                                        spawnPoint.y,
                                        spawnPoint.z,
                                        spawnPoint.w,
                                        true,
                                        true
                                    )

                                if not DoesEntityExist(
                                    spawnedVehicle
                                ) then
                                    lib.notify({
                                        title = garage.label,
                                        description =
                                            'Køretøjet kunne ikke spawnes.',
                                        type = 'error'
                                    })

                                    SetModelAsNoLongerNeeded(model)
                                    return
                                end

                                Entity(spawnedVehicle)
                                    .state.lcJobVehicle = true

                                SetEntityAsMissionEntity(
                                    spawnedVehicle,
                                    true,
                                    true
                                )

                                SetVehicleNumberPlateText(
                                    spawnedVehicle,
                                    plate
                                )

                                ApplyJobVehicleConfig(
                                    spawnedVehicle,
                                    vehicle
                                )

                                SetVehicleOnGroundProperly(
                                    spawnedVehicle
                                )

                                local netId =
                                    NetworkGetNetworkIdFromEntity(
                                        spawnedVehicle
                                    )

                                TriggerServerEvent(
                                    'lc_garages:server:setupJobVehicle',
                                    garageName,
                                    vehicleId,
                                    netId
                                )

                                SetModelAsNoLongerNeeded(
                                    model
                                )

                                TaskWarpPedIntoVehicle(
                                    playerPed,
                                    spawnedVehicle,
                                    -1
                                )

                                print((
                                    '[lc_garages] Spawned %s (%s)'
                                ):format(
                                    vehicle.label,
                                    vehicle.model
                                ))
                            end
                        }
                    end
                end

                if #options == 0 then
                    lib.notify({
                        title = garage.label,
                        description =
                            'Du har ikke adgang til nogen køretøjer her.',
                        type = 'error'
                    })

                    return
                end

                lib.registerContext({
                    id = 'job_garage_' .. garageName,
                    title = garage.label,
                    options = options
                })

                lib.showContext(
                    'job_garage_' .. garageName
                )
            end
        })
    end
end)