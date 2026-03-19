local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v7 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local v8 = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCatalogSort);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return function() --[[ Line: 52 ]] --[[ Name: useSortsController ]]
    -- upvalues: v5 (copy), v6 (copy), l_useSelector_0 (copy), v10 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), l_useDispatch_0 (copy), v7 (copy), v8 (copy), v9 (copy)
    local _ = v5(v6);
    local v13 = l_useSelector_0(v10.selectCatalogSort, l_getUseSelectorDeepEquals_0());
    local v14 = l_useSelector_0(v10.selectCatalogSortAggregation, l_getUseSelectorDeepEquals_0());
    local v15, v16 = v2.useState(v13);
    local v17, v18 = v2.useState(v14);
    local v19, v20 = v2.useState(v14);
    local v21 = l_useDispatch_0();
    local v22 = v15 ~= v7.Relevance;
    local v23 = true;
    if v15 == v13 then
        v23 = v15 == v7.MostFavorited and v17 ~= v14 or v15 == v7.Bestselling and v19 ~= v14;
    end;
    local v24 = v2.useCallback(function() --[[ Line: 72 ]]
        -- upvalues: v16 (copy), v7 (ref), v18 (copy), v8 (ref), v20 (copy)
        v16(v7.Relevance);
        v18(v8.AllTime);
        v20(v8.AllTime);
    end);
    local v26 = v2.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v8 (ref), v15 (copy), v7 (ref), v17 (copy), v19 (copy), v21 (copy), v9 (ref)
        local l_AllTime_0 = v8.AllTime;
        if v15 == v7.MostFavorited then
            l_AllTime_0 = v17;
        elseif v15 == v7.Bestselling then
            l_AllTime_0 = v19;
        end;
        v21(v9(v15, l_AllTime_0));
    end, {
        v15, 
        v17, 
        v19
    });
    return {
        sortType = v15, 
        setSortType = v16, 
        mostFavoritedAggregation = v17, 
        setMostFavoritedAggregation = v18, 
        bestSellingAggregation = v19, 
        setBestSellingAggregation = v20, 
        canReset = v22, 
        canApply = v23, 
        reset = v24, 
        apply = v26
    };
end;