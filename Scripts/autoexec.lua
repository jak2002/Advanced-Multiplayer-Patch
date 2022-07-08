-- This file executes when the game starts, but after main.lua! (replacement modexe.lua because it does not run in the editor)

-- Selecting language
local language = tostring(getglobal("g_language"));

if (language == "russian") then
    Language:LoadStringTable("../Language/Russian.xml");
else
    Language:LoadStringTable("../Language/English.xml");
end

-- Loading a configurator script for saving new variables
Script:ReloadScript("Scripts/configurator.lua");
Script:ReloadScript("Scripts/anticheat.lua");
config:LoadConfig();