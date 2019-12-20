--[[To add clothes, copy the hash, paste it at the end of the list and add range in slider(_f means women Only MP components work)--]]

local lista_kapelusze = { "9925C067","17C59C8F","23582134", "208B8617","23582134","9E59C41","AE05E47F","503FA8F0","5E0FFB00","728EA40D"} --hat
local lista_kapelusze_f = { "9925C067","15AE34D2","19E100C6", "1FA04DDE","26AE2699","2722B913","2BBAA479","2DD1EA41","295788CF","3940E002"}
----------------------------------------------------------------------------------------------------------------------------
local lista_koszula = { "2A77805F","2EC3810A","3C7C96D9", "3D931E28","58215FE1","5AE17823","5BA76CCF","6E4D22C1","A50D396D","B3813237"} --shirt
local lista_koszula_f = { "3FFDB97F","4869A5","5C7EE411", "61879090","6AB27695","98DB5B59","A467BC3A","C9061F73","C7EEBDCC","D44CC9E8"}
--------------------------------------------------------------------------------------------------------------------------------------
local lista_kamizelka = { "2FDAB6E3","47FF63F3","55C80238", "60F698A9","71349365","73DC8C16","74790121","8F0C74C0","9A208AFC","98E36C5F"} --vest
local lista_kamizelka_f = { "237FCE94","31BC6B0D","519707CE", "5B4F5A36","6B503B40","6E1A40D4","6B34E212","78B6D5F1","7750FCAB","7FDCE459"}
-------------------------------------------------------------------------------------------------------------------------------------
local lista_spodnie = { "1331FADE","12D463B0","1395EFA0", "139A7863","169E4BBE","216612F0","1A97ED82","19CB5254","1331FADE","213C96BF"} --pants
local lista_spodnie_f = { "11FE25C4","1287CEF4","1395EFA0", "151162C0","1945CE44","1E77B354","20456A6F","23FD210","2B1E0DA7","2A69176A"}
----------------------------------------------------------------------------------------------------------------------------------
local lista_maska = { "7505EF42","22DAC138","388E63D3", "43AC3366","4DD9C7C1","66CC4802","676A3198","8BFB9260","A6F0AE12","B0695B3B"} --mask
local lista_maska_f = { "7505EF42","102A2B4A","2DCAF428", "29E9DEC9","46A49515","827A1DE1","AD4C7385","9E7E107A","9F06D6FA","B45AF080"}
----------------------------------------------------------------------------------------------------------------------------------
local lista_buty = { "16F1960A","189227AA","1CCEE58D", "1EF2B6A3","25C9CD3B","3420118","3B194911","40568254","432FFAD1","4818E747"} --boots
local lista_buty_f = { "106A2126","118E7E7C","134D7E03", "14683CDF","1696E043","19ADA9E","1AFAC5E","1B844230","1BCE1200","1CCD18F6"}
----------------------------------------------------------------------------------------------------------------------------------
local lista_plaszcz = { "105F0147","12E51663","1377C4A2", "178CBCFD","1F79CDC8","22A8A5DA","32C84619","3B54B33C","40E1109A","41D9A165"} --coats
local lista_plaszcz_f = { "103945D2","12F06E5","14511493", "454CD05","16F991F3","1B67B645","2099FE43","21FBEC56","24876E6E","285EF3C5"}
----------------------------------------------------------------------------------------------------------------------------------
local lista_spodnica = { "27B2AA60","648E23FE","C26F349", "C27B462C","DD9FFFF3","A6E19277","EFCD244D","117BBF76","51E0A707","CE40F574"} --skirt


local glowna = lista_kapelusze
local sex_global = 1
local cam = nil

RegisterNetEvent('redem_clothing:sex')
AddEventHandler('redem_clothing:sex', function(skin)
local _skin = json.decode(skin)
local sex = 1
if _skin.sex == "male" then
  sex = 1
  sex_global = sex
else
  sex = 2
  sex_global = sex
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
local price = 10
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
    maska_del = 2
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
--print(glowna[wartosc2])


local hash = ("0x" .. glowna[wartosc2])
if (glowna == lista_maska_f or glowna == lista_maska) and wartosc2 == 1 then
  Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0) -- Set target category, here the hash is for hats
  --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

elseif (glowna == lista_kapelusze_f or glowna == lista_kapelusze) and wartosc2 == 1 then
  Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0) -- Set target category, here the hash is for hats
  --   Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

elseif glowna == lista_spodnie_f and wartosc2 == 1 then
  Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) -- Set target category, here the hash is for hats
  -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

elseif glowna == lista_spodnica and wartosc2 == 1 then
  Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0) -- Set target category, here the hash is for hats
  -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
  
 elseif (glowna == lista_maska_f or glowna == lista_plaszcz) and wartosc2 == 1 then
  Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0) -- Set target category, here the hash is for hats
  -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
  
  elseif (glowna == lista_kamizelka_f or glowna == lista_kamizelka) and wartosc2 == 1 then
  Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0) -- Set target category, here the hash is for hats
  -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

else

  Citizen.InvokeNative(0xD3A7B003ED343FD9 , PlayerPedId(),  tonumber(hash), true, true, true)


end
Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
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
 Wait(200)
  glowna = lista_maska
  wartosc = tonumber(_ubranie.maska)
  if wartosc > 1 then
    --print(wartosc)
    hash = ("0x" .. glowna[wartosc])
    ladowanie(hash)
    --print("poszło5")
		else
	Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0) -- Set target category, here the hash is for hats
	Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
  end
  glowna = lista_kapelusze
  wartosc = tonumber(_ubranie.kapelusz)
   if wartosc > 1 then
    --print(wartosc)
    hash = ("0x" .. glowna[wartosc])
    ladowanie(hash)
    --print("poszło1")
  end
  Wait(200)
  glowna = lista_koszula
  wartosc = tonumber(_ubranie.koszula)
  --print(wartosc)
  hash = ("0x" .. glowna[wartosc])
  ladowanie(hash)
  --print("poszło2")
  Wait(200)
  if wartosc > 1 then
  glowna = lista_kamizelka
  wartosc = tonumber(_ubranie.kamizelka)
  --print(wartosc)
  hash = ("0x" .. glowna[wartosc])
  ladowanie(hash)
  --print("poszło3")
  end
  Wait(200)
  glowna = lista_spodnie
  wartosc = tonumber(_ubranie.spodnie)
  --print(wartosc)
  hash = ("0x" .. glowna[wartosc])
  ladowanie(hash)
  --print("poszło4")
 
  Wait(200)
  glowna = lista_buty
  wartosc = tonumber(_ubranie.buty)
  --print(wartosc)
  hash = ("0x" .. glowna[wartosc])
  ladowanie(hash)
  --print("poszło6")
  Wait(200)
   glowna = lista_plaszcz
  wartosc = tonumber(_ubranie.plaszcz)
   if wartosc > 1 then
    --print(wartosc)
    hash = ("0x" .. glowna[wartosc])
    ladowanie(hash)
    --print("poszło1")
  end
else



 Wait(200)
  glowna = lista_maska_f
  wartosc = tonumber(_ubranie.maska)
  if wartosc > 1 then
    --print(wartosc)
    hash = ("0x" .. glowna[wartosc])
    ladowanie(hash)
    --print("poszło5")
 else
	Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0) -- Set target category, here the hash is for hats
	Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
  end
  
  glowna = lista_kapelusze_f
  wartosc = tonumber(_ubranie.kapelusz)
  if wartosc > 1 then
    --print(wartosc)
    hash = ("0x" .. glowna[wartosc])
    ladowanie(hash)
    --print("poszło1")
  end
  Wait(200)
  glowna = lista_koszula_f
  wartosc = tonumber(_ubranie.koszula)
  --print(wartosc)
  hash = ("0x" .. glowna[wartosc])
  ladowanie(hash)
  --print("poszło2")
  Wait(200)
  if wartosc > 1 then
  glowna = lista_kamizelka_f
  wartosc = tonumber(_ubranie.kamizelka)
  --print(wartosc)
  hash = ("0x" .. glowna[wartosc])
  ladowanie(hash)
  --print("poszło3")
  end
   Wait(200)
  glowna = lista_plaszcz_f
  wartosc = tonumber(_ubranie.plaszcz)
  if wartosc > 1 then
    --print(wartosc)
    hash = ("0x" .. glowna[wartosc])
    ladowanie(hash)
    --print("poszło5")
  end
  Wait(200)
  glowna = lista_spodnie_f
  wartosc = tonumber(_ubranie.spodnie)
  if wartosc > 1 then
    --print(wartosc)
    hash = ("0x" .. glowna[wartosc])
    ladowanie(hash)
    --print("poszło4")
  end
 
  Wait(200)
  glowna = lista_buty_f
  wartosc = tonumber(_ubranie.buty)
  --print(wartosc)
  hash = ("0x" .. glowna[wartosc])
  ladowanie(hash)
  --print("poszło6")
  Wait(200)
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
