--[[To add clothes, copy the hash, paste it at the end of the list and add range in slider(_f means women Only MP components work)--]]

local lista_kapelusze = {} --hat
local lista_kapelusze_f = {}
----------------------------------------------------------------------------------------------------------------------------
local lista_koszula = {} --shirt
local lista_koszula_f = {}
--------------------------------------------------------------------------------------------------------------------------------------
local lista_kamizelka = {} --vest
local lista_kamizelka_f = {}
--------------------------------------------
local lista_spodnie = {} --pants
local lista_spodnie_f = {}
------------------------------------------
local lista_maska = {} --mask
local lista_maska_f = {}
------------------------------------------
local lista_buty = {} --boots
local lista_buty_f = {}
-----------------------------------------
local lista_plaszcz = {} --coats
local lista_plaszcz_f = {}
---------------------------------------
local femaletorsos = {}
local femalelegs = {}

local maletorsos = {}
local malelegs = {}

local legs = nil
local legs2 = nil
local torso = nil
local torso2 = nil

local lista_spodnica = {} --skirt
local adding2 = true
local adding = true
local glowna = lista_kapelusze
local sex_global = 1
local cam = nil

Citizen.CreateThread(function()
    while adding do
        Citizen.Wait(0)
        --print("Dzieje sie")
        for i, v in ipairs(MaleComp) do
            if v.category == "hats" then
                table.insert(lista_kapelusze, v.Hash)
            elseif v.category == "shirts" then
                table.insert(lista_koszula, v.Hash)
            elseif v.category == "vests" then
                table.insert(lista_kamizelka, v.Hash)
            elseif v.category == "pants" then
                table.insert(lista_spodnie, v.Hash)
            elseif v.category == "masks" then
                table.insert(lista_maska, v.Hash)
            elseif v.category == "coats" then
                table.insert(lista_plaszcz, v.Hash)
            elseif v.category == "boots" then
                table.insert(lista_buty, v.Hash)
            elseif v.category == "torsos" then
                table.insert(maletorsos, v.Hash)
            elseif v.category == "legs" then
                table.insert(malelegs, v.Hash)
            end
        end
        adding = false
    end
end)


Citizen.CreateThread(function()
    while adding2 do
        Citizen.Wait(0)
        --print("Dzieje sie 2")
        for i, v in ipairs(FemaleComp) do
            if v.category == "hats" then
                table.insert(lista_kapelusze_f, v.hash)
            elseif v.category == "shirts" then
                table.insert(lista_koszula_f, v.hash)
            elseif v.category == "vests" then
                table.insert(lista_kamizelka_f, v.hash)
            elseif v.category == "pants" then
                table.insert(lista_spodnie_f, v.hash)
            elseif v.category == "boots" then
                table.insert(lista_buty_f, v.hash)
            elseif v.category == "masks" then
                table.insert(lista_maska_f, v.hash)
            elseif v.category == "coats" then
                table.insert(lista_plaszcz_f, v.hash)
            elseif v.category == "skirts" then
                table.insert(lista_spodnica, v.hash)
            elseif v.category == "torsos" then
                table.insert(femaletorsos, v.hash)
            elseif v.category == "legs" then
                table.insert(femalelegs, v.hash)
            else end
        end
        adding2 = false
    end
end)





RegisterNetEvent('redem_clothing:sex')
AddEventHandler('redem_clothing:sex', function(skin)
    local _skin = json.decode(skin)
    local sex = 1
    if _skin.sex == "male" then
        sex = 1
        sex_global = sex
        if tonumber(_skin.skin) == 1 then
            torso = '0x' .. maletorsos[6]
            legs = '0x' .. malelegs[5]
        elseif tonumber(_skin.skin) == 2 then
            torso = '0x' .. maletorsos[2]
            legs = '0x' .. malelegs[5]
        elseif tonumber(_skin.skin) == 3 then
            torso = '0x' .. maletorsos[4]
            legs = '0x' .. malelegs[1]
        elseif tonumber(_skin.skin) == 4 then
            torso = '0x' .. maletorsos[7]
            legs = '0x' .. malelegs[3]
        elseif tonumber(_skin.skin) == 5 then
            torso = '0x' .. maletorsos[5]
            legs = '0x' .. malelegs[4]
        elseif tonumber(_skin.skin) == 6 then
            torso = '0x' .. maletorsos[3]
            legs = '0x' .. malelegs[2]
        else end
    else
        sex = 2
        sex_global = sex
        if tonumber(_skin.skin) == 1 then
            torso2 = '0x' .. femaletorsos[6]
            legs2 = '0x' .. femalelegs[1]
        elseif tonumber(_skin.skin) == 2 then
            torso2 = '0x' .. femaletorsos[3]
            legs2 = '0x' .. femalelegs[2]
        elseif tonumber(_skin.skin) == 3 then
            torso2 = '0x' .. femaletorsos[2]
            legs2 = '0x' .. femalelegs[3]
        elseif tonumber(_skin.skin) == 4 then
            torso2 = '0x' .. femaletorsos[4]
            legs2 = '0x' .. femalelegs[5]
        elseif tonumber(_skin.skin) == 5 then
            torso2 = '0x' .. femaletorsos[8]
            legs2 = '0x' .. femalelegs[6]
        elseif tonumber(_skin.skin) == 6 then
            torso2 = '0x' .. femaletorsos[9]
            legs2 = '0x' .. femalelegs[8]
        else end
    end
    startUI(sex)
    SetNuiFocus(true, true)
    camera()


end)

function startUI(sex)
    local sex1 = sex
    SendNUIMessage({
        type = "ui",
        display = true,
        sex3 = sex1
    })
end

function hideUI()
    SendNUIMessage({
        type = "ui",
        display = false

    })
end


RegisterCommand('clothing', function(source, args)
    TriggerServerEvent("redem_clothing:sex_test", function(cb)
        end)
end)



RegisterNUICallback('heading', function(heading)
    local playerPed = PlayerPedId()
    local _heading = heading/1 -- yes :1 xD
    print(_heading)
    SetEntityHeading(playerPed, _heading)
end)

RegisterNUICallback('Save', function(data, cb)
    SetNuiFocus(false, false)
    destory()
    local elementy = {
        ["kapelusz"] = data.kapelusz,
        ["koszula"] = data.koszula,
        ["kamizelka"] = data.kamizelka,
        ["spodnie"] = data.spodnie,
        ["maska"] = data.maska,
        ["buty"] = data.buty,
        ["spodnica"] = data.spodnica,
        ["plaszcz"] = data.plaszcz

    }
    --print("tak1")
    print(tonumber(elementy.kapelusz)) -- INCOMING
    local price = 0
    local json = json.encode(elementy)
    TriggerServerEvent("redem_clothing:Save", json, price, function(cb)
        if cb then
            print("DONE")
        else
            print("ERROR")
        end
    end)
    --	print("tak2")
end)


RegisterNUICallback('komponent', function(component)
    if sex_global == 1 then
        if component == "kapelusz" then
            glowna = lista_kapelusze
        elseif component == "koszula" then
            glowna = lista_koszula
        elseif component == "kamizelka" then
            glowna = lista_kamizelka
        elseif component == "spodnie" then
            glowna = lista_spodnie
        elseif component == "maska" then
            glowna = lista_maska
        elseif component == "buty" then
            glowna = lista_buty
        elseif component == "plaszcz" then
            glowna = lista_plaszcz
        end

    elseif sex_global == 2 then
        if component == "kapelusz" then
            glowna = lista_kapelusze_f
        elseif component == "koszula" then
            glowna = lista_koszula_f
        elseif component == "kamizelka" then
            glowna = lista_kamizelka_f
        elseif component == "spodnie" then
            glowna = lista_spodnie_f
        elseif component == "maska" then
            glowna = lista_maska_f
        elseif component == "buty" then
            glowna = lista_buty_f
        elseif component == "spodnica" then
            glowna = lista_spodnica
        elseif component == "plaszcz" then
            glowna = lista_plaszcz_f

        end
    end
    --print(component)
end)

RegisterNUICallback('zmiana', function(wartosc)
    local wartosc2 = tonumber(wartosc)
    local hash = ("0x" .. glowna[wartosc2])

    --print(glowna[wartosc2])
    if glowna == lista_spodnie_f and wartosc2 <= 1  then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs2),true,true,true)

    elseif glowna == lista_spodnie and wartosc2 <= 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs),true,true,true)

    elseif glowna == lista_koszula and wartosc2 <= 1  then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso),true,true,true)

    elseif glowna == lista_koszula_f and wartosc2 <= 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso2),true,true,true)

    elseif (glowna == lista_maska_f or glowna == lista_maska) and wartosc2 == 1 then

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0) -- Set target category, here the hash is for hats
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

    elseif (glowna == lista_kapelusze_f or glowna == lista_kapelusze) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0) -- Set target category, here the hash is for hats
        --   Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

    elseif glowna == lista_spodnica and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0) -- Set target category, here the hash is for hats
        -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

    elseif (glowna == lista_plaszcz_f or glowna == lista_plaszcz) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0) -- Set target category, here the hash is for hats
        -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

    elseif (glowna == lista_kamizelka_f or glowna == lista_kamizelka) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0) -- Set target category, here the hash is for hats
        -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

    else

        Citizen.InvokeNative(0xD3A7B003ED343FD9 , PlayerPedId(),  tonumber(hash), true, true, true)
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

    if glowna == lista_buty then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs),true,true,true)
    elseif glowna == lista_spodnie_f or lista_buty_f then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs2),true,true,true)
    elseif glowna == lista_koszula  then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso),true,true,true)
    elseif glowna == lista_koszula_f  then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso2),true,true,true)
    end
end)


RegisterNetEvent('redem_clothing:load2')
AddEventHandler('redem_clothing:load2', function()
    TriggerServerEvent("redem_clothing:loadClothes", function(cb)
        end)
end)
RegisterNetEvent('redem_clothing:load_def')
AddEventHandler('redem_clothing:load_def', function()
    TriggerServerEvent("redemrp_skin:loadSkin", function(cb)
        end)
end)

RegisterCommand("loadcloath", function(source, args)
    TriggerServerEvent("redem_clothing:loadClothes", function(cb)
        end)
    print(lista_kapelusze[5])
    print(lista_spodnie_f[5])
end)

RegisterNetEvent('redem_clothing:load')
AddEventHandler('redem_clothing:load', function(skin, ubranie)
    local _skin = json.decode(skin)
    local _ubranie = json.decode(ubranie)
    local sex = 1
    local hash = nil
    local wartosc = 1
    --print (_skin.sex)

    if _skin.sex == "male" then
        sex = 1
    else
        sex = 2
    end

    if sex == 1 then
        Wait(300)
        glowna = lista_maska
        wartosc = tonumber(_ubranie.maska)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło5")
        end
        Wait(300)
        glowna = lista_kapelusze
        wartosc = tonumber(_ubranie.kapelusz)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło1")
        end
        Wait(300)
        glowna = lista_koszula
        wartosc = tonumber(_ubranie.koszula)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło2")
        end
        Wait(300)
        glowna = lista_kamizelka
        wartosc = tonumber(_ubranie.kamizelka)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło3")
        end
        Wait(300)
        glowna = lista_plaszcz
        wartosc = tonumber(_ubranie.plaszcz)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło1")
        end
        Wait(300)
        glowna = lista_spodnie
        wartosc = tonumber(_ubranie.spodnie)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło4")
        end
        Wait(300)
        glowna = lista_buty
        wartosc = tonumber(_ubranie.buty)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
    else



        Wait(300)
        glowna = lista_maska_f
        wartosc = tonumber(_ubranie.maska)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło5")
        end

        glowna = lista_kapelusze_f
        wartosc = tonumber(_ubranie.kapelusz)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło1")
        end
        Wait(300)
        glowna = lista_koszula_f
        wartosc = tonumber(_ubranie.koszula)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło2")
        end
        Wait(300)
        glowna = lista_kamizelka_f
        wartosc = tonumber(_ubranie.kamizelka)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło3")
        end
        Wait(300)
        glowna = lista_plaszcz_f
        wartosc = tonumber(_ubranie.plaszcz)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło5")
        end
        Wait(300)
        glowna = lista_spodnie_f
        wartosc = tonumber(_ubranie.spodnie)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło4")
        end
        Wait(300)
        glowna = lista_buty_f
        wartosc = tonumber(_ubranie.buty)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = lista_spodnica
        wartosc = tonumber(_ubranie.spodnica)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło7")
        end
    end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('redem_clothing:cancel')
AddEventHandler('redem_clothing:cancel', function()
    local timer = 200
    while timer > 0 do
        Citizen.Wait(0)
        DrawTxt("NO MONEY", 0.50, 0.90, 0.6, 0.6, true, 161, 3, 0, 255, true, 10000)
        timer = timer - 1
    end
end)


function ladowanie(hash)
    Citizen.InvokeNative(0xD3A7B003ED343FD9 , PlayerPedId(),  tonumber(hash), true, true, true)
    --print("poszło13")
    --print(hash)
end


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
		Citizen.InvokeNative(0xADA9255D, 10);
		DisplayText(str, x, y)
end

function destory()
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 500, true, true)
    cam = nil
    DisplayHud(true)
    DisplayRadar(true)
end

function camera()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local heading = 90.0
    local zoomOffset = 3.0
    local camOffset = -0.06
    local angle = heading * math.pi / 180.0
    local theta = {
        x = math.cos(angle),
        y = math.sin(angle)
    }
    print(theta.x)
    local pos = {
        x = coords.x + (zoomOffset * theta.x),
        y = coords.y + (zoomOffset * theta.y)
    }
    print(pos.x)
    local angleToLook = heading - 140.0
    if angleToLook > 360 then
        angleToLook = angleToLook - 360
    elseif angleToLook < 0 then
        angleToLook = angleToLook + 360
    end
    print(angleToLook)
    angleToLook = angleToLook * math.pi / 180.0
    local thetaToLook = {
        x = math.cos(angleToLook),
        y = math.sin(angleToLook)
    }
    print(thetaToLook.x)
    local posToLook = {
        x = coords.x + (zoomOffset * thetaToLook.x),
        y = coords.y + (zoomOffset * thetaToLook.y)
    }
    print(posToLook.x)

    SetEntityHeading(playerPed, 15.00)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, coords.z + camOffset, 300.00,0.00,0.00, 40.00, false, 0)
    PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
    DisplayHud(false)
    DisplayRadar(false)
end
