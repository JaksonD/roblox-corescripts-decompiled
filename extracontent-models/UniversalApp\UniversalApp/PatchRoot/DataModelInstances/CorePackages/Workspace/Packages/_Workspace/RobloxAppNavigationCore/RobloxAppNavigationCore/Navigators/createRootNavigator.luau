local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.RoactNavigation);
local _ = require(l_Parent_0.Navigation);
local v3 = require(l_Parent_0.NavigationRodux);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v5 = require(script.Parent.createAdaptiveStackNavigator);
local v6 = require(script.Parent.createMainSwitchNavigator);
local v7 = game:DefineFastString("RootNavigatorInitialRouteName", (tostring(l_AppPage_0.PlatformAccountRouter)));
local function v8() --[[ Line: 17 ]]
    return {
        transitionSpec = {
            frequency = 1000000, 
            dampingRatio = 1
        }
    };
end;
return function(v9, v10) --[[ Line: 30 ]] --[[ Name: createRootNavigator ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy), v7 (copy), v1 (copy), v8 (copy)
    local v11 = {};
    for v12, v13 in v10 do
        v11[v13] = v12;
    end;
    local v14 = {};
    local v15 = {};
    for _, v17 in v9 do
        if v11[next(v17)] ~= nil then
            table.insert(v14, v17);
        else
            table.insert(v15, v17);
        end;
    end;
    table.sort(v14, function(v18, v19) --[[ Line: 53 ]]
        -- upvalues: v11 (copy)
        local v20 = next(v18);
        local v21 = next(v19);
        return v11[v20] < v11[v21];
    end);
    table.insert(v15, {
        [v3.Constants.TempRnSwitchNavigatorName] = v6(v14)
    });
    return v5(v15, {
        initialRouteName = v7, 
        mode = v1.StackPresentationStyle.Overlay, 
        transitionConfig = v8, 
        defaultNavigationOptions = {
            absorbInputSelectable = false, 
            overlayTransparency = 0.3
        }
    });
end;