local l_VRService_0 = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v7 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v8 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_Parent_0 = script.Parent;
local v10 = require(l_Parent_0.Flags.FFlagPlayerListPersistVisibility);
local v11 = require(l_Parent_0.Flags.FStringPlayerListOverrideType);
local l_FFlagEnableMobilePlayerListOnConsole_0 = v8.Flags.FFlagEnableMobilePlayerListOnConsole;
local l_FFlagPlayerListUseMobileOnSmallDisplay_0 = v8.Flags.FFlagPlayerListUseMobileOnSmallDisplay;
local function v17() --[[ Line: 19 ]] --[[ Name: isSmallTouchScreen ]]
    -- upvalues: l_FFlagPlayerListUseMobileOnSmallDisplay_0 (copy), l_GuiService_0 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), l_UserInputService_0 (copy), v7 (copy), v11 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return false;
    else
        local v14 = if l_FFlagPlayerListUseMobileOnSmallDisplay_0 then l_GuiService_0.ViewportDisplaySize == Enum.DisplaySize.Small else false;
        local v15 = if l_FFlagEnableMobilePlayerListOnConsole_0 then l_GuiService_0.ViewportDisplaySize == Enum.DisplaySize.Large else false;
        local v16 = if not not l_FFlagEnableMobilePlayerListOnConsole_0 or l_FFlagPlayerListUseMobileOnSmallDisplay_0 then l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch or l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad else false;
        return v7:IsSmallTouchScreen() or l_FFlagEnableMobilePlayerListOnConsole_0 and v15 and v16 or l_FFlagPlayerListUseMobileOnSmallDisplay_0 and v14 and v16 or v11 == "mobile";
    end;
end;
return function() --[[ Line: 32 ]]
    -- upvalues: v17 (copy), l_VRService_0 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), v6 (copy), v10 (copy)
    local v18 = false;
    local v19 = not v17();
    if v19 then
        v19 = not l_VRService_0.VREnabled;
        if v19 then
            if not l_FFlagEnableMobilePlayerListOnConsole_0 then
                v19 = not v6:IsEnabled();
                v18 = not v19;
            end;
            if not v18 then
                if v10 then
                    return UserSettings().GameSettings.PlayerListVisible;
                else
                    v19 = true;
                end;
            end;
        end;
    end;
    v18 = false;
    return v19;
end;