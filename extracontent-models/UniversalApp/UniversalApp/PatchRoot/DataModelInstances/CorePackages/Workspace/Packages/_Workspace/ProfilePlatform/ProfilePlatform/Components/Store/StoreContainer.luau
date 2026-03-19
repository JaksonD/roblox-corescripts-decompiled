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
local l_HttpService_0 = game:GetService("HttpService");
local v30 = require(script.Parent.StoreGrid);
local v39 = l_memoize_0(function(v31, v32, v33) --[[ Line: 46 ]]
    -- upvalues: v10 (copy)
    local v34 = {};
    local v35 = 1;
    for _, v37 in v31 do
        local v38 = nil;
        v38 = if v37.itemType == v10.ItemTypes.Bundle then v32[tostring(v37.assetId)] else v33[tostring(v37.assetId)];
        if v38 then
            v38.itemType = v37.itemType;
            v34[v35] = v38;
            v35 = v35 + 1;
        end;
    end;
    return v34;
end);
return function(v40) --[[ Line: 69 ]] --[[ Name: StoreContainer ]]
    -- upvalues: v13 (copy), v14 (copy), l_useDispatch_0 (copy), v16 (copy), v2 (copy), v11 (copy), v26 (copy), v10 (copy), v15 (copy), v4 (copy), v39 (copy), l_useSelector_0 (copy), v23 (copy), v24 (copy), l_HttpService_0 (copy), v18 (copy), v25 (copy), l_Url_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v20 (copy), l_dependencyArray_0 (copy), v12 (copy), v28 (copy), v30 (copy), v3 (copy), v27 (copy)
    local v41 = v13();
    local v42 = v14();
    local v43 = l_useDispatch_0();
    local v44 = v16();
    local v48 = v2.useCallback(function(v45, v46, v47) --[[ Line: 77 ]]
        -- upvalues: v41 (copy), v42 (copy), v11 (ref), v26 (ref), v10 (ref), v44 (copy)
        v41.navigateTo.itemOrBundleDetails(v45, v46);
        v42.fireAnalyticsEvent(v11.CatalogItemOpened, if v26 then {
            btnContext = tostring(v10.Components.Store), 
            btnUnitId = tostring(v45), 
            btnSortPosition = tostring(v47)
        } else {
            source = tostring(v10.Components.Store), 
            positionInComponent = tostring(v47), 
            component = tostring(v10.Components.Store), 
            itemId = tostring(v45)
        });
        v41.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v44, v45, v46, tostring(v10.Components.Store), v47);
    end, {
        v42, 
        v41.navigateTo.itemOrBundleDetails, 
        v41.externalAnalytics.catalogAnalytics
    });
    local v49 = v15(v10.Components.Store).assets or {};
    local v53 = v2.useCallback(function(v50) --[[ Line: 111 ]]
        -- upvalues: v4 (ref), v39 (ref), v49 (copy)
        local v51 = v50[v4.RODUX_KEY].BundleDetails or {};
        local v52 = v50[v4.RODUX_KEY].AssetDetails or {};
        return v39(v49, v51, v52);
    end, {
        v49
    });
    local v54 = l_useSelector_0(v53);
    local l_name_0 = v15(v10.Components.Store).name;
    local v56 = if v23 then v41.profileType else nil;
    local v57 = if v24 then v41.profileId else nil;
    local v58 = if v23 and v56 == v10.ProfileTypes.Community then l_HttpService_0:UrlEncode(l_name_0) else l_name_0;
    local v60 = if v18 then v2.useCallback(function() --[[ Line: 136 ]]
        -- upvalues: v25 (ref), v42 (copy), v11 (ref), v24 (ref), v56 (copy), v10 (ref), l_Url_0 (ref), v57 (copy), v58 (copy), v43 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v20 (ref), l_name_0 (copy)
        if v25 then
            v42.fireAnalyticsEvent(v11.StoreHeaderButton);
        end;
        local v59 = nil;
        v59 = if v24 and v56 == v10.ProfileTypes.Community then string.format("%scommunities/%s/CommunityName/#!/store", l_Url_0.BASE_URL, v57) else string.format("%scatalog?CreatorName=%s", l_Url_0.BASE_URL, v58);
        v43(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v59, 
            extraProps = {
                titleKey = v20.Store
            }
        }, if not not v25 or v24 then nil else {
            l_name_0
        }));
    end, if not not v25 or v24 then l_dependencyArray_0(v42, l_name_0, v56, v57) else nil) else nil;
    local v61 = v2.useCallback(function() --[[ Line: 175 ]]
        -- upvalues: v25 (ref), v42 (copy), v11 (ref), v41 (copy), l_name_0 (copy)
        if v25 then
            v42.fireAnalyticsEvent(v11.StoreHeaderButton);
        end;
        v41.navigateTo.catalogSearch(l_name_0);
    end, {
        v41.navigateTo.catalogSearch, 
        l_name_0, 
        if v25 then v42 else nil
    });
    v2.useEffect(function() --[[ Line: 189 ]]
        -- upvalues: v43 (copy), v12 (ref), v49 (copy)
        v43(v12.GetItemAndBundleDetails.API(v49)):catch(function(_) --[[ Line: 190 ]]

        end);
    end, {
        v49, 
        v43
    });
    if v28 and #v54 == 0 then
        return nil;
    else
        return v2.createElement(v30, {
            layoutOrder = v40.layoutOrder, 
            assets = v3.slice(v54, 1, v27), 
            openItemDetails = v48, 
            navigateToCatalogSearch = if v18 then v60 else v61
        });
    end;
end;