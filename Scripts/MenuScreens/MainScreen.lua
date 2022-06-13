UI.PageMainScreen =
{	
	GUI=
	{
		OnActivate = function(self)
			self.fActivateTime = System:GetCurrAsyncTime();
		end,

		-- quickfix to prevent credits/demoloops from going to game after quitting with escape..
		-- this happens becase the switch is made in the next frame (it's a message)
		OnUpdate = function(self)
			if ((self.fActivateTime) and (System:GetCurrAsyncTime() - self.fActivateTime > 0.125)) then
				self.fActivateTime = nil;
				UI:EnableSwitch(1);
			end
		end
	},
	
	QuitYes = function()
		Game:SendMessage("Quit-Yes");
	end,

	ShowConfirmation = function()
		Game:SendMessage("Quit-Yes");
	end,
}

AddUISideMenu(UI.PageMainScreen.GUI,
{
	{ "Multiplayer", Localize("Multiplayer"), "Multiplayer", },
	{ "Options", Localize("Options"), "Options", },
	{ "Profiles", Localize("Profiles"), "Profiles", },
	{ "Mods", Localize("Mods"), "Mods", },	
	{ "Quit", Localize("Quit"), UI.PageMainScreen.QuitYes, },	
});

UI:CreateScreenFromTable("MainScreen", UI.PageMainScreen.GUI);

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
UI.PageMainScreenInGame =
{	
	GUI=
	{
		OnActivate = function(self)
			self.fActivateTime = System:GetCurrAsyncTime();
		end,

		-- quickfix to prevent credits/demoloops from going to game after quitting with escape..
		-- this happens becase the switch is made in the next frame (it's a message)
		OnUpdate = function(self)
			if ((self.fActivateTime) and (System:GetCurrAsyncTime() - self.fActivateTime > 0.125)) then
				self.fActivateTime = nil;
				UI:EnableSwitch(1);
			end
		end		
	},
	
	QuitYes = function()
		Game:SendMessage("Quit-Yes");
	end,

	ShowConfirmation = function()
		Game:SendMessage("Quit-Yes");
	end,

	Relaunch = function()
		Game:SendMessage("Relaunch");
	end,
}

AddUISideMenu(UI.PageMainScreenInGame.GUI,
{
	{ "Return", Localize("ReturnToGame"), "$Return$", },
	{ "-", "-", "-", },	-- separator
	{ "Multiplayer", Localize("Multiplayer"), "Multiplayer", },
	{ "Options", Localize("Options"), "Options", },
	{ "Profiles", Localize("Profiles"), "Profiles", },
	{ "Mods", Localize("Mods"), "Mods", },
	{ "Quit", Localize("Quit"), UI.PageMainScreenInGame.QuitYes, },
});

UI:CreateScreenFromTable("MainScreenInGame", UI.PageMainScreenInGame.GUI);