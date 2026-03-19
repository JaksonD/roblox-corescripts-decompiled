local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.LuaApp.ArgCheck);
local v8 = v1.Component:extend("RobuxEventReceiver");
v8.init = function(v9) --[[ Line: 14 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy)
    v9.isMounted = false;
    local l_RobloxEventReceiver_0 = v9.props.RobloxEventReceiver;
    v9.updateRobux = function() --[[ Line: 19 ]]
        -- upvalues: v9 (copy), v7 (ref)
        local l_localUserId_0 = v9.props.localUserId;
        local l_requestRobuxInfo_0 = v9.props.requestRobuxInfo;
        local l_networking_0 = v9.props.networking;
        v7.isNonEmptyString(l_localUserId_0, "RobuxEventReceiver.updateRobux.localUserId");
        if typeof(l_localUserId_0) == "string" and l_localUserId_0 ~= "" then
            l_requestRobuxInfo_0(l_networking_0, l_localUserId_0);
        end;
    end;
    v9.tokens = {
        l_RobloxEventReceiver_0:observeEvent("AppInput", function(_, v15) --[[ Line: 35 ]]
            -- upvalues: v9 (copy)
            if v15 == "Focused" then
                delay(3, function() --[[ Line: 37 ]]
                    -- upvalues: v9 (ref)
                    if not v9.isMounted then
                        return;
                    else
                        v9.updateRobux();
                        return;
                    end;
                end);
            end;
        end)
    };
end;
v8.render = function(v16) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    return v1.oneChild(v16.props[v1.Children]);
end;
v8.didMount = function(v17) --[[ Line: 52 ]] --[[ Name: didMount ]]
    v17.isMounted = true;
end;
v8.willUnmount = function(v18) --[[ Line: 56 ]] --[[ Name: willUnmount ]]
    for _, v20 in pairs(v18.tokens) do
        v20:disconnect();
    end;
    v18.isMounted = false;
end;
v8 = v2.connect(function(v21, _) --[[ Line: 63 ]]
    return {
        localUserId = v21.LocalUserId
    };
end, function(v23) --[[ Line: 67 ]]
    -- upvalues: v4 (copy)
    return {
        requestRobuxInfo = function(v24, v25) --[[ Line: 69 ]] --[[ Name: requestRobuxInfo ]]
            -- upvalues: v23 (copy), v4 (ref)
            return v23(v4(v24, v25, true));
        end
    };
end)(v8);
return l_RoactServices_0.connect({
    networking = v6
})(v8);