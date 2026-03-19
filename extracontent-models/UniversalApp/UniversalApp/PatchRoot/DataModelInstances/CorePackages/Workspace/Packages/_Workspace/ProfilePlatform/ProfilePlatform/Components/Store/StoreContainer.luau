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
local v41 = l_memoize_0(function(v33, v34, v35) --[[ Line: 49 ]]
    -- upvalues: v10 (copy)
    local v36 = {};
    local v37 = 1;
    for _, v39 in v33 do
        local v40 = nil;
        v40 = if v39.itemType == v10.ItemTypes.Bundle then v34[tostring(v39.assetId)] else v35[tostring(v39.assetId)];
        if v40 then
            v40.itemType = v39.itemType;
            v36[v37] = v40;
            v37 = v37 + 1;
        end;
    end;
    return v36;
end);
return function(v42) --[[ Line: 72 ]] --[[ Name: StoreContainer ]]
    -- upvalues: v13 (copy), v14 (copy), l_useDispatch_0 (copy), v2 (copy), v29 (copy), v16 (copy), v11 (copy), v26 (copy), v10 (copy), v15 (copy), v4 (copy), v41 (copy), l_useSelector_0 (copy), v23 (copy), v24 (copy), l_HttpService_0 (copy), v18 (copy), v25 (copy), l_Url_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v20 (copy), l_dependencyArray_0 (copy), v12 (copy), v32 (copy), v28 (copy), v31 (copy), v3 (copy), v27 (copy)
    local v43 = v13();
    local v44 = v14();
    local v45 = l_useDispatch_0();
    local v46, v47 = v2.useState(v29 and true or false);
    local v48 = v16();
    local v52 = v2.useCallback(function(v49, v50, v51) --[[ Line: 81 ]]
        -- upvalues: v43 (copy), v44 (copy), v11 (ref), v26 (ref), v10 (ref), v48 (copy)
        v43.navigateTo.itemOrBundleDetails(v49, v50);
        v44.fireAnalyticsEvent(v11.CatalogItemOpened, if v26 then {
            btnContext = tostring(v10.Components.Store), 
            btnUnitId = tostring(v49), 
            btnSortPosition = tostring(v51)
        } else {
            source = tostring(v10.Components.Store), 
            positionInComponent = tostring(v51), 
            component = tostring(v10.Components.Store), 
            itemId = tostring(v49)
        });
        v43.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v48, v49, v50, tostring(v10.Components.Store), v51);
    end, {
        v44, 
        v43.navigateTo.itemOrBundleDetails, 
        v43.externalAnalytics.catalogAnalytics
    });
    local v53 = v15(v10.Components.Store).assets or {};
    local v57 = v2.useCallback(function(v54) --[[ Line: 115 ]]
        -- upvalues: v4 (ref), v41 (ref), v53 (copy)
        local v55 = v54[v4.RODUX_KEY].BundleDetails or {};
        local v56 = v54[v4.RODUX_KEY].AssetDetails or {};
        return v41(v53, v55, v56);
    end, {
        v53
    });
    local v58 = l_useSelector_0(v57);
    local l_name_0 = v15(v10.Components.Store).name;
    local v60 = if v23 then v43.profileType else nil;
    local v61 = if v24 then v43.profileId else nil;
    local v62 = if v23 and v60 == v10.ProfileTypes.Community then l_HttpService_0:UrlEncode(l_name_0) else l_name_0;
    local v64 = if v18 then v2.useCallback(function() --[[ Line: 140 ]]
        -- upvalues: v25 (ref), v44 (copy), v11 (ref), v24 (ref), v60 (copy), v10 (ref), l_Url_0 (ref), v61 (copy), v62 (copy), v45 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v20 (ref), l_name_0 (copy)
        if v25 then
            v44.fireAnalyticsEvent(v11.StoreHeaderButton);
        end;
        local v63 = nil;
        v63 = if v24 and v60 == v10.ProfileTypes.Community then string.format("%scommunities/%s/CommunityName/#!/store", l_Url_0.BASE_URL, v61) else string.format("%scatalog?CreatorName=%s", l_Url_0.BASE_URL, v62);
        v45(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v63, 
            extraProps = {
                titleKey = v20.Store
            }
        }, if not not v25 or v24 then nil else {
            l_name_0
        }));
    end, if not not v25 or v24 then l_dependencyArray_0(v44, l_name_0, v60, v61) else nil) else nil;
    local v65 = v2.useCallback(function() --[[ Line: 179 ]]
        -- upvalues: v25 (ref), v44 (copy), v11 (ref), v43 (copy), l_name_0 (copy)
        if v25 then
            v44.fireAnalyticsEvent(v11.StoreHeaderButton);
        end;
        v43.navigateTo.catalogSearch(l_name_0);
    end, {
        v43.navigateTo.catalogSearch, 
        l_name_0, 
        if v25 then v44 else nil
    });
    v2.useEffect(function() --[[ Line: 193 ]]
        -- upvalues: v45 (copy), v12 (ref), v53 (copy), v29 (ref), v47 (copy)
        v45(v12.GetItemAndBundleDetails.API(v53)):catch(function(_) --[[ Line: 194 ]]

        end):finally(function() --[[ Line: 194 ]]
            -- upvalues: v29 (ref), v47 (ref)
            if v29 then
                v47(false);
            end;
        end);
    end, {
        v53, 
        v45
    });
    if v29 and v46 then
        return v2.createElement(v32, {
            layoutOrder = v42.layoutOrder, 
            numSkeletons = #v53
        });
    elseif v28 and #v58 == 0 then
        return nil;
    else
        return v2.createElement(v31, {
            layoutOrder = v42.layoutOrder, 
            assets = v3.slice(v58, 1, v27), 
            openItemDetails = v52, 
            navigateToCatalogSearch = if v18 then v64 else v65
        });
    end;
end;