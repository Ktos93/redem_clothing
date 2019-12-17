RegisterServerEvent('redem_clothing:Save')
AddEventHandler('redem_clothing:Save', function(ubrania, cb)
local _ubrania = ubrania
local decode = json.decode(ubrania)
TriggerEvent('redemrp:getPlayerFromId', source, function(user)
     local identifier = user.getIdentifier()
     local charid = user.getSessionVar("charid")
        TriggerEvent("redem_clothing:retrieveClothes", identifier, charid, function(call)

if call then

  MySQL.Async.execute("UPDATE clothes SET `clothes`='" .. _ubrania .. "' WHERE `identifier`=@identifier AND `charid`=@charid", {identifier = identifier, charid = charid}, function(done)
  end)
else

  MySQL.Async.execute('INSERT INTO clothes (`identifier`, `charid`, `clothes`) VALUES (@identifier, @charid, @ubrania);',
  {
    identifier = identifier,
    charid = charid,
    ubrania = _ubrania
  }, function(rowsChanged)
  end)
end
end)

end)
end)

RegisterServerEvent('redem_clothing:loadClothes')
AddEventHandler('redem_clothing:loadClothes', function()
local _source = source
local skin = nil
local ubrania = nil
TriggerEvent('redemrp:getPlayerFromId', source, function(user)
     local identifier = user.getIdentifier()
     local charid = user.getSessionVar("charid")

MySQL.Async.fetchAll('SELECT * FROM skins WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(skins)
if skins[1]then
  skin = skins[1].skin
end



MySQL.Async.fetchAll('SELECT * FROM clothes WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(ubrania)
if ubrania[1] then
  ubrania = ubrania[1].clothes
end
if ubrania and skin ~= nil then
  --print(ubrania)
  TriggerClientEvent("redem_clothing:load", _source, skin, ubrania)
end

end)
end)
end)
end)


RegisterServerEvent('redem_clothing:sex_test')
AddEventHandler('redem_clothing:sex_test', function()
local _source = source
local skin = nil
TriggerEvent('redemrp:getPlayerFromId', source, function(user)
     local identifier = user.getIdentifier()
     local charid = user.getSessionVar("charid")

MySQL.Async.fetchAll('SELECT * FROM skins WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(skins)
if skins[1]then
  skin = skins[1].skin
  if skin ~= nil then
    TriggerClientEvent("redem_clothing:sex", _source, skin)
  end
end
end)
end)
end)

AddEventHandler('redem_clothing:retrieveClothes', function(identifier, charid, callback)
local Callback = callback
MySQL.Async.fetchAll('SELECT * FROM clothes WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(ubrania)
if ubrania[1] then
  Callback(ubrania[1])
else
  Callback(false)
end
end)
end)
