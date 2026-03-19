local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions);
local v6 = {
    [v3.AvatarExperienceWrapper] = true, 
    [v3.AvatarExperienceWrapperTransparent] = true
};
local function v12(v7) --[[ Line: 23 ]] --[[ Name: buildHistoryFromRoute ]]
    local v8 = {};
    for v9 = 1, #v7 do
        local v10 = {};
        for v11 = 1, v9 do
            table.insert(v10, v7[v11]);
        end;
        table.insert(v8, v10);
    end;
    return v8;
end;
local function _(v13) --[[ Line: 35 ]] --[[ Name: getPageName ]]
    -- upvalues: v3 (copy)
    local l_name_0 = v13.name;
    if l_name_0 == v3.AvatarExperienceWrapper or l_name_0 == v3.AvatarExperienceWrapperTransparent then
        l_name_0 = v13.extraProps and v13.extraProps.routeName or nil;
    end;
    return l_name_0;
end;
local function v27(v16, v17) --[[ Line: 43 ]] --[[ Name: closeAppRouterPages ]]
    -- upvalues: v2 (copy), v3 (copy), v12 (copy), v4 (copy)
    local v18 = v2.List.toSet(v17);
    local l_history_0 = v16:getState().Navigation.history;
    local v20 = l_history_0[#l_history_0];
    local v21 = {};
    local v22 = false;
    for v23 = 1, #v20 do
        local v24 = v20[v23];
        local l_name_1 = v24.name;
        if l_name_1 == v3.AvatarExperienceWrapper or l_name_1 == v3.AvatarExperienceWrapperTransparent then
            l_name_1 = v24.extraProps and v24.extraProps.routeName or nil;
        end;
        if v18[l_name_1] then
            v22 = true;
        else
            table.insert(v21, v20[v23]);
        end;
    end;
    if not v22 then
        return;
    else
        local v26 = v12(v21);
        v16:dispatch(v4(nil, v26));
        return;
    end;
end;
local function _(v28) --[[ Line: 67 ]] --[[ Name: getCurrentAppRouterPageName ]]
    local l_history_1 = v28:getState().Navigation.history;
    local v30 = l_history_1[#l_history_1];
    return v30[#v30].name;
end;
return function(v32, v33) --[[ Line: 74 ]]
    -- upvalues: v6 (copy), v27 (copy), v5 (copy)
    return function(v34) --[[ Line: 75 ]]
        -- upvalues: v6 (ref), v27 (ref), v33 (copy), v32 (copy), v5 (ref)
        local l_history_2 = v34:getState().Navigation.history;
        local v36 = l_history_2[#l_history_2];
        if v6[v36[#v36].name] then
            v27(v34, v33);
            return;
        else
            v32.dispatch(v5.clearScreens(v33));
            return;
        end;
    end;
end;