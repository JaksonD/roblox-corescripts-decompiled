local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Signals);
local v3 = require(l_CorePackages_0.Packages.SignalsReact);
local v4 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon);
local v5 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local v6 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v7 = require(script.Parent.GamepadConnector);
local l_Scrim_0 = v4.Scrim;
local l_FFlagEnableUISelector_0 = v5.Flags.FFlagEnableUISelector;
local v10 = if l_FFlagEnableUISelector_0 then v5.Stores.GetUiSelectorSignalStore else nil;
local function v15() --[[ Line: 19 ]] --[[ Name: createComputedScrimVisible ]]
    -- upvalues: v2 (copy), v7 (copy), v6 (copy), l_FFlagEnableUISelector_0 (copy), v10 (copy)
    return v2.createComputed(function(v11) --[[ Line: 20 ]]
        -- upvalues: v7 (ref), v6 (ref), l_FFlagEnableUISelector_0 (ref), v10 (ref)
        local v12 = v7:topBarFocused(v11);
        local v13 = v6.Stores.GetFocusNavigationStore(v11).getChatInputBarFocused(v11);
        local v14 = l_FFlagEnableUISelector_0 and v10(v11).getVisibility(v11);
        return v12 or v13 or v14;
    end);
end;
return v1.memo(function() --[[ Line: 29 ]] --[[ Name: TopBarScrim ]]
    -- upvalues: v3 (copy), v15 (copy), v1 (copy), l_Scrim_0 (copy)
    local v16 = v3.useSignalBinding(v15());
    return v1.createElement(l_Scrim_0, {
        Visible = v16
    });
end);