local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.InputUi);
local l_GamepadDisconnectedModal_0 = v4.Gamepad.GamepadDisconnectedModal;
local l_useGamepadDisconnectOverlayEffect_0 = v4.Gamepad.useGamepadDisconnectOverlayEffect;
local v7 = require(l_CoreGui_0.RobloxGui.Modules.InGameMenuConstants);
local v8 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
return function() --[[ Line: 14 ]] --[[ Name: CoreScriptsGamepadDisconnectListener ]]
    -- upvalues: v3 (copy), l_useGamepadDisconnectOverlayEffect_0 (copy), v8 (copy), v7 (copy), l_GamepadDisconnectedModal_0 (copy)
    local v9, v10 = v3.useState(false);
    local v11 = v3.useCallback(function() --[[ Line: 16 ]]
        -- upvalues: v10 (copy)
        v10(false);
    end, {
        v10
    });
    local v12 = v3.useCallback(function() --[[ Line: 19 ]]
        -- upvalues: v10 (copy)
        v10(true);
    end, {
        v10
    });
    l_useGamepadDisconnectOverlayEffect_0(v12, v11, v8, "InExperience");
    if v9 then
        return v3.createElement("ScreenGui", {
            DisplayOrder = v7.DisplayOrder.HeadsetDisconnectedDialog, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            GamepadDisconnectedModal = v3.createElement(l_GamepadDisconnectedModal_0)
        });
    else
        return nil;
    end;
end;