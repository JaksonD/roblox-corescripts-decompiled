local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = require(l_Parent_0.RoactUtils);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local v10 = require(l_script_FirstAncestor_0.Common.Enums);
local v11 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v12 = require(l_script_FirstAncestor_0.Networking.NetworkingCatalog);
local v13 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v14 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v15 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v16 = require(l_script_FirstAncestor_0.Hooks.useMarketplaceAnalyticsContext);
local _ = require(l_script_FirstAncestor_0.Common.AssetInfo);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformNavigateToMarketplaceWebView);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v20 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local v24 = game:DefineFastFlag("ProfilePlatformUpdateCommunityStoreHeaderNavigation", false);
local v25 = game:DefineFastFlag("ProfilePlatformAddStoreHeaderAnalytics", false);
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields);
local v27 = game:DefineFastInt("ProfilePlatformStoreItemLimit", 3);
local v28 = game:DefineFastFlag("ProfilePlatformHideStoreIfNoAssets", false);
local v29 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommunityProfileLoadingSkeletons);
local l_HttpService_0 = game:GetService("HttpService");
local v31 = require(script.Parent.StoreGrid);
local v32 = require(script.Parent.StoreGridSkeleton);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v42 = l_memoize_0(function(v34, v35, v36) --[[ Line: 51 ]]
    -- upvalues: v10 (copy)
    local v37 = {};
    local v38 = 1;
    for _, v40 in v34 do
        local v41 = nil;
        v41 = if v40.itemType == v10.ItemTypes.Bundle then v35[tostring(v40.assetId)] else v36[tostring(v40.assetId)];
        if v41 then
            v41.itemType = v40.itemType;
            v37[v38] = v41;
            v38 = v38 + 1;
        end;
    end;
    return v37;
end);
return function(v43) --[[ Line: 74 ]] --[[ Name: StoreContainer ]]
    -- upvalues: v13 (copy), v14 (copy), l_useDispatch_0 (copy), v2 (copy), v29 (copy), v16 (copy), v11 (copy), v26 (copy), v10 (copy), v15 (copy), v4 (copy), v42 (copy), l_useSelector_0 (copy), v23 (copy), v24 (copy), l_HttpService_0 (copy), v18 (copy), v25 (copy), l_Url_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v20 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v12 (copy), v32 (copy), v28 (copy), v31 (copy), v3 (copy), v27 (copy)
    local v44 = v13();
    local v45 = v14();
    local v46 = l_useDispatch_0();
    local v47, v48 = v2.useState(v29 and true or false);
    local v49 = v16();
    local v53 = v2.useCallback(function(v50, v51, v52) --[[ Line: 83 ]]
        -- upvalues: v44 (copy), v45 (copy), v11 (ref), v26 (ref), v10 (ref), v49 (copy)
        v44.navigateTo.itemOrBundleDetails(v50, v51);
        v45.fireAnalyticsEvent(v11.CatalogItemOpened, if v26 then {
            btnContext = tostring(v10.Components.Store), 
            btnUnitId = tostring(v50), 
            btnSortPosition = tostring(v52)
        } else {
            source = tostring(v10.Components.Store), 
            positionInComponent = tostring(v52), 
            component = tostring(v10.Components.Store), 
            itemId = tostring(v50)
        });
        v44.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v49, v50, v51, tostring(v10.Components.Store), v52);
    end, {
        v45, 
        v44.navigateTo.itemOrBundleDetails, 
        v44.externalAnalytics.catalogAnalytics
    });
    local v54 = v15(v10.Components.Store).assets or {};
    local v58 = v2.useCallback(function(v55) --[[ Line: 117 ]]
        -- upvalues: v4 (ref), v42 (ref), v54 (copy)
        local v56 = v55[v4.RODUX_KEY].BundleDetails or {};
        local v57 = v55[v4.RODUX_KEY].AssetDetails or {};
        return v42(v54, v56, v57);
    end, {
        v54
    });
    local v59 = l_useSelector_0(v58);
    local l_name_0 = v15(v10.Components.Store).name;
    local v61 = if v23 then v44.profileType else nil;
    local v62 = if v24 then v44.profileId else nil;
    local v63 = if v23 and v61 == v10.ProfileTypes.Community then l_HttpService_0:UrlEncode(l_name_0) else l_name_0;
    local v65 = if v18 then v2.useCallback(function() --[[ Line: 142 ]]
        -- upvalues: v25 (ref), v45 (copy), v11 (ref), v24 (ref), v61 (copy), v10 (ref), l_Url_0 (ref), v62 (copy), v63 (copy), v46 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v20 (ref), l_name_0 (copy)
        if v25 then
            v45.fireAnalyticsEvent(v11.StoreHeaderButton);
        end;
        local v64 = nil;
        v64 = if v24 and v61 == v10.ProfileTypes.Community then string.format("%scommunities/%s/CommunityName/#!/store", l_Url_0.BASE_URL, v62) else string.format("%scatalog?CreatorName=%s", l_Url_0.BASE_URL, v63);
        v46(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v64, 
            extraProps = {
                titleKey = v20.Store
            }
        }, if not not v25 or v24 then nil else {
            l_name_0
        }));
    end, if not not v25 or v24 then if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v45, 
        l_name_0, 
        v61, 
        v62
    } else l_dependencyArray_0(v45, l_name_0, v61, v62) else nil) else nil;
    local v66 = v2.useCallback(function() --[[ Line: 183 ]]
        -- upvalues: v25 (ref), v45 (copy), v11 (ref), v44 (copy), l_name_0 (copy)
        if v25 then
            v45.fireAnalyticsEvent(v11.StoreHeaderButton);
        end;
        v44.navigateTo.catalogSearch(l_name_0);
    end, {
        v44.navigateTo.catalogSearch, 
        l_name_0, 
        if v25 then v45 else nil
    });
    v2.useEffect(function() --[[ Line: 197 ]]
        -- upvalues: v46 (copy), v12 (ref), v54 (copy), v29 (ref), v48 (copy)
        v46(v12.GetItemAndBundleDetails.API(v54)):catch(function(_) --[[ Line: 198 ]]

        end):finally(function() --[[ Line: 198 ]]
            -- upvalues: v29 (ref), v48 (ref)
            if v29 then
                v48(false);
            end;
        end);
    end, {
        v54, 
        v46
    });
    if v29 and v47 then
        return v2.createElement(v32, {
            layoutOrder = v43.layoutOrder, 
            numSkeletons = #v54
        });
    elseif v28 and #v59 == 0 then
        return nil;
    else
        return v2.createElement(v31, {
            layoutOrder = v43.layoutOrder, 
            assets = v3.slice(v59, 1, v27), 
            openItemDetails = v53, 
            navigateToCatalogSearch = if v18 then v65 else v66
        });
    end;
end;