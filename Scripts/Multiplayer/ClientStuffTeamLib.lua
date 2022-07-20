
Script:LoadScript("scripts/Multiplayer/ClientStuffLib.lua");		-- derive functionality

-- @AMP
-- New One
ClientStuff.bIsTeamBased = 1;

-------------------------------------------------------------------------------
-- callback for getting the in game menu
function ClientStuff:GetInGameMenuName()
	return "InGameTeam";
end



