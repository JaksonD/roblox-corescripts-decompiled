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
local v19 = require(l_Parent_1.Flags.FFlagAlwaysSelectButtonDismissesGamepadNavigationDialog);
local v20 = require(l_Parent_1.Flags.GetFIntGamepadNavigationDialogShowCount);
local v21 = require(l_Parent_1.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux);
local function v27(_) --[[ Line: 33 ]] --[[ Name: GamepadNavigationDialogContainer ]]
    -- upvalues: v5 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), v12 (copy), v18 (copy), v19 (copy), v20 (copy)
    local v23, v24 = v5.useState(false);
    v5.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: l_UserInputService_0 (ref), v24 (copy), l_GuiService_0 (ref)
        local v25 = nil;
        local function v26() --[[ Line: 38 ]] --[[ Name: disconnectGamepadConnected ]]
            -- upvalues: v25 (ref)
            if v25 then
                v25:Disconnect();
                v25 = nil;
            end;
        end;
        if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
            v24(true);
        else
            v25 = l_UserInputService_0.GamepadConnected:Connect(function() --[[ Line: 48 ]]
                -- upvalues: v24 (ref), v25 (ref)
                v24(true);
                if v25 then
                    v25:Disconnect();
                    v25 = nil;
                end;
            end);
        end;
        l_GuiService_0:GetPropertyChangedSignal("MenuIsOpen"):Connect(v26);
        return v26;
    end, {});
    if v23 then
        return (v5.createElement(v12, {
            isGamepadNavigationDialogEnabled = v18, 
            selectButtonDismissesGamepadNavigationDialog = v19, 
            appStorageKey = "GamepadMenuVirtualCursorPromptShown", 
            maxShownCount = v20(), 
            isGamepadNavigationDialogOpen = v23, 
            SetGamepadNavigationDialogOpen = v24
        }));
    else
        return nil;
    end;
end;
local v28 = v17();
local v32 = v10.connectUserLayer({
    v28
}, function(v29, _) --[[ Line: 74 ]]
    -- upvalues: v28 (copy), v18 (copy), v19 (copy), v20 (copy)
    local v31 = v29[v28] or {};
    return {
        isGamepadNavigationDialogEnabled = v18 or v31.isGamepadNavigationDialogEnabled, 
        selectButtonDismissesGamepadNavigationDialog = v19 or v31.selectButtonDismissesGamepadNavigationDialog, 
        appStorageKey = "GamepadMenuVirtualCursorPromptShown", 
        maxShownCount = v20()
    };
end)(v12);
if v21 then
    return v27;
else
    return v7.connect(function(v33) --[[ Line: 90 ]]
        return {
            isGamepadNavigationDialogOpen = v33.displayOptions.isGamepadNavigationDialogOpen
        };
    end, function(v34) --[[ Line: 94 ]]
        -- upvalues: v16 (copy)
        return {
            SetGamepadNavigationDialogOpen = function(v35) --[[ Line: 96 ]] --[[ Name: SetGamepadNavigationDialogOpen ]]
                -- upvalues: v34 (copy), v16 (ref)
                return v34(v16(v35));
            end
        };
    end)(v32);
end;