Anticheat = {
    Server = {},
    Client = {},
}

-- called on client when just joined server
function Anticheat.Client:SendScriptHash()
    Client:SendCommand(format("CSH %s %s",1,Game:GetMD5(ReadFile("scripts/anticheat.lua"))))
    Client:SendCommand(format("CSH %s %s",2,Game:GetMD5(ReadFile("scripts/default/entities/weapons/basicweapon.lua"))))
    Client:SendCommand(format("CSH %s %s",3,Game:GetMD5(ReadFile("scripts/default/entities/weapons/weaponsparams.lua"))))
end