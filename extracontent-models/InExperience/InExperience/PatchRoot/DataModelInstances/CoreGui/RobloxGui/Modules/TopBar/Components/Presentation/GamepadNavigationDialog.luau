local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("AppStorageService");
local _ = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local v10 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local _ = v9.Core.Style.withStyle;
local v12 = require(script.GamepadNavigationDialogShowCounter);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Parent.Actions;
local v16 = require(l_Actions_0.SetGamepadNavigationDialogOpen);
local v17 = require(l_Parent_1.Flags.GetFStringGamepadNavigationDialogABTestLayerName);
local v18 = require(l_Parent_1.Flags.FFlagAlwaysShowGamepadNavigationDialog);
local v19 = require(l_Parent_1.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux);
local function v25(_) --[[ Line: 31 ]] --[[ Name: GamepadNavigationDialogContainer ]]
    -- upvalues: v5 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), v12 (copy), v18 (copy)
    local v21, v22 = v5.useState(false);
    v5.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: l_UserInputService_0 (ref), v22 (copy), l_GuiService_0 (ref)
        local v23 = nil;
        local function v24() --[[ Line: 36 ]] --[[ Name: disconnectGamepadConnected ]]
            -- upvalues: v23 (ref)
            if v23 then
                v23:Disconnect();
                v23 = nil;
            end;
        end;
        if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
            v22(true);
        else
            v23 = l_UserInputService_0.GamepadConnected:Connect(function() --[[ Line: 46 ]]
                -- upvalues: v22 (ref), v23 (ref)
                v22(true);
                if v23 then
                    v23:Disconnect();
                    v23 = nil;
                end;
            end);
        end;
        l_GuiService_0:GetPropertyChangedSignal("MenuIsOpen"):Connect(v24);
        return v24;
    end, {});
    if v21 then
        return (v5.createElement(v12, {
            isGamepadNavigationDialogEnabled = v18, 
            selectButtonDismissesGamepadNavigationDialog = false, 
            appStorageKey = "GamepadMenuVirtualCursorPromptShown", 
            maxShownCount = 1, 
            isGamepadNavigationDialogOpen = v21, 
            SetGamepadNavigationDialogOpen = v22
        }));
    else
        return nil;
    end;
end;
local v26 = v17();
local v30 = v10.connectUserLayer({
    v26
}, function(v27, _) --[[ Line: 72 ]]
    -- upvalues: v26 (copy), v18 (copy)
    local v29 = v27[v26] or {};
    return {
        isGamepadNavigationDialogEnabled = v18 or v29.isGamepadNavigationDialogEnabled, 
        selectButtonDismissesGamepadNavigationDialog = v29.selectButtonDismissesGamepadNavigationDialog, 
        appStorageKey = "GamepadMenuVirtualCursorPromptShown", 
        maxShownCount = 1
    };
end)(v12);
if v19 then
    return v25;
else
    return v7.connect(function(v31) --[[ Line: 87 ]]
        return {
            isGamepadNavigationDialogOpen = v31.displayOptions.isGamepadNavigationDialogOpen
        };
    end, function(v32) --[[ Line: 91 ]]
        -- upvalues: v16 (copy)
        return {
            SetGamepadNavigationDialogOpen = function(v33) --[[ Line: 93 ]] --[[ Name: SetGamepadNavigationDialogOpen ]]
                -- upvalues: v32 (copy), v16 (ref)
                return v32(v16(v33));
            end
        };
    end)(v30);
end;