Anticheat = {
    Server = {},
    Client = {},
}

-- called on client when just joined server
function Anticheat.Client:OnConnect()
    Client:SendCommand(format("CSH %s %s",1,Game:GetMD5(ReadFile("scripts/anticheat.lua"))))
end