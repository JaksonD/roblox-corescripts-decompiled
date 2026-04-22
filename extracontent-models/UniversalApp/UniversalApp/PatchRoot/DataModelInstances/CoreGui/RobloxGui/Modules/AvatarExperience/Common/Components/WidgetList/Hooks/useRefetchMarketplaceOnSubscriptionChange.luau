local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v5 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxSubscriptionPurchaseApp);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v15 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearReceivedCatalogData);
local l_FFlagAXMarketplaceSessionSubscriptionRefetch_0 = v12.FFlagAXMarketplaceSessionSubscriptionRefetch;
local l_FFlagAXFixBlackbirdSubscriptionRefresh_0 = v12.FFlagAXFixBlackbirdSubscriptionRefresh;
local l_FFlagAXSubscriptionRefetchClearCatalogData_0 = v12.FFlagAXSubscriptionRefetchClearCatalogData;
local l_useAvatarRoute_0 = v11.AvatarRoute.Hooks.useAvatarRoute;
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v21 = require(script.Parent.useMarketplaceResultsFetcher);
local l_AvatarScreen_0 = v11.Enums.AvatarScreen;
local function v24(v23) --[[ Line: 50 ]]
    return v23.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
return function() --[[ Line: 54 ]] --[[ Name: useRefetchMarketplaceOnSubscriptionChange ]]
    -- upvalues: v13 (copy), l_useSignalState_0 (copy), l_useAvatarRoute_0 (copy), l_FFlagAXFixBlackbirdSubscriptionRefresh_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v10 (copy), l_useSelector_0 (copy), v24 (copy), v3 (copy), v14 (copy), v20 (copy), l_AvatarScreen_0 (copy), v21 (copy), l_FFlagAXSubscriptionRefetchClearCatalogData_0 (copy), v15 (copy), l_FFlagAXMarketplaceSessionSubscriptionRefetch_0 (copy)
    local v25 = v13.RobloxSubscriptionSignals.get();
    local v26 = l_useSignalState_0(v25.getHasRobloxSubscription);
    local l_opaque_0 = l_useAvatarRoute_0().opaque;
    local v28 = if l_opaque_0 then l_opaque_0.name else nil;
    local v29 = if l_opaque_0 and l_opaque_0.params then l_opaque_0.params.detail else nil;
    local v30 = nil;
    if l_FFlagAXFixBlackbirdSubscriptionRefresh_0 then
        local v31 = l_useDispatch_0();
        local v32 = l_useRoactService_0(l_RoactNetworking_0);
        local v33 = l_useRoactService_0(v10);
        local v34 = l_useSelector_0(v24);
        local l_v34_0 = v34 --[[ copy: 10 -> 15 ]];
        local l_v31_0 = v31 --[[ copy: 7 -> 16 ]];
        local l_v32_0 = v32 --[[ copy: 8 -> 17 ]];
        local l_v33_0 = v33 --[[ copy: 9 -> 18 ]];
        v30 = v3.useCallback(function() --[[ Line: 71 ]]
            -- upvalues: l_v34_0 (copy), l_v31_0 (copy), v14 (ref), l_v32_0 (copy), l_v33_0 (copy)
            for _, v40 in l_v34_0 do
                l_v31_0(v14(l_v32_0, l_v33_0, v40.itemId, v40.itemType, true));
            end;
        end, {
            v34, 
            v32, 
            v33
        });
    end;
    local v41 = v20.getCatalogSearchSelectionStore();
    local v42 = l_useSignalState_0(v41.selectedCategoryId);
    local v43 = l_useSignalState_0(v41.selectedSubcategoryId);
    local v44 = v3.useMemo(function() --[[ Line: 84 ]]
        -- upvalues: v28 (copy), l_AvatarScreen_0 (ref), v29 (copy), v42 (copy), v43 (copy)
        if v28 ~= l_AvatarScreen_0.CatalogSearch then
            return nil;
        elseif typeof(v29) ~= "string" or v29 == "" then
            return nil;
        else
            return {
                searchUuid = v29, 
                categoryId = v42, 
                subcategoryId = v43
            };
        end;
    end, {
        v28, 
        v29, 
        v42, 
        v43
    });
    local l_fetchMarketplace_0 = v21(v44).fetchMarketplace;
    local v46 = if l_FFlagAXSubscriptionRefetchClearCatalogData_0 then l_useDispatch_0() else nil;
    local v47 = v3.useRef(nil);
    v3.useEffect(function() --[[ Line: 114 ]]
        -- upvalues: v47 (copy), v26 (copy), l_FFlagAXSubscriptionRefetchClearCatalogData_0 (ref), v46 (copy), v15 (ref), l_fetchMarketplace_0 (copy), l_FFlagAXFixBlackbirdSubscriptionRefresh_0 (ref), v30 (ref)
        local l_current_0 = v47.current;
        v47.current = v26;
        local v49 = false;
        if l_current_0 == false then
            v49 = v26 == true;
        end;
        if v49 then
            if l_FFlagAXSubscriptionRefetchClearCatalogData_0 and v46 then
                v46(v15());
            end;
            l_fetchMarketplace_0();
            if l_FFlagAXFixBlackbirdSubscriptionRefresh_0 then
                v30();
            end;
        end;
    end, {
        v26, 
        if l_FFlagAXFixBlackbirdSubscriptionRefresh_0 then v30 else nil
    });
    if l_FFlagAXMarketplaceSessionSubscriptionRefetch_0 then
        v3.useLayoutEffect(function() --[[ Line: 140 ]]
            -- upvalues: v25 (copy), l_FFlagAXSubscriptionRefetchClearCatalogData_0 (ref), v46 (copy), v15 (ref), l_fetchMarketplace_0 (copy)
            if v25.getGainedRobloxSubscriptionThisSession() then
                if l_FFlagAXSubscriptionRefetchClearCatalogData_0 and v46 then
                    v46(v15());
                end;
                l_fetchMarketplace_0();
            end;
        end, {});
    end;
end;