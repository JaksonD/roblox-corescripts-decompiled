local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v8 = {
    [v3.AvatarExperienceWrapper] = true, 
    [v3.AvatarExperienceWrapperTransparent] = true
};
local function v14(v9) --[[ Line: 25 ]] --[[ Name: buildHistoryFromRoute ]]
    local v10 = {};
    for v11 = 1, #v9 do
        local v12 = {};
        for v13 = 1, v11 do
            table.insert(v12, v9[v13]);
        end;
        table.insert(v10, v12);
    end;
    return v10;
end;
local function _(v15) --[[ Line: 37 ]] --[[ Name: getPageName ]]
    -- upvalues: v3 (copy)
    local l_name_0 = v15.name;
    if l_name_0 == v3.AvatarExperienceWrapper or l_name_0 == v3.AvatarExperienceWrapperTransparent then
        l_name_0 = v15.extraProps and v15.extraProps.routeName or nil;
    end;
    return l_name_0;
end;
local function v29(v18, v19) --[[ Line: 45 ]] --[[ Name: closeAppRouterPages ]]
    -- upvalues: v2 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v3 (copy), v14 (copy), v4 (copy)
    local v20 = v2.List.toSet(v19);
    local v21 = v18:getState();
    local v22 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v21) else v21.Navigation.history[#v21.Navigation.history];
    local v23 = {};
    local v24 = false;
    for v25 = 1, #v22 do
        local v26 = v22[v25];
        local l_name_1 = v26.name;
        if l_name_1 == v3.AvatarExperienceWrapper or l_name_1 == v3.AvatarExperienceWrapperTransparent then
            l_name_1 = v26.extraProps and v26.extraProps.routeName or nil;
        end;
        if v20[l_name_1] then
            v24 = true;
        else
            table.insert(v23, v22[v25]);
        end;
    end;
    if not v24 then
        return;
    else
        local v28 = v14(v23);
        v18:dispatch(v4(nil, v28));
        return;
    end;
end;
local function _(v30) --[[ Line: 71 ]] --[[ Name: getCurrentAppRouterPageName ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v31 = v30:getState();
    local v32 = nil;
    if l_FFlagUseNavigationSelectors_0 then
        v32 = l_Selectors_0.selectCurrentLegacyPage(v31);
    else
        local v33 = v31.Navigation.history[#v31.Navigation.history];
        v32 = v33[#v33];
    end;
    return v32.name;
end;
return function(v35, v36) --[[ Line: 83 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v8 (copy), v29 (copy), v5 (copy)
    return function(v37) --[[ Line: 84 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), v8 (ref), v29 (ref), v36 (copy), v35 (copy), v5 (ref)
        local v38 = v37:getState();
        local v39 = nil;
        if l_FFlagUseNavigationSelectors_0 then
            v39 = l_Selectors_0.selectCurrentLegacyPage(v38);
        else
            local v40 = v38.Navigation.history[#v38.Navigation.history];
            v39 = v40[#v40];
        end;
        if v8[v39.name] then
            v29(v37, v36);
            return;
        else
            v35.dispatch(v5.clearScreens(v36));
            return;
        end;
    end;
end;