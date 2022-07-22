-- @AMP
-- Advanced Game Options Menu Page
UI.PageOptionsGameAdv =
{
	GUI =
	{
        OnUpdate = function(Sender)
            UI.PageOptionsGameAdv.GUI:DrawCrosshair()
        end,

        PersonalConfigText=
        {
            skin = UI.skins.Label,
            
            left = 200, top = 110,
            width = 400, 
            halign = UIALIGN_LEFT,
                        
            text = Localize("PersonalConfig");
        },

        widget_back =
        {
            left = 208, top = 426,
            width = 160,
            skin = UI.skins.BottomMenuButton,
            bordersides = "lrtb",

            text = Localize( "BasicGameOptions" ),

            tabstop = 14,

            OnCommand = function( sender )
                GotoPage( "GameOptions" );
                UI:ActivateScreen( "Options" );
            end,
        },

        ch_animated=
        {
            left = 210, top = 236,
            width = 14, height = 14,

            skin = UI.skins.CheckBox,

            tabstop = 1,

            OnChanged=function(Sender)
                if (Sender:GetChecked()) then
                    UI.PageOptionsGameAdv.GUI.shiftanimated = 1
                else
                    UI.PageOptionsGameAdv.GUI.shiftanimated = 0                    
                end
            end,
        },

        ch_tlike_text=
        {
            skin = UI.skins.Label,

            left = 177, top = 264,
            width = 112,

            text=Localize("TLikeCrosshair"),
        },
        ch_tlike=
        {
            left = 297, top = 264,
            width = 28, height = 28,

            skin = UI.skins.CheckBox,

            tabstop = 2,

            OnChanged=function(Sender)
                if (Sender:GetChecked()) then
                    setglobal("hud_crosshair_tlike", 1);
                else
                    setglobal("hud_crosshair_tlike", 0);
                end
            end,
        },

        ch_dot_text=
        {
            skin = UI.skins.Label,

            left = 177, top = 297,
            width = 112,

            text=Localize("CHDot"),
        },
        ch_dot=
        {
            left = 297, top = 297,
            width = 28, height = 28,

            skin = UI.skins.CheckBox,

            tabstop = 3,

            OnChanged=function(Sender)
                if (Sender:GetChecked()) then
                    setglobal("hud_crosshair_dot", 1);
                else
                    setglobal("hud_crosshair_dot", 0);
                end
            end,
        },

        ch_static_text=
        {
            skin = UI.skins.Label,

            left = 177, top = 330,
            width = 112,

            text=Localize("CHStatic"),
        },
        ch_static=
        {
            left = 297, top = 330,
            width = 28, height = 28,

            skin = UI.skins.CheckBox,

            tabstop = 4,

            OnChanged=function(Sender)
                if (Sender:GetChecked()) then
                    setglobal("hud_crosshair_static", 1);
                else
                    setglobal("hud_crosshair_static", 0);
                end
            end,
        },

        chcolorr_text =
        {
            skin = UI.skins.Label,
            left = 315, top = 150,
            width = 112,

            text = "R",
        },
        chcolorr =
        {
            skin = UI.skins.HScrollBar,

            left = 435, top = 150,
            width = 150, height = 24,

            tabstop = 5,

            OnChanged = function( sender )
                UI.PageOptionsGameAdv.SetCHColor()
            end,
        },

        chcolorg_text =
        {
            skin = UI.skins.Label,
            left = 315, top = 188,
            width = 112,

            text = "G",
        },
        chcolorg =
        {
            skin = UI.skins.HScrollBar,

            left = 435, top = 188,
            width = 150, height = 24,

            tabstop = 6,

            OnChanged = function( sender )
                UI.PageOptionsGameAdv.SetCHColor()
            end,
        },

        chcolorb_text =
        {
            skin = UI.skins.Label,
            left = 315, top = 226,
            width = 112,

            text = "B",
        },
        chcolorb =
        {
            skin = UI.skins.HScrollBar,

            left = 435, top = 226,
            width = 150, height = 24,

            tabstop = 7,

            OnChanged = function( sender )
                UI.PageOptionsGameAdv.SetCHColor()
            end,
        },

        chcolormode=
        {
            left = 435, top = 264,
            width = 150, height = 28,

            tabstop = 8,

            skin = UI.skins.ComboBox,

            OnChanged = function( Sender )
                UI.PageOptionsGameAdv.GUI:SelectCHMode()
            end,
        },

        ch_length_text =
        {
            skin = UI.skins.Label,
            left = 315, top = 308,
            width = 112,

            text = Localize( "CHLength" ),
        },
        ch_length =
        {
            skin = UI.skins.HScrollBar,

            left = 435, top = 308,
            width = 150, height = 24,

            tabstop = 9,

            OnChanged = function( sender )
                setglobal("hud_crosshair_length",UI.PageOptionsGameAdv.GUI.ch_length:GetValue() * 15)
            end,
        },

        ch_thickness_text =
        {
            skin = UI.skins.Label,
            left = 315, top = 344,
            width = 112,

            text = Localize( "CHThickness" ),
        },
        ch_thickness =
        {
            skin = UI.skins.HScrollBar,

            left = 435, top = 344,
            width = 150, height = 24,

            tabstop = 10,

            OnChanged = function( sender )
                setglobal("hud_crosshair_thickness",UI.PageOptionsGameAdv.GUI.ch_thickness:GetValue() * 3)
            end,
        },

        ch_spacing_text =
        {
            skin = UI.skins.Label,
            left = 315, top = 381,
            width = 112,

            text = Localize( "CHSpacing" ),
        },
        ch_spacing =
        {
            skin = UI.skins.HScrollBar,

            left = 435, top = 405 - 24,
            width = 150, height = 24,

            tabstop = 11,

            OnChanged = function( sender )
                setglobal("hud_crosshair_spacing",UI.PageOptionsGameAdv.GUI.ch_spacing:GetValue() * 5)
            end,
        },

        hitsounds_text =
        {
            skin = UI.skins.Label,
            left = 570, top = 144,
            width = 152,

            text = Localize( "HitSounds" ),
        },
        hitsounds =
        {
            skin = UI.skins.CheckBox,
            left = 730, top = 146,

            tabstop = 12,
        },

        pfov_text =
        {
            skin = UI.skins.Label,
            left = 620, top = 184,
            width = 80,

            text = Localize( "Fov" ),        
        },
        pfov =
        {
            skin =   UI.skins.EditBox,
            left = 702, top = 186,
            width = 56,

            tabstop = 13,
            maxlength = 3,
            namesafe = 1,
            numeric = 1,
            OnChanged = function (Sender)
                setglobal("p_fov",tonumber(UI.PageOptionsGameAdv.GUI.pfov:GetText()))
            end,
        },

        widget_crosshair_bg =
        {
            skin = UI.skins.MenuStatic,

            left = 210, top = 150,
            width = 115, height = 100,
            zorder = -1,

            texture = System:LoadImage( "textures/gui/rendermode_normal" ),
            color = "255 255 255 255",
            texrect = "0 0 128 128",
        },
        widget_crosshair_up =
        {
            skin = UI.skins.MenuStatic,

            left = 210, top = 150,
            width = 10, height = 75,
            bordersize = 0,

            texture = System:LoadImage( "textures/white.dds" ),
            color = "255 255 255 255",
            texrect = "0 0 128 128",
        },
        widget_crosshair_left =
        {
            skin = UI.skins.MenuStatic,

            left = 210, top = 150,
            width = 10, height = 75,
            bordersize = 0,

            texture = System:LoadImage( "textures/white.dds" ),
            color = "255 255 255 255",
            texrect = "0 0 128 128",
        },
        widget_crosshair_down =
        {
            skin = UI.skins.MenuStatic,

            left = 210, top = 150,
            width = 10, height = 75,
            bordersize = 0,

            texture = System:LoadImage( "textures/white.dds" ),
            color = "255 255 255 255",
            texrect = "0 0 128 128",
        },
        widget_crosshair_right =
        {
            skin = UI.skins.MenuStatic,

            left = 210, top = 150,
            width = 10, height = 10,
            bordersize = 0,

            texture = System:LoadImage( "textures/white.dds" ),
            color = "255 255 255 255",
            texrect = "0 0 128 128",
        },
        widget_crosshair_dot =
        {
            skin = UI.skins.MenuStatic,

            left = 210, top = 150,
            width = 10, height = 10,
            bordersize = 0,

            texture = System:LoadImage( "textures/white.dds" ),
            color = "255 255 255 255",
            texrect = "0 0 128 128",
        },

        separator=
        {
            skin = UI.skins.MenuBorder,
            left = 590, top = 141,
            width = 2, height = 275,
            color = "0 0 0 0",
            bordersides = "l",
        },
        separator1=
        {
            skin = UI.skins.MenuBorder,
            left = 330, top = 141,
            width = 2, height = 275,
            color = "0 0 0 0",
            bordersides = "l",
        },
        separator3 =
        {
            skin = UI.skins.MenuBorder,

            left = 200, top = 415,
            width = 580, height = 5,
            color = "0 0 0 0",
            bordersides = "t",
        },
        separator2=
        {
            skin = UI.skins.MenuBorder,
            left = 330, top = 298,
            width = 261, height = 2,
            color = "0 0 0 0",
            bordersides = "t",
        },
    },
    shift = 0,
    shiftanimated = 1,
    colormode = 1, -- 1 default ch color, 2 on hit ch color
}

function UI.PageOptionsGameAdv.GUI:UpdateUpLine()
    local bg = UI.PageOptionsGameAdv.GUI.widget_crosshair_bg
    local line = UI.PageOptionsGameAdv.GUI.widget_crosshair_up
    local x,y,xsize,ysize,xcent,ycent,shift = 0,0,0,0,0,0,0
    shift = UI.PageOptionsGameAdv.shift
    xcent = bg.left + 57
    ycent = bg.top + 50
    x = xcent-tonumber(hud_crosshair_thickness)*0.5
    y = ycent-tonumber(hud_crosshair_spacing)-shift-tonumber(hud_crosshair_thickness)*0.5 - (tonumber(hud_crosshair_length))
    xsize = tonumber(hud_crosshair_thickness)
    ysize = tonumber(hud_crosshair_length)
    x = ceil(x)
    y = ceil(y)
    xsize = ceil(xsize)
    ysize = ceil(ysize)
    local rect = x..","..y..","..xsize..","..ysize
    line:SetRect(rect)
end



function UI.PageOptionsGameAdv.GUI:UpdateDownLine()
    local bg = UI.PageOptionsGameAdv.GUI.widget_crosshair_bg
    local line = UI.PageOptionsGameAdv.GUI.widget_crosshair_down
    local x,y,xsize,ysize,xcent,ycent,shift = 0,0,0,0,0,0,0
    shift = UI.PageOptionsGameAdv.shift - 1
    xcent = bg.left + 57
    ycent = bg.top + 50
    x = xcent-tonumber(hud_crosshair_thickness)*0.5
    y = ycent+tonumber(hud_crosshair_spacing)+shift + tonumber(hud_crosshair_thickness)-tonumber(hud_crosshair_thickness)*0.5
    xsize = tonumber(hud_crosshair_thickness)
    ysize = tonumber(hud_crosshair_length)
    x = ceil(x)
    y = ceil(y)
    xsize = ceil(xsize)
    ysize = ceil(ysize)
    local rect = x..","..y..","..xsize..","..ysize
    line:SetRect(rect)
end

function UI.PageOptionsGameAdv.GUI:UpdateLeftLine()
    local bg = UI.PageOptionsGameAdv.GUI.widget_crosshair_bg
    local line = UI.PageOptionsGameAdv.GUI.widget_crosshair_left
    local x,y,xsize,ysize,xcent,ycent,shift = 0,0,0,0,0,0,0
    shift = UI.PageOptionsGameAdv.shift
    xcent = bg.left + 57
    ycent = bg.top + 50
    x = xcent-tonumber(hud_crosshair_spacing)-shift-tonumber(hud_crosshair_thickness)*0.5 - tonumber(hud_crosshair_length)
    y = ycent-tonumber(hud_crosshair_thickness)*0.5
    xsize = tonumber(hud_crosshair_length)
    ysize = tonumber(hud_crosshair_thickness)
    x = ceil(x)
    y = ceil(y)
    xsize = ceil(xsize)
    ysize = ceil(ysize)
    local rect = x..","..y..","..xsize..","..ysize
    line:SetRect(rect)
end

function UI.PageOptionsGameAdv.GUI:UpdateRightLine()
    local bg = UI.PageOptionsGameAdv.GUI.widget_crosshair_bg
    local line = UI.PageOptionsGameAdv.GUI.widget_crosshair_right
    local x,y,xsize,ysize,xcent,ycent,shift = 0,0,0,0,0,0,0
    shift = UI.PageOptionsGameAdv.shift -1
    xcent = bg.left + 57
    ycent = bg.top + 50
    x = xcent+tonumber(hud_crosshair_spacing)+shift + tonumber(hud_crosshair_thickness)-tonumber(hud_crosshair_thickness)*0.5 --xcent+tonumber(hud_crosshair_spacing)+shift+tonumber(hud_crosshair_thickness)*0.5
    y = ycent-tonumber(hud_crosshair_thickness) * 0.5


    xsize = tonumber(hud_crosshair_length)
    ysize = tonumber(hud_crosshair_thickness)
    x = ceil(x)
    y = ceil(y)
    xsize = ceil(xsize)
    ysize = ceil(ysize)
    local rect = x..","..y..","..xsize..","..ysize
    line:SetRect(rect)
end

function UI.PageOptionsGameAdv.GUI:UpdateDot()
    local bg = UI.PageOptionsGameAdv.GUI.widget_crosshair_bg
    local line = UI.PageOptionsGameAdv.GUI.widget_crosshair_dot
    local x,y,xsize,ysize,xcent,ycent,shift = 0,0,0,0,0,0,0
    shift = 3
    xcent = bg.left + 57
    ycent = bg.top + 50
    x = xcent-tonumber(hud_crosshair_thickness)*0.5
    y = ycent-tonumber(hud_crosshair_thickness)*0.5
    xsize = tonumber(hud_crosshair_thickness)
    ysize = tonumber(hud_crosshair_thickness)
    x = ceil(x)
    y = ceil(y)
    xsize = ceil(xsize)
    ysize = ceil(ysize)
    local rect = x..","..y..","..xsize..","..ysize
    line:SetRect(rect)
end

function UI.PageOptionsGameAdv.GUI:DrawCrosshair()
    UI.PageOptionsGameAdv.GUI:UpdateColors()
    if tonumber(hud_crosshair_tlike) == 1 then
        UI.PageOptionsGameAdv.GUI.widget_crosshair_up:SetRect("0,0,0,0")
    else
        UI.PageOptionsGameAdv.GUI:UpdateUpLine()
    end 
    UI.PageOptionsGameAdv.GUI:UpdateDownLine()
    UI.PageOptionsGameAdv.GUI:UpdateLeftLine()
    UI.PageOptionsGameAdv.GUI:UpdateRightLine()
    if tonumber(hud_crosshair_dot) == 0 then
        UI.PageOptionsGameAdv.GUI.widget_crosshair_dot:SetRect("0,0,0,0")
    else
        UI.PageOptionsGameAdv.GUI:UpdateDot()
    end 
    if UI.PageOptionsGameAdv.GUI.shiftanimated == 1 then
        UI.PageOptionsGameAdv.shift = 13 + sin(_time) * 10
    else
        UI.PageOptionsGameAdv.shift = 3
    end
end
function UI.PageOptionsGameAdv.GUI:UpdateColors()
    local chcolor = ""
    if UI.PageOptionsGameAdv.chcolormode == 1 then
        chcolor = ""..tostring(floor(hud_crosshair_color_r * 255)).." "..tostring(floor(hud_crosshair_color_g * 255)).." "..tostring(floor(hud_crosshair_color_b * 255)).." 255"
    else
        chcolor = ""..tostring(floor(hud_crosshair_hit_color_r * 255)).." "..tostring(floor(hud_crosshair_hit_color_g * 255)).." "..tostring(floor(hud_crosshair_hit_color_b * 255)).." 255"
    end
    UI.PageOptionsGameAdv.GUI.widget_crosshair_left:SetColor(chcolor)
    UI.PageOptionsGameAdv.GUI.widget_crosshair_right:SetColor(chcolor)
    UI.PageOptionsGameAdv.GUI.widget_crosshair_up:SetColor(chcolor)
    UI.PageOptionsGameAdv.GUI.widget_crosshair_down:SetColor(chcolor)
    UI.PageOptionsGameAdv.GUI.widget_crosshair_dot:SetColor(chcolor)
end

function UI.PageOptionsGameAdv.GUI:SelectCHMode()
    local cr,cg,cb = UI.PageOptionsGameAdv.GUI.chcolorr,UI.PageOptionsGameAdv.GUI.chcolorg,UI.PageOptionsGameAdv.GUI.chcolorb
    local chcolormode = UI.PageOptionsGameAdv.GUI.chcolormode:GetSelectionIndex()
    UI.PageOptionsGameAdv.chcolormode = chcolormode
    if chcolormode == 1 then
        cr:SetValue(tonumber(getglobal("hud_crosshair_color_r")))
        cg:SetValue(tonumber(getglobal("hud_crosshair_color_g")))
        cb:SetValue(tonumber(getglobal("hud_crosshair_color_b")))
    else
        cr:SetValue(tonumber(getglobal("hud_crosshair_hit_color_r")))
        cg:SetValue(tonumber(getglobal("hud_crosshair_hit_color_g")))
        cb:SetValue(tonumber(getglobal("hud_crosshair_hit_color_b")))
    end
end

function UI.PageOptionsGameAdv.GUI:OnActivate()
    local cr,cg,cb = UI.PageOptionsGameAdv.GUI.chcolorr,UI.PageOptionsGameAdv.GUI.chcolorg,UI.PageOptionsGameAdv.GUI.chcolorb

    local chcolormode = UI.PageOptionsGameAdv.GUI.chcolormode
    chcolormode:Clear()
    chcolormode:AddItem("@CHColorDefault")
    chcolormode:AddItem("@CHColorOnHit")
    chcolormode:SelectIndex(1)
    UI.PageOptionsGameAdv.GUI:SelectCHMode()
    UI.PageOptionsGameAdv.GUI.ch_tlike:SetChecked(hud_crosshair_tlike)
    UI.PageOptionsGameAdv.GUI.ch_dot:SetChecked(hud_crosshair_dot)
    UI.PageOptionsGameAdv.GUI.ch_static:SetChecked(hud_crosshair_static)
    UI.PageOptionsGameAdv.GUI.ch_thickness:SetValue(hud_crosshair_thickness / 3)
    UI.PageOptionsGameAdv.GUI.ch_length:SetValue(hud_crosshair_length / 15)
    UI.PageOptionsGameAdv.GUI.ch_spacing:SetValue(hud_crosshair_spacing / 5)
    UI.PageOptionsGameAdv.GUI.pfov:SetText(tostring(getglobal("p_fov")))
end


function UI.PageOptionsGameAdv.GetCHColor()
    local r,g,b
    r = UI.PageOptionsGameAdv.GUI.chcolorr:GetValue()
    g = UI.PageOptionsGameAdv.GUI.chcolorg:GetValue()
    b = UI.PageOptionsGameAdv.GUI.chcolorb:GetValue()
    return r,g,b
end

function UI.PageOptionsGameAdv.SetCHColor()
    local r,g,b = UI.PageOptionsGameAdv.GetCHColor()
    if UI.PageOptionsGameAdv.chcolormode == 1 then
        setglobal("hud_crosshair_color_r",r)
        setglobal("hud_crosshair_color_g",g)
        setglobal("hud_crosshair_color_b",b)
    else
        setglobal("hud_crosshair_hit_color_r",r)
        setglobal("hud_crosshair_hit_color_g",g)
        setglobal("hud_crosshair_hit_color_b",b)
    end
end

function UI.PageOptionsGameAdv.HSVToRGB( hue, saturation, value )
    -- Returns the RGB equivalent of the given HSV-defined color
    -- (adapted from some code found around the web)

    -- If it's achromatic, just return the value
    if saturation == 0 then
        return value;
    end;

    -- Get the hue sector
    local hue_sector = floor( hue / 60 );
    local hue_sector_offset = ( hue / 60 ) - hue_sector;

    local p = value * ( 1 - saturation );
    local q = value * ( 1 - saturation * hue_sector_offset );
    local t = value * ( 1 - saturation * ( 1 - hue_sector_offset ) );

    if hue_sector == 0 then
        return value, t, p;
    elseif hue_sector == 1 then
        return q, value, p;
    elseif hue_sector == 2 then
        return p, value, t;
    elseif hue_sector == 3 then
        return p, q, value;
    elseif hue_sector == 4 then
        return t, p, value;
    elseif hue_sector == 5 then
        return value, p, q;
    end;
end;

AddUISideMenu(UI.PageOptionsGameAdv.GUI,
{
    { "MainMenu", Localize("MainMenu"), "$MainScreen$", 0},
});
UI:CreateScreenFromTable( "GameAdvOptions", UI.PageOptionsGameAdv.GUI );
