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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v31) --[[ Line: 49 ]] --[[ Name: CurrentlyWearingCarousel ]]
    -- upvalues: l_useDispatch_0 (copy), v15 (copy), v16 (copy), l_FFlagProfilePlatformEnableInventory_0 (copy), l_useLocalization_0 (copy), v18 (copy), v17 (copy), l_FFlagAddIEMProfilePage_0 (copy), v2 (copy), v11 (copy), l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 (copy), l_IXPService_0 (copy), v27 (copy), l_FFlagProfilePlatformEnableStore_0 (copy), v12 (copy), v24 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v14 (copy), v4 (copy), l_useSelector_0 (copy), v21 (copy), v3 (copy), l_useEffectOnMount_0 (copy), v13 (copy), v5 (copy), v29 (copy)
    local v32 = l_useDispatch_0();
    local v33 = v15();
    local v34 = v16();
    local v35 = if l_FFlagProfilePlatformEnableInventory_0 then l_useLocalization_0({
        currentlyWearing = v18.CurrentlyWearing
    }) else nil;
    local v36 = v17();
    local v37 = if l_FFlagAddIEMProfilePage_0 then v33.sourceInfo.source else nil;
    local v43 = v2.useCallback(function(v38, v39, _, _, v42) --[[ Line: 64 ]]
        -- upvalues: l_FFlagAddIEMProfilePage_0 (ref), v37 (copy), v11 (ref), v33 (copy), l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 (ref), l_IXPService_0 (ref), v27 (ref), l_FFlagProfilePlatformEnableStore_0 (ref), v34 (copy), v12 (ref), v24 (ref), v36 (copy)
        if l_FFlagAddIEMProfilePage_0 and v37 == v11.Sources.InExperienceProfile then
            v33.navigateTo.inspectAvatar();
            return;
        else
            if l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 then
                v33.navigateTo.itemOrBundleDetails(v38, v39);
            else
                v33.navigateTo.itemDetails(v38);
            end;
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v27);
            if l_FFlagProfilePlatformEnableStore_0 then
                v34.fireAnalyticsEvent(v12.CatalogItemOpened, if v24 then {
                    btnContext = tostring(v11.Components.CurrentlyWearing), 
                    btnUnitId = tostring(v38), 
                    btnSortPosition = tostring(v42)
                } else {
                    source = tostring(v11.Components.CurrentlyWearing), 
                    positionInComponent = tostring(v42), 
                    component = tostring(v11.Components.CurrentlyWearing), 
                    itemId = tostring(v38)
                });
                v33.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v36, v38, v39, tostring(v11.Components.CurrentlyWearing), v42);
                return;
            else
                v34.fireAnalyticsEvent(v12.CatalogItemOpened);
                v33.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v36, v38, v39);
                return;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33.navigateTo.itemDetails, 
        v33.externalAnalytics.catalogAnalytics, 
        v33.navigateTo.tryOnItem, 
        v33.navigateTo.inspectAvatar, 
        v37
    } else l_dependencyArray_0(v33.navigateTo.itemDetails, v33.externalAnalytics.catalogAnalytics, v33.navigateTo.tryOnItem, v33.navigateTo.inspectAvatar, v37));
    local v44 = v14(v11.Components.CurrentlyWearing).assets or {};
    local v45 = nil;
    local v46 = nil;
    if l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 then
        local v55 = v2.useCallback(function(v47) --[[ Line: 130 ]]
            -- upvalues: v4 (ref), v44 (copy), v11 (ref)
            local v48 = v47[v4.RODUX_KEY].BundleDetails or {};
            local v49 = v47[v4.RODUX_KEY].AssetDetails or {};
            local v50 = {};
            local v51 = 1;
            for _, v53 in v44 do
                local v54 = nil;
                v54 = if v53.itemType == v11.ItemTypes.Bundle then v48[tostring(v53.assetId)] else v49[tostring(v53.assetId)];
                if v54 then
                    v54.itemType = v53.itemType;
                    v50[v51] = v54;
                    v51 = v51 + 1;
                end;
            end;
            return v50;
        end, {
            v44
        });
        v45 = l_useSelector_0(v55);
        v2.useEffect(function() --[[ Line: 153 ]]
            -- upvalues: v44 (copy), v32 (copy), v21 (ref)
            if #v44 > 0 then
                v32(v21.GetItemAndBundleDetails.API(v44));
            end;
        end, {
            v44, 
            v32
        });
    else
        local v57 = v2.useMemo(function() --[[ Line: 159 ]]
            -- upvalues: v3 (ref), v44 (copy)
            return v3.List.map(v44, function(v56) --[[ Line: 160 ]]
                return v56.assetId;
            end);
        end, {
            v44
        });
        l_useEffectOnMount_0(function() --[[ Line: 165 ]]
            -- upvalues: v32 (copy), v13 (ref), v57 (copy)
            v32(v13.GetItemDetails.API(v57)):andThen(function(_) --[[ Line: 167 ]]

            end):catch(function(_) --[[ Line: 168 ]]

            end);
        end);
        local v61 = l_useSelector_0(function(v60) --[[ Line: 173 ]]
            -- upvalues: v4 (ref)
            return v60[v4.RODUX_KEY].ItemAssets or {};
        end);
        v46 = v2.useMemo(function() --[[ Line: 177 ]]
            -- upvalues: v57 (copy), v61 (copy), v3 (ref), v5 (ref)
            local v62 = {};
            local v63 = 1;
            for _, v65 in v57 do
                local v66 = v61[tostring(v65)];
                if v66 then
                    v62[v63] = v66;
                    v63 = v63 + 1;
                end;
            end;
            return v3.List.sort(v62, function(v67, v68) --[[ Line: 190 ]]
                -- upvalues: v5 (ref)
                return v5(v67, v68);
            end);
        end, {
            v61, 
            v57
        });
    end;
    if not l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 or #v45 > 0 then
        return (v2.createElement(v29, {
            title = if l_FFlagProfilePlatformEnableInventory_0 then v35.currentlyWearing else nil, 
            layoutOrder = v31.layoutOrder, 
            assets = if l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 then v45 else v46, 
            openItemDetails = v43
        }));
    else
        return nil;
    end;
end;