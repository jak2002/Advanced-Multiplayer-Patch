-- Add here all the variables that you want to save in the config file of the mod
config = {
    vars = {
        "p_fov",
        "s_hitsounds",
        "mp_hatmodel",
        "hud_crosshair_static",
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
        "hud_crosshair_default",
    },
};

-- Creating new variables
Game:CreateVariable("p_fov", 90);
Game:CreateVariable("s_hitsounds", 0);
Game:CreateVariable("hud_crosshair_default", 1);
Game:CreateVariable("hud_crosshair_static", 0);
Game:CreateVariable("hud_crosshair_color_r", 1);
Game:CreateVariable("hud_crosshair_color_g", 1);
Game:CreateVariable("hud_crosshair_color_b", 0);
Game:CreateVariable("hud_crosshair_hit_color_r", 1);
Game:CreateVariable("hud_crosshair_hit_color_g", 0);
Game:CreateVariable("hud_crosshair_hit_color_b", 0);
Game:CreateVariable("hud_crosshair_tlike", 0);
Game:CreateVariable("hud_crosshair_thickness", 1);
Game:CreateVariable("hud_crosshair_length", 7);
Game:CreateVariable("hud_crosshair_spacing", 2);
Game:CreateVariable("hud_crosshair_dot", 1);

function config:SaveConfig()
    local path  = "Mods/"..tostring(Game:GetCurrentModName()).."/".."config.cfg";
    local hfile = openfile(path, "w+");

    if (hfile) then
        for key, value in config.vars do
            if (getglobal(tostring(value))) then
                write(hfile, tostring(value).." = "..'"'..tostring(getglobal(value))..'"'.."\n");
            end
        end
        closefile(hfile);
    end
end

-- Formats text (remove spaces and brackets)
function config:format(str) str = gsub(str, "%s+", ""); str = gsub(str, '"', ""); return str end

function config:LoadConfig()
    local path = "Mods/"..tostring(Game:GetCurrentModName()).."/".."config.cfg";
    local hfile = openfile(path, "r+");

    if (hfile) then
        local fileTable = ReadTableFromFile(path, true);
        if (fileTable) then
            for key, value in fileTable do
                if (getglobal(self:format(tostring(key)))) then
                    setglobal( self:format(tostring(key)), self:format(tostring(value)) );
                end
            end
        end
        closefile(hfile);
    end
end

-- Hooks to exit game functions
Game._Quit = Game.Quit;
function Game:Quit()
    config:SaveConfig();
    Game:_Quit();
end

Game._SendMessage = Game.SendMessage;
function Game:SendMessage(msg)
    if (msg == "Quit-Yes" or msg == "Relaunch") then
        config:SaveConfig();
    end

    Game:_SendMessage(msg);
end