local prevPos = nil
onMorphine = false
local morphineAmount = 0

healAnimDict = "mini_games@story@mob4@heal_jules@bandage@arthur"
healAnim = "bandage_fast"

-- REMOVE BLEEDS / FUNCTIONS --
local function DoBleedAlert()
    if not isDead and tonumber(isBleeding) > 0 then
        PSRCore.Functions.Notify(Lang:t('info.bleed_alert', {bleedstate = Config.BleedingStates[tonumber(isBleeding)].label}), "error", 5000)
    end
end

local function RemoveBleed(level)
    if isBleeding ~= 0 then
        if isBleeding - level < 0 then
            isBleeding = 0
        else
            isBleeding = isBleeding - level
        end
        DoBleedAlert()
    end
end

local function ApplyBleed(level)
    if isBleeding ~= 4 then
        if isBleeding + level > 4 then
            isBleeding = 4
        else
            isBleeding = isBleeding + level
        end
        DoBleedAlert()
    end
end


-- USE ITEM EVENTS --
RegisterNetEvent('hospital:client:UseIfaks', function()
    local ped = PlayerPedId()
    PSRCore.Functions.Progressbar("use_bandage", Lang:t('progress.ifaks'), 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = healAnimDict,
		anim = healAnim,
		flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, healAnimDict, healAnim, 1.0)
        TriggerServerEvent("hospital:server:removeItem", 'ifak', 1)
        TriggerEvent("inventory:client:ItemBox", PSRCore.Shared.Items["ifaks"], "remove")
        TriggerServerEvent('hud:server:RelieveStress', math.random(12, 24))
        SetEntityHealth(ped, GetEntityHealth(ped) + 10)
        onMorphine = true
        if morphineAmount < 3 then
            morphineAmount = morphineAmount + 1
        end
        if math.random(1, 100) < 50 then
            RemoveBleed(1)
        end
    end, function() -- Cancel
        StopAnimTask(ped, healAnimDict, healAnim, 1.0)
        PSRCore.Functions.Notify(Lang:t('error.canceled'), "error")
    end)
end)

RegisterNetEvent('hospital:client:UseBandage', function()
    local ped = PlayerPedId()
    PSRCore.Functions.Progressbar("use_bandage", Lang:t('progress.bandage'), 4000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = healAnimDict,
		anim = healAnim,
		flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, healAnimDict, healAnim, 1.0)
        TriggerServerEvent("hospital:server:removeItem", 'bandage', 1)
        TriggerEvent("inventory:client:ItemBox", PSRCore.Shared.Items["bandage"], "remove")
        SetEntityHealth(ped, GetEntityHealth(ped) + 10)
        if math.random(1, 100) < 50 then
            RemoveBleed(1)
        end
        if math.random(1, 100) < 7 then
            ResetPartial()
        end
    end, function() -- Cancel
        StopAnimTask(ped, healAnimDict, healAnim, 1.0)
        PSRCore.Functions.Notify(Lang:t('error.canceled'), "error")
    end)
end)

RegisterNetEvent('hospital:client:UseMorphine', function()
    local ped = PlayerPedId()
    PSRCore.Functions.Progressbar("use_bandage", Lang:t('progress.painkillers'), 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = healAnimDict,
		anim = healAnim,
		flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, healAnimDict, healAnim, 1.0)
        TriggerServerEvent("hospital:server:removeItem", 'morphine', 1)
        TriggerEvent("inventory:client:ItemBox", PSRCore.Shared.Items["morphine"], "remove")
        onMorphine = true
        if morphineAmount < 3 then
            morphineAmount = morphineAmount + 1
        end
    end, function() -- Cancel
        StopAnimTask(ped, healAnimDict, healAnim, 1.0)
        PSRCore.Functions.Notify(Lang:t('error.canceled'), "error")
    end)
end)

-- THREADS --
CreateThread(function()
    while true do
        Wait(1)
        if onMorphine then
            morphineAmount = morphineAmount - 1
            Wait(Config.MorphineInterval * 1000)
            if morphineAmount <= 0 then
                morphineAmount = 0
                onMorphine = false
            end
        else
            Wait(3000)
        end
    end
end)

CreateThread(function()
	while true do
		if #injured > 0 then
			local level = 0
			for _, v in pairs(injured) do
				if v.severity > level then
					level = v.severity
				end
			end
			SetPedMoveRateOverride(PlayerPedId(), Config.MovementRate[level])
			Wait(5)
		else
			Wait(1000)
		end
	end
end)

CreateThread(function()
    Wait(2500)
    prevPos = GetEntityCoords(PlayerPedId(), true)
    while true do
        Wait(1000)
        if isBleeding > 0 and not onMorphine then
            local player = PlayerPedId()
            if bleedTickTimer >= Config.BleedTickRate and not isInHospitalBed then
                if not isDead and not InLaststand then
                    if isBleeding > 0 then
                        if fadeOutTimer + 1 == Config.FadeOutTimer then
                            if blackoutTimer + 1 == Config.BlackoutTimer then
                                SetFlash(0, 0, 100, 7000, 100)

                                DoScreenFadeOut(500)
                                while not IsScreenFadedOut() do
                                    Wait(0)
                                end

                                if not IsPedRagdoll(player) and IsPedOnFoot(player) and not IsPedSwimming(player) then
                                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08) -- change this float to increase/decrease camera shake
                                    SetPedToRagdollWithFall(player, 7500, 9000, 1, GetEntityForwardVector(player), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
                                end

                                Wait(1500)
                                DoScreenFadeIn(1000)
                                blackoutTimer = 0
                            else
                                DoScreenFadeOut(500)
                                while not IsScreenFadedOut() do
                                    Wait(0)
                                end
                                DoScreenFadeIn(500)

                                if isBleeding > 3 then
                                    blackoutTimer = blackoutTimer + 2
                                else
                                    blackoutTimer = blackoutTimer + 1
                                end
                            end

                            fadeOutTimer = 0
                        else
                            fadeOutTimer = fadeOutTimer + 1
                        end

                        local bleedDamage = tonumber(isBleeding) * Config.BleedTickDamage
                        ApplyDamageToPed(player, bleedDamage, false)
                        DoBleedAlert()
                        playerHealth = playerHealth - bleedDamage
                        local randX = math.random() + math.random(-1, 1)
                        local randY = math.random() + math.random(-1, 1)
                        local coords = GetOffsetFromEntityInWorldCoords(player, randX, randY, 0)
                        TriggerServerEvent("evidence:server:CreateBloodDrop", PSRCore.Functions.GetPlayerData().citizenid, PSRCore.Functions.GetPlayerData().metadata["bloodtype"], coords)

                        if advanceBleedTimer >= Config.AdvanceBleedTimer then
                            ApplyBleed(1)
                            advanceBleedTimer = 0
                        else
                            advanceBleedTimer = advanceBleedTimer + 1
                        end
                    end
                end
                bleedTickTimer = 0
            else
                if math.floor(bleedTickTimer % (Config.BleedTickRate / 10)) == 0 then
                    local currPos = GetEntityCoords(player, true)
                    local moving = #(vector2(prevPos.x, prevPos.y) - vector2(currPos.x, currPos.y))
                    if (moving > 1 and not IsPedInAnyVehicle(player)) and isBleeding > 2 then
                        advanceBleedTimer = advanceBleedTimer + Config.BleedMovementAdvance
                        bleedTickTimer = bleedTickTimer + Config.BleedMovementTick
                        prevPos = currPos
                    else
                        bleedTickTimer = bleedTickTimer + 1
                    end
                end
                bleedTickTimer = bleedTickTimer + 1
            end
        end
    end
end)