local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.SetNavigationLocked);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.RoactNavigation);
local v5 = require(l_Modules_0.LuaApp.Thunks.RNAdapterThunk);
local v6 = require(l_Modules_0.LuaApp.FlagSettings);
local v7 = require(l_Modules_0.LuaApp.Constants);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local function v9() --[[ Line: 13 ]] --[[ Name: getDefaultRoute ]]
    -- upvalues: v6 (copy)
    return {
        {
            name = v6.GetDefaultAppPage(), 
            rnKey = v6.GetDefaultAppPage()
        }
    };
end;
local _, v11 = require(l_Modules_0.LuaApp.Components.AppNav.GetIABottomBarItems)();
return function(v12, v13) --[[ Line: 25 ]]
    -- upvalues: v5 (copy), v9 (copy), v4 (copy), v3 (copy), v11 (copy), v7 (copy), v2 (copy)
    return v5.new("ResetNavigationHistory", function(v14, v15) --[[ Line: 26 ]]
        -- upvalues: v12 (copy), v13 (copy), v9 (ref), v4 (ref), v3 (ref), v11 (ref), v7 (ref), v2 (ref)
        local l_v12_0 = v12;
        if v13 ~= nil then
            l_v12_0 = v13[#v13];
        end;
        if l_v12_0 == nil or #l_v12_0 == 0 then
            l_v12_0 = v9();
        end;
        assert(l_v12_0, "not nil");
        local v17 = {};
        for _, v19 in ipairs(l_v12_0) do
            local v20 = v4.Actions.navigate({
                routeName = v19.name, 
                params = v3.Dictionary.join(v19, {
                    name = v3.None, 
                    rnKey = v3.None
                }), 
                key = v19.rnKey
            });
            if v11[v19.name] ~= nil then
                table.insert(v17, v4.Actions.navigate({
                    routeName = v7.TempRnSwitchNavigatorName, 
                    action = v20, 
                    key = v7.TempRnSwitchNavigatorName
                }));
            else
                table.insert(v17, v20);
            end;
        end;
        v14:dispatch(v2(true));
        v15(v4.StackActions.reset({
            index = #v17, 
            actions = v17
        }));
    end);
end;