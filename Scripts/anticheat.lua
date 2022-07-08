Anticheat = {
    Server = {},
    Client = {},
    Hashes = {
        Game:GetMD5(ReadFile("scripts/anticheat.lua")),
        Game:GetMD5(ReadFile("scripts/default/entities/weapons/basicweapon.lua")),
        Game:GetMD5(ReadFile("scripts/default/entities/weapons/weaponsparams.lua")),
    },
}

function Anticheat:GetMegaHash()
    local mega_hash = ""
    for k,v in Anticheat.Hashes do
        mega_hash = mega_hash..v
    end
    mega_hash = Game:GetMD5(mega_hash)
    return mega_hash
end

-- called on client when just joined server
function Anticheat.Client:SendScriptHash()
    Client:SendCommand(format("CSH %s",Anticheat:GetMegaHash()))
end