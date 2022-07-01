-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- team Head up display
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

Script:LoadScript("scripts/GUI/HudCommon.lua");
Script:LoadScript("scripts/GUI/HudMultiplayer.lua");

Hud.teamcolors={
		red="$4",
		blue="$2",
	}
	
Hud.teamrgb={
		red={1,0,0},
		blue={0,0,1},
	}
	
Hud.PlayerObjective=nil;			-- sycronized string for HUD


-----------------------------------------------------------------------------
function Hud:OnInit()
	self:CommonInit();
	Language:LoadStringTable("MultiplayerHUD.xml");
end
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function Hud:OnUpdate()
	
	%Game:SetHUDFont("hud", "ammo");
		
	local player=_localplayer;
	-- changed
	local bLocalIsAPlayer = player and (player.entity_type~="spectator");
	--place to check
	------------------------------------------
	if(bLocalIsAPlayer)then 
		--overlay
		ClientStuff.vlayers:DrawOverlay();
		
		-- [tiago] display onscreen fx, when player gets damage	(only when smokeblur layer not active)
		if (not ClientStuff.vlayers:IsActive("SmokeBlur") and not ClientStuff.vlayers:IsFading("SmokeBlur")) then							
			-- check damage/hits...
			if(self.hitdamagecounter>0) then
				-- [tiago] testing blury/bloody screen fx
				System:SetScreenFx("ScreenBlur", 1);								
				self.hitdamagecounter=self.hitdamagecounter - _frametime*3.5;
				System:SetScreenFxParamFloat("ScreenBlur", "ScreenBlurAmount", self.hitdamagecounter/10.0);
			else
				System:SetScreenFx("ScreenBlur", 0);
				self.hitdamagecounter=0;
			end
							
		end

		---------------------------------------------------
		--moved panoramic display before hud visibility check because we need panoramic in cut-scenes and dont anything else
		if(hud_panoramic=="1")then
			%System:DrawImage(self.black_dot, 0, 0, 800, tonumber(hud_panoramic_height), 0);
			%System:DrawImage(self.black_dot, 0, 600-tonumber(hud_panoramic_height), 800, tonumber(hud_panoramic_height), 0);
		end
			
		if(cl_display_hud == "0" or self.bHide)then
			return
		end
		
		self:DrawTeams(player);
		self:DrawCrosshairName(player);		
		
		--infos
		%Game:SetHUDFont("hud", "ammo");
		
		self:OnUpdateCommonHudElements();
		
--		if Hud.PlayerObjective then
--			Game:WriteHudString( 10, 100, "@"..Hud.PlayerObjective, 1, 1, 1, 1, 30, 30);
--		end
--System:Log("Line 81 TeamHud.lua, Hud OnUpdate()  before else Local is a spectator");
	else -- LocalIsASpectator
--		System:Log("Line 83 TeamHud.lua, Hud OnUpdate()  After else Local is a spectator");
		if(cl_display_hud == "0" or self.bHide)then
			return
		end
		
		--spectator
		--changed
--		System:Log("Line 90 Spectating block");
		local head_string="@Spectating"
		if(player)then
		
			local hostid = "holder";
			if(player.cnt.GetHost) then
			hostid = player.cnt:GetHost();
			end
			if(hostid and hostid~=0)then
				local host=System:GetEntity(hostid);
				if(host)then
					head_string=head_string.." "..host:GetName();
--					System:Log("Line 102 teamhud, should e setting name");
				end
			end
		end
		%Game:SetHUDFont("hud", "ammo");
		%Game:WriteHudString( 10, 10, head_string, 1, 1, 1, 1, 35, 35);
		%Game:WriteHudString( 10, 40, "@OpenMenuAndJoinTeam", 1, 1, 1, 1, 20, 20);
		--changed, added to spec
		if(player) then
			if (player.entity_type == "spectator" and player.cnt.GetHost) then -- player is spectator
				if (player.cnt:GetHost() > 0 ) then
				
				--player = System:GetEntity(player.cnt:GetHost());
				end
			end
			self:DrawTeams(player);
			self:DrawCrosshairName(player);		
		
			--infos
			%Game:SetHUDFont("hud", "ammo");
			
			self:OnUpdateCommonHudElements();
		
		end
	end
	
	local LocalPlayerTeam;
	
	if player then
		LocalPlayerTeam=Game:GetEntityTeam(player.id);
	end
	
	-- default is red team
	local teamR, teamG, teamB=1, 0, 0;
	if(LocalPlayerTeam=="blue") then
		teamR=0; 
		teamB=1;
	end

	if(bLocalIsAPlayer) then
		%System:DrawImageColor(self.PlayerObjectiveAnimTex, 710, 5, 52, 52, 4, teamR, teamG, teamB, 1);
	end
	
	self:FlushCommon();
	------------------------------------------
	--if(getn(self.messages)>0)then
		--%Game:SetHUDFont("default", "default");
	
	self:MessagesBox();	
	%Game:SetHUDFont("hud", "ammo");
	
	--end
	
	if(self.centermessage)then
		self:CenterMessage();
	end
	
	ScoreBoardManager:Render();
	
	
	%Game:SetHUDFont("hud", "ammo");
	if(cl_display_hud ~= "0" and ClientStuff and not self.bHide)then
		local iGameState = Client:GetGameState();
		local fTimeLimit = Hud.fTimeLimit;
		
		if (iGameState == CGS_INPROGRESS) then
			
			if (fTimeLimit and (fTimeLimit > 0)) then
				local fTime = floor(fTimeLimit * 60) - (_time - Client:GetGameStartTime());
				Hud:DrawRightAlignedString("@TimeLeft 99:99","@TimeLeft "..SecondsToString(max(fTime, 0)), 20, 20, 1, 1, 1, 1, 60, 5);
			else
				Hud:DrawRightAlignedString("@NoTimeLimit","@NoTimeLimit", 20, 20, 1, 1, 1, 1, 60, 5);
			end
		
			-- if we have a respawn cycle
			if ((self.iRespawnCycleStart ~= nil) and (self.iRespawnCycleStart ~= nil)) then
			
				local fTime = ceil(self.iRespawnCycleLength - (_time - self.iRespawnCycleStart));
				
				Hud:DrawRightAlignedString("@Reinforcements 99","@Reinforcements "..tostring(max(fTime, 0)), 20, 20, 1, 1, 1, 1, 73, 5);
			end
	
		elseif (iGameState ~= CGS_INTERMISSION) then
		
			Game:WriteHudString( 360, 180, "@PREWAR", 1, 1, 1, 1, 30, 30);
		
		end
	end	
end


-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
function Hud:OnShutdown()
	%System:Log("Hud:OnShutdown()");
end
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
