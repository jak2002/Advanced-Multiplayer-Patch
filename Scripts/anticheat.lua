Anticheat = {
    Server = {
        KickPlayer = { -- table used to kick player, if player have not provided correct script hash
            Timers = {},
            OnEvent = function ( self,event,Params )
                GameRules:KickID(Params.ssid)
            end,
        },
    },
    Client = {

    },
    Hashes = {}, -- will contain all hashes after loading
    Files = { -- all files to compare hash sums
        "scripts/anticheat.lua",
        "bin32/crygame.dll",
        "scripts/autoexec.lua",
        "scripts/default/entities/weapons/basicweapon.lua",
        "scripts/default/entities/weapons/weaponsparams.lua",
        "scripts/multiplayer/ClientStuffLib.lua",
    },
}

function Anticheat:OnInit()
    for k,v in self.Files do
        self.Hashes[k] = Game:GetMD5(ReadFile(v))
    end
end

-- Return MD5 hash of all hashes
function Anticheat:GetScriptHash()
    local mega_hash = ""
    for k,v in Anticheat.Hashes do
        mega_hash = mega_hash..v
    end
    mega_hash = Game:GetMD5(mega_hash)
    printf("Your hash is %s",mega_hash)
    return mega_hash
end

--===============================================
-- 1. Request script hash from client (SERVER)
-- 2. Set 3 second timer
-- 3. If no correct hash was provided, player will be kicked
--===============================================
function Anticheat.Server:RequestHash(server_slot)
    server_slot:SendCommand("RSH")
    local time = 3000
    local id = server_slot:GetId()
    self.KickPlayer.Timers[id] = Game:SetTimer(self.KickPlayer,time,{ssid = id})
end

--===============================================
-- 1. Check if received hash matches server's
-- 2. IF
--      Correct hash -> Stop kick timer and let player stay
--      Wrong hash   -> Stop kick timer and kick player
--===============================================
function Anticheat.Server:AcceptHash(server_slot,hash)
    if hash == Anticheat:GetScriptHash() then
        Game:KillTimer(self.KickPlayer.Timers[server_slot:GetId()])
        printf("$3SS %s provided corrent script hash",server_slot:GetId())
    else
        Game:KillTimer(self.KickPlayer.Timers[server_slot:GetId()])
        GameRules:KickID(server_slot:GetId())
        printf("$4SS %s provided wrong script hash!",server_slot:GetId())
    end
end

-- Send scripts hash to server
function Anticheat.Client:SendScriptHash()
    Client:SendCommand(format("CSH %s",Anticheat:GetScriptHash()))
end

-- Called every frame on client by ClientStuff
function Anticheat.Client:OnUpdate(dt)
    if toNumberOrZero(getglobal("gr_Anticheat")) == 0 then
        return
    end
    -- the absolute shit explosion of a code, but works
    if tonumber(fixed_time_step) ~= 0 then
        fixed_time_step = 0
    end
end