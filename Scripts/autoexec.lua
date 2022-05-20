if (getglobal("g_language")) == "russian" then
    Language:LoadStringTable("../Languages/russian.xml");
else
    Language:LoadStringTable("../Languages/english.xml");
end

modfolder = "Mods/"..tostring(Game:GetCurrentModName()).."/";
