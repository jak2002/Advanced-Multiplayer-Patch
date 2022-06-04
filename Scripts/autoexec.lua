if (getglobal("g_language") == "russian") then
    Language:LoadStringTable("../Language/Russian.xml");
else
    Language:LoadStringTable("../Language/English.xml");
end

Script:ReloadScript("Scripts/configurator.lua");
config:LoadConfig();