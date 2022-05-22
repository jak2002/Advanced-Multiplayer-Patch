autoexec = {
    config = {
        "p_fov",
        "hud_hitsound", -- Game
        "hud_crosshair_smooth",
        "hud_crosshair_color_r",
        "hud_crosshair_color_g",
        "hud_crosshair_color_b",
        "hud_crosshair_hit_color_r",
        "hud_crosshair_hit_color_g",
        "hud_crosshair_hit_color_b",
        "hud_crosshair_tlike",
        "hud_crosshair_thickness",
        "hud_crosshair_length",
        "hud_crosshair_spacing",
        "hud_crosshair_dot",
        "hud_crosshair_default", -- Crosshair
    },
}

if (getglobal("g_language")) == "russian" then
    Language:LoadStringTable("../Languages/russian.xml");
else
    Language:LoadStringTable("../Languages/english.xml");
end

modfolder = "Mods/"..tostring(Game:GetCurrentModName()).."/";
cfgFileName = "config.cfg";

function autoexec:SaveModConfig()
    local path = tostring(modfolder..cfgFileName);
    local hfile = openfile(path, "w+");

    if (hfile) then
        for key, value in autoexec.config do
            write(hfile, tostring(value).."="..tostring(getglobal(tostring(value))).."\n");
        end
        printf("$3Mod Configuration File was Succesfully Saved!");
        closefile(hfile);
    end
end

function autoexec:LoadModConfig()
    local path = tostring(modfolder..cfgFileName);
    local hfile = openfile(path, "r+");

    if (hfile) then
        local fileTable = ReadTableFromFile(path, true);
        if (fileTable) then
            for key, value in fileTable do
                if (getglobal(tostring(key))) then
                    setglobal(tostring(key), value);
                end
            end
        end
        printf("$3Mod Configuration File was Succesfully Loaded!");
        closefile(hfile);
    end
end

autoexec:LoadModConfig()

-- hooks
Game._Quit = Game.Quit;
function Game:Quit()
    autoexec:SaveModConfig();
    Game:_Quit();
end

Game._SendMessage = Game.SendMessage;
function Game:SendMessage(msg)
    if (msg == "Quit-Yes" or msg == "Relaunch") then
        autoexec:SaveModConfig();
    end

    Game:_SendMessage(msg);
end