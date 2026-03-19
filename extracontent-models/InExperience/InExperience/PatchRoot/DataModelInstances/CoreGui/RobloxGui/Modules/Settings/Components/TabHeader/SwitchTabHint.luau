local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ReactUtils);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Workspace.Packages.HelpPage);
local l_useEventConnection_0 = v3.useEventConnection;
local l_Icon_0 = v4.Icon;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_HELP_PAGE_0 = v5.Constants.HELP_PAGE;
local function _() --[[ Line: 19 ]] --[[ Name: isPreferredInputTypeGamepad ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad;
end;
local function _() --[[ Line: 23 ]] --[[ Name: isPlayStationGamepad ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross";
end;
return v2.memo(v2.forwardRef(function(v12, v13) --[[ Line: 28 ]] --[[ Name: SwitchTabHint ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_UserInputService_0 (copy), l_useEventConnection_0 (copy), l_HELP_PAGE_0 (copy), l_Icon_0 (copy)
    local v14 = l_useTokens_0();
    local v15, v16 = v2.useState(l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross");
    local v17, v18 = v2.useBinding(l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad);
    l_useEventConnection_0(l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"), function() --[[ Line: 32 ]]
        -- upvalues: v18 (copy), l_UserInputService_0 (ref), v16 (copy)
        v18(l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad);
        v16(l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross");
    end, {});
    local v19 = v2.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v15 (copy), l_HELP_PAGE_0 (ref), v12 (copy)
        if v15 then
            return l_HELP_PAGE_0.GAMEPAD_ICON_MAP_PLAYSTATION[v12.keycode];
        else
            return l_HELP_PAGE_0.GAMEPAD_ICON_MAP_XBOX[v12.keycode];
        end;
    end, {
        v12.keycode, 
        v15
    });
    return v2.createElement(l_Icon_0, {
        name = v19, 
        size = v14.Size.Size_800, 
        Visible = v17, 
        ref = v13
    });
end));