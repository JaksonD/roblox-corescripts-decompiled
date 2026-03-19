local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = require(l_script_FirstAncestor_0.Components.CurrentlyWearing.SortCurrentlyWearing);
local v6 = require(l_Parent_0.RoactUtils);
local l_dependencyArray_0 = v6.Hooks.dependencyArray;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v6.Hooks.useEffectOnMount;
local v11 = require(l_script_FirstAncestor_0.Common.Enums);
local v12 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v13 = require(l_script_FirstAncestor_0.Networking.NetworkingCurrentlyWearing);
local v14 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v15 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v16 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v17 = require(l_script_FirstAncestor_0.Hooks.useMarketplaceAnalyticsContext);
local v18 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.Common.AssetInfo);
local v21 = require(l_script_FirstAncestor_0.Networking.NetworkingCatalog);
local l_FFlagProfilePlatformEnableInventory_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableInventory;
local l_FFlagProfilePlatformEnableStore_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableStore;
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields);
local l_FFlagAddIEMProfilePage_0 = require(l_Parent_0.SharedFlags).FFlagAddIEMProfilePage;
local l_IXPService_0 = game:GetService("IXPService");
local v27 = game:DefineFastString("SocialProfileCurrentlyWearingClickThroughLayer", "Social.ProfileCurrentlyWearingClickThrough");
local l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel;
local v29 = require(l_script_FirstAncestor_0.Components.AssetsCarousel);
return function(v30) --[[ Line: 47 ]] --[[ Name: CurrentlyWearingCarousel ]]
    -- upvalues: l_useDispatch_0 (copy), v15 (copy), v16 (copy), l_FFlagProfilePlatformEnableInventory_0 (copy), l_useLocalization_0 (copy), v18 (copy), v17 (copy), l_FFlagAddIEMProfilePage_0 (copy), v2 (copy), v11 (copy), l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 (copy), l_IXPService_0 (copy), v27 (copy), l_FFlagProfilePlatformEnableStore_0 (copy), v12 (copy), v24 (copy), l_dependencyArray_0 (copy), v14 (copy), v4 (copy), l_useSelector_0 (copy), v21 (copy), v3 (copy), l_useEffectOnMount_0 (copy), v13 (copy), v5 (copy), v29 (copy)
    local v31 = l_useDispatch_0();
    local v32 = v15();
    local v33 = v16();
    local v34 = if l_FFlagProfilePlatformEnableInventory_0 then l_useLocalization_0({
        currentlyWearing = v18.CurrentlyWearing
    }) else nil;
    local v35 = v17();
    local v36 = if l_FFlagAddIEMProfilePage_0 then v32.sourceInfo.source else nil;
    local v42 = v2.useCallback(function(v37, v38, _, _, v41) --[[ Line: 62 ]]
        -- upvalues: l_FFlagAddIEMProfilePage_0 (ref), v36 (copy), v11 (ref), v32 (copy), l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 (ref), l_IXPService_0 (ref), v27 (ref), l_FFlagProfilePlatformEnableStore_0 (ref), v33 (copy), v12 (ref), v24 (ref), v35 (copy)
        if l_FFlagAddIEMProfilePage_0 and v36 == v11.Sources.InExperienceProfile then
            v32.navigateTo.inspectAvatar();
            return;
        else
            if l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 then
                v32.navigateTo.itemOrBundleDetails(v37, v38);
            else
                v32.navigateTo.itemDetails(v37);
            end;
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v27);
            if l_FFlagProfilePlatformEnableStore_0 then
                v33.fireAnalyticsEvent(v12.CatalogItemOpened, if v24 then {
                    btnContext = tostring(v11.Components.CurrentlyWearing), 
                    btnUnitId = tostring(v37), 
                    btnSortPosition = tostring(v41)
                } else {
                    source = tostring(v11.Components.CurrentlyWearing), 
                    positionInComponent = tostring(v41), 
                    component = tostring(v11.Components.CurrentlyWearing), 
                    itemId = tostring(v37)
                });
                v32.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v35, v37, v38, tostring(v11.Components.CurrentlyWearing), v41);
                return;
            else
                v33.fireAnalyticsEvent(v12.CatalogItemOpened);
                v32.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v35, v37, v38);
                return;
            end;
        end;
    end, l_dependencyArray_0(v32.navigateTo.itemDetails, v32.externalAnalytics.catalogAnalytics, v32.navigateTo.tryOnItem, v32.navigateTo.inspectAvatar, v36));
    local v43 = v14(v11.Components.CurrentlyWearing).assets or {};
    local v44 = nil;
    local v45 = nil;
    if l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 then
        local v54 = v2.useCallback(function(v46) --[[ Line: 120 ]]
            -- upvalues: v4 (ref), v43 (copy), v11 (ref)
            local v47 = v46[v4.RODUX_KEY].BundleDetails or {};
            local v48 = v46[v4.RODUX_KEY].AssetDetails or {};
            local v49 = {};
            local v50 = 1;
            for _, v52 in v43 do
                local v53 = nil;
                v53 = if v52.itemType == v11.ItemTypes.Bundle then v47[tostring(v52.assetId)] else v48[tostring(v52.assetId)];
                if v53 then
                    v53.itemType = v52.itemType;
                    v49[v50] = v53;
                    v50 = v50 + 1;
                end;
            end;
            return v49;
        end, {
            v43
        });
        v44 = l_useSelector_0(v54);
        v2.useEffect(function() --[[ Line: 143 ]]
            -- upvalues: v43 (copy), v31 (copy), v21 (ref)
            if #v43 > 0 then
                v31(v21.GetItemAndBundleDetails.API(v43));
            end;
        end, {
            v43, 
            v31
        });
    else
        local v56 = v2.useMemo(function() --[[ Line: 149 ]]
            -- upvalues: v3 (ref), v43 (copy)
            return v3.List.map(v43, function(v55) --[[ Line: 150 ]]
                return v55.assetId;
            end);
        end, {
            v43
        });
        l_useEffectOnMount_0(function() --[[ Line: 155 ]]
            -- upvalues: v31 (copy), v13 (ref), v56 (copy)
            v31(v13.GetItemDetails.API(v56)):andThen(function(_) --[[ Line: 157 ]]

            end):catch(function(_) --[[ Line: 158 ]]

            end);
        end);
        local v60 = l_useSelector_0(function(v59) --[[ Line: 163 ]]
            -- upvalues: v4 (ref)
            return v59[v4.RODUX_KEY].ItemAssets or {};
        end);
        v45 = v2.useMemo(function() --[[ Line: 167 ]]
            -- upvalues: v56 (copy), v60 (copy), v3 (ref), v5 (ref)
            local v61 = {};
            local v62 = 1;
            for _, v64 in v56 do
                local v65 = v60[tostring(v64)];
                if v65 then
                    v61[v62] = v65;
                    v62 = v62 + 1;
                end;
            end;
            return v3.List.sort(v61, function(v66, v67) --[[ Line: 180 ]]
                -- upvalues: v5 (ref)
                return v5(v66, v67);
            end);
        end, {
            v60, 
            v56
        });
    end;
    if not l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 or #v44 > 0 then
        return (v2.createElement(v29, {
            title = if l_FFlagProfilePlatformEnableInventory_0 then v34.currentlyWearing else nil, 
            layoutOrder = v30.layoutOrder, 
            assets = if l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 then v44 else v45, 
            openItemDetails = v42
        }));
    else
        return nil;
    end;
end;