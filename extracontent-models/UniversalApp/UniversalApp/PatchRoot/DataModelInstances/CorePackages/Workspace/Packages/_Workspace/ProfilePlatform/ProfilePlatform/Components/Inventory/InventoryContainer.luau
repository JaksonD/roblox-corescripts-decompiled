local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_Parent_0.RoactUtils);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v7 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local v11 = require(l_script_FirstAncestor_0.Common.Enums);
local v12 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v13 = require(l_script_FirstAncestor_0.Networking.NetworkingCatalog);
local v14 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v15 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v17 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v18 = require(l_script_FirstAncestor_0.Hooks.useMarketplaceAnalyticsContext);
local v19 = require(l_script_FirstAncestor_0.Components.AssetsCarousel);
local _ = require(l_script_FirstAncestor_0.Common.AssetInfo);
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields);
return function(v22) --[[ Line: 34 ]] --[[ Name: InventoryContainer ]]
    -- upvalues: v14 (copy), v15 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v7 (copy), v18 (copy), v2 (copy), v12 (copy), v21 (copy), v11 (copy), v17 (copy), l_useSelector_0 (copy), v3 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), v13 (copy), v19 (copy)
    local v23 = v14();
    local v24 = v15();
    local l_profileId_0 = v23.profileId;
    local v26 = l_useDispatch_0();
    local v27 = l_useLocalization_0({
        inventory = v7.Inventory
    });
    local v28 = v18();
    local v34 = v2.useCallback(function(v29, v30, _, _, v33) --[[ Line: 46 ]]
        -- upvalues: v23 (copy), v24 (copy), v12 (ref), v21 (ref), v11 (ref), v28 (copy)
        v23.navigateTo.itemDetails(v29);
        v24.fireAnalyticsEvent(v12.CatalogItemOpened, if v21 then {
            btnContext = tostring(v11.Components.Inventory), 
            btnUnitId = tostring(v29), 
            btnSortPosition = tostring(v33)
        } else {
            positionInComponent = tostring(v33), 
            component = tostring(v11.Components.Inventory), 
            itemId = tostring(v29)
        });
        v23.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v28, v29, v30, v11.Components.Inventory, v33);
    end, {
        v24, 
        v23.navigateTo.itemDetails, 
        v23.externalAnalytics.catalogAnalytics
    });
    local v35 = v17(v11.Components.Inventory).assets or {};
    local v37 = l_useSelector_0(function(v36) --[[ Line: 79 ]]
        -- upvalues: v3 (ref)
        return v36[v3.RODUX_KEY].AssetDetails or {};
    end);
    local v42 = v2.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v35 (copy), v37 (copy)
        local v38 = {};
        for _, v40 in v35 do
            local v41 = v37[tostring(v40.assetId)];
            if v41 then
                v41.itemType = v40.itemType;
                table.insert(v38, v41);
            end;
        end;
        return v38;
    end, {
        v35, 
        v37
    });
    local v43 = v2.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v26 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), l_profileId_0 (copy), v7 (ref)
        v26(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = string.format("%susers/%s/inventory", l_Url_0.BASE_URL, l_profileId_0), 
            extraProps = {
                titleKey = v7.Inventory
            }
        }));
    end);
    v2.useEffect(function() --[[ Line: 106 ]]
        -- upvalues: v26 (copy), v13 (ref), v35 (copy)
        v26(v13.GetItemAndBundleDetails.API(v35));
    end, {
        v35, 
        v26
    });
    if #v42 > 0 then
        return (v2.createElement(v19, {
            title = v27.inventory, 
            layoutOrder = v22.layoutOrder, 
            assets = v42, 
            openItemDetails = v34, 
            onActivateHeader = v43
        }));
    else
        return nil;
    end;
end;