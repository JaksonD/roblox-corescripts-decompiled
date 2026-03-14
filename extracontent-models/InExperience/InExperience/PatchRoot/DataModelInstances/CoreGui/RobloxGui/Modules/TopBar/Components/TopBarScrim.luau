local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Signals);
local v3 = require(l_CorePackages_0.Packages.SignalsReact);
local v4 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon);
local v5 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v6 = require(script.Parent.GamepadConnector);
local l_Scrim_0 = v4.Scrim;
local function v11() --[[ Line: 13 ]] --[[ Name: createComputedScrimVisible ]]
    -- upvalues: v2 (copy), v6 (copy), v5 (copy)
    return v2.createComputed(function(v8) --[[ Line: 14 ]]
        -- upvalues: v6 (ref), v5 (ref)
        local v9 = v6:topBarFocused(v8);
        local v10 = v5.Stores.GetFocusNavigationStore(v8);
        return v9 or v10.getChatInputBarFocused(v8);
    end);
end;
return v1.memo(function() --[[ Line: 21 ]] --[[ Name: TopBarScrim ]]
    -- upvalues: v3 (copy), v11 (copy), v1 (copy), l_Scrim_0 (copy)
    local v12 = v3.useSignalBinding(v11());
    return v1.createElement(l_Scrim_0, {
        Visible = v12
    });
end);