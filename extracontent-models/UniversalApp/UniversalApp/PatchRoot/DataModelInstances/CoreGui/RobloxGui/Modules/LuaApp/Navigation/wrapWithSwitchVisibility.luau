local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.LuaApp.AppPageProperties);
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.LuaApp.Navigation.SwitchNavigatorVisibleContext);
local function v8(v6) --[[ Line: 22 ]] --[[ Name: firstOpaqueIndex ]]
    -- upvalues: v3 (copy)
    for v7 = #v6, 1, -1 do
        if not (v3[v6[v7].routeName] or {}).renderUnderlyingPage then
            return v7;
        end;
    end;
    return 1;
end;
local function _(v9, v10) --[[ Line: 35 ]] --[[ Name: indexOfRoute ]]
    for v11, v12 in ipairs(v9) do
        if v12.routeName == v10 then
            return v11;
        end;
    end;
    return 0;
end;
return function(v14) --[[ Line: 44 ]] --[[ Name: wrapWithSwitchVisibility ]]
    -- upvalues: v2 (copy), v4 (copy), v8 (copy), v5 (copy)
    local v15 = v2.Component:extend("rootNavigatorWrapper");
    v15.render = function(v16) --[[ Line: 47 ]] --[[ Name: render ]]
        -- upvalues: v4 (ref), v8 (ref), v2 (ref), v5 (ref), v14 (copy)
        local v17 = false;
        local l_routes_0 = v16.props.navigation.state.routes;
        local l_TempRnSwitchNavigatorName_0 = v4.TempRnSwitchNavigatorName;
        local v20;
        for v21, v22 in ipairs(l_routes_0) do
            if v22.routeName == l_TempRnSwitchNavigatorName_0 then
                v20 = v21;
                v17 = true;
            end;
            if v17 then
                break;
            end;
        end;
        if not v17 then
            v20 = 0;
        end;
        v17 = false;
        local v23 = v8(l_routes_0) <= v20;
        return v2.createElement(v5.Provider, {
            value = v23
        }, {
            Navigator = v2.createElement(v14, v16.props)
        });
    end;
    v15.router = v14.router;
    return v15;
end;