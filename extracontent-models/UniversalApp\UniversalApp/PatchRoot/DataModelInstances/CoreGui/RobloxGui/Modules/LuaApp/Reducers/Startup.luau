local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_1 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_HomePageDataStatus_0 = l_Modules_1.LuaApp.Reducers.HomePageDataStatus;
local l_FetchHomePageDataStatusAll_0 = l_Modules_1.LuaApp.Reducers.FetchHomePageDataStatusAll;
local l_GamesPageDataStatus_0 = l_Modules_1.LuaApp.Reducers.GamesPageDataStatus;
local v7 = require(l_Modules_0.LuaApp.Actions.SetPreloading);
local v8 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange;
local function _(v10) --[[ Line: 17 ]] --[[ Name: isRetrievalStatus ]]
    -- upvalues: v8 (copy)
    local v11 = true;
    if v10 ~= v8.NotStarted then
        v11 = true;
        if v10 ~= v8.Fetching then
            v11 = true;
            if v10 ~= v8.Failed then
                v11 = v10 == v8.Done;
            end;
        end;
    end;
    return v11;
end;
local function v17(v13, v14) --[[ Line: 24 ]] --[[ Name: joinRetrievalStatus ]]
    -- upvalues: v8 (copy)
    local l_v13_0 = v13;
    local v16 = true;
    if l_v13_0 ~= v8.NotStarted then
        v16 = true;
        if l_v13_0 ~= v8.Fetching then
            v16 = true;
            if l_v13_0 ~= v8.Failed then
                v16 = l_v13_0 == v8.Done;
            end;
        end;
    end;
    if not v16 then
        v13 = nil;
    end;
    l_v13_0 = v14;
    v16 = true;
    if l_v13_0 ~= v8.NotStarted then
        v16 = true;
        if l_v13_0 ~= v8.Fetching then
            v16 = true;
            if l_v13_0 ~= v8.Failed then
                v16 = l_v13_0 == v8.Done;
            end;
        end;
    end;
    if not v16 then
        v14 = nil;
    end;
    if v13 == nil then
        return v14;
    elseif v14 == nil then
        return v13;
    elseif v13 == v8.Failed or v14 == v8.Failed then
        return v8.Failed;
    elseif v13 == v8.NotStarted and v14 == v8.NotStarted then
        return v8.NotStarted;
    elseif v13 == v8.Done and v14 == v8.Done then
        return v8.Done;
    else
        return v8.Fetching;
    end;
end;
return function(v18, v19) --[[ Line: 49 ]]
    -- upvalues: l_GamesPageDataStatus_0 (copy), l_HomePageDataStatus_0 (copy), l_FetchHomePageDataStatusAll_0 (copy), v7 (copy), v2 (copy), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy), v17 (copy)
    v18 = v18 or {};
    local v20 = l_GamesPageDataStatus_0(v18.GamesPageDataStatus, v19);
    local v21 = l_HomePageDataStatus_0(v18.HomePageDataStatus, v19);
    local v22 = l_FetchHomePageDataStatusAll_0(v18.FetchHomePageDataStatusAll, v19);
    local v23 = v18.Preloading == nil or v18.Preloading;
    if v19.type == v7.name then
        v23 = v19.isPreloading;
    end;
    local v24 = v2.List.foldLeft({
        if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v20.status else v20, 
        v21, 
        v22
    }, v17);
    return {
        GamesPageDataStatus = v20, 
        HomePageDataStatus = v21, 
        FetchHomePageDataStatusAll = v22, 
        Preloading = v23, 
        AppDataStatus = v24
    };
end;