local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.AXCommon);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_AvatarScreen_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.AvatarScreen;
local v9 = require(l_Parent_0.IxpUtils);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v12 = require(l_script_FirstAncestor_0.Enums.SearchLandingPageWidgetEnum);
local v13 = require(l_script_FirstAncestor_0.Enums.Counter);
local v14 = require(l_script_FirstAncestor_0.Utils.RecentlyViewedSearchItemsAppStorage);
local l_findItemInTryOnItems_0 = v5.Utils.findItemInTryOnItems;
local v16 = require(l_script_FirstAncestor_0.Flags.GetFIntAXMaxRecentlyViewedSearchItemsInCarousel);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v5.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local function v19(v18) --[[ Line: 50 ]]
    return v18.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v21(v20) --[[ Line: 54 ]]
    return v20.AvatarExperience.Common;
end;
local function _(v22, v23) --[[ Line: 58 ]]
    -- upvalues: l_findItemInTryOnItems_0 (copy)
    return v23 and l_findItemInTryOnItems_0(v22, v23) ~= nil;
end;
local function _(v25, v26, v27) --[[ Line: 62 ]]
    local v28 = nil;
    if v27 == "Asset" then
        v28 = v25.AssetInfos[v26];
    elseif v27 == "Bundle" then
        v28 = v25.BundleInfos[v26];
    end;
    if v28 then
        v28 = table.clone(v28);
    end;
    return v28;
end;
local function v32(v30) --[[ Line: 76 ]]
    -- upvalues: v12 (copy)
    local v31 = v30.AvatarExperience.Common.Widgets.ContextWidgetInfo[v12.RecentlyViewedItems];
    if v31 and v31.Details and v31.Details[v12.RecentlyViewedItems] then
        return v31.Details[v12.RecentlyViewedItems].content;
    else
        return {};
    end;
end;
return function(v33) --[[ Line: 86 ]] --[[ Name: useRecentlyViewedSearchItemsWidgetProps ]]
    -- upvalues: v3 (copy), l_HttpService_0 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), l_PerformFetch_0 (copy), v21 (copy), v19 (copy), v32 (copy), v9 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), v13 (copy), v14 (copy), l_RetrievalStatus_0 (copy), l_findItemInTryOnItems_0 (copy), l_AvatarScreen_0 (copy), v12 (copy), v16 (copy)
    local v34 = v3.useRef(l_HttpService_0:GenerateGUID(true));
    local v35 = l_useNavigation_0();
    local v37 = l_useSelector_0(function(v36) --[[ Line: 94 ]]
        -- upvalues: l_PerformFetch_0 (ref), v34 (copy)
        return l_PerformFetch_0.GetStatus(v36, v34.current);
    end);
    local v38 = l_useSelector_0(v21);
    local v39 = l_useSelector_0(v19);
    local v40 = l_useSelector_0(v32);
    local v41 = v3.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: v9 (ref), l_AXRecentlyViewedSearchItemsIXPTest_0 (ref)
        return {
            isPositionTopVariant = v9.readTestVariable(l_AXRecentlyViewedSearchItemsIXPTest_0.EnabledTopVariant) or false, 
            isGlobalSaveVariant = v9.readTestVariable(l_AXRecentlyViewedSearchItemsIXPTest_0.EnabledSaveInCatalog) or false
        };
    end, {});
    local v42 = v3.useRef(false);
    v3.useEffect(function() --[[ Line: 114 ]]
        -- upvalues: v33 (copy), v41 (copy), v42 (copy), v13 (ref)
        if v33.catalogAnalytics and v41 and not v42.current then
            v33.catalogAnalytics.sendAXCounterV2(v13.RecentlyViewedEligibleUserEntered, {
                isPositionTopVariant = tostring(v41.isPositionTopVariant), 
                isGlobalSaveVariant = tostring(v41.isGlobalSaveVariant)
            });
            v42.current = true;
        end;
    end, {
        v41
    });
    v3.useEffect(function() --[[ Line: 125 ]]
        -- upvalues: v14 (ref), v37 (copy), l_RetrievalStatus_0 (ref), v33 (copy), v34 (copy)
        local v43 = v14.getItems();
        if #v43 > 0 and v37 == l_RetrievalStatus_0.NotStarted and v33.fetchSearchRecentlyViewed then
            v33.fetchSearchRecentlyViewed(v34.current, v43);
        end;
    end, {
        v37, 
        v38, 
        v33.fetchSearchRecentlyViewed
    });
    local v46 = v3.useCallback(function(v44, v45) --[[ Line: 132 ]]
        -- upvalues: v33 (copy), v13 (ref), v41 (copy)
        if v33.catalogAnalytics then
            v33.catalogAnalytics.sendAXCounterV2(v13.RecentlyViewedCarouselItemSelected, {
                position = tostring(v45), 
                itemType = v44.itemType, 
                isPositionTopVariant = tostring(v41.isPositionTopVariant), 
                isGlobalSaveVariant = tostring(v41.isGlobalSaveVariant)
            });
        end;
    end, {
        v33.catalogAnalytics, 
        v41
    });
    local v51 = v3.useCallback(function(v47, v48) --[[ Line: 144 ]]
        -- upvalues: v46 (copy), v33 (copy), v39 (copy), l_findItemInTryOnItems_0 (ref), v35 (copy), l_AvatarScreen_0 (ref), v12 (ref)
        return function() --[[ Line: 145 ]]
            -- upvalues: v46 (ref), v47 (copy), v48 (copy), v33 (ref), v39 (ref), l_findItemInTryOnItems_0 (ref), v35 (ref), l_AvatarScreen_0 (ref), v12 (ref)
            v46(v47, v48);
            if v33.toggleTryOn then
                local l_v39_0 = v39;
                local l_id_0 = v47.id;
                if not (l_id_0 and l_findItemInTryOnItems_0(l_v39_0, l_id_0) ~= nil) then
                    v33.toggleTryOn(v47);
                end;
            end;
            v35.navigate(l_AvatarScreen_0.SearchLandingFocusedWidgetPage, {
                widgetType = v12.RecentlyViewedItems
            });
        end;
    end, {
        v35, 
        v33.toggleTryOn, 
        v39, 
        v46
    });
    local v61 = v3.useMemo(function() --[[ Line: 156 ]]
        -- upvalues: v40 (copy), v16 (ref), v38 (copy), v51 (copy)
        local l_v40_0 = v40;
        local v53 = {};
        for v54, v55 in l_v40_0 do
            if #v53 < v16() then
                local l_v38_0 = v38;
                local l_id_1 = v55.id;
                local l_type_0 = v55.type;
                local v59 = nil;
                if l_type_0 == "Asset" then
                    v59 = l_v38_0.AssetInfos[l_id_1];
                elseif l_type_0 == "Bundle" then
                    v59 = l_v38_0.BundleInfos[l_id_1];
                end;
                if v59 then
                    v59 = table.clone(v59);
                end;
                local l_v59_0 = v59;
                if l_v59_0 then
                    l_v59_0.itemType = v55.type;
                    l_v59_0.onActivated = v51(l_v59_0, v54);
                    table.insert(v53, l_v59_0);
                end;
            else
                break;
            end;
        end;
        return v53;
    end, {
        v38, 
        v51, 
        v40
    });
    v3.useEffect(function() --[[ Line: 175 ]]
        -- upvalues: v61 (copy), v9 (ref), l_AXRecentlyViewedSearchItemsIXPTest_0 (ref)
        if v61 and #v61 > 0 then
            v9.logExperimentExposure(l_AXRecentlyViewedSearchItemsIXPTest_0);
        end;
    end, {
        v61
    });
    return {
        items = v61, 
        fetchStatus = v37
    };
end;