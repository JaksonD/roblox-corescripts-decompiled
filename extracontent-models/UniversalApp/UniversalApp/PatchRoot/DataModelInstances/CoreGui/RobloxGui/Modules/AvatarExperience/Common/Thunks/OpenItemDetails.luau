local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v5 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoItemDetailsPage);
local _ = require(l_Modules_0.AvatarExperience.Common.Context.WidgetInfoContext);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_selectSearchKeyword_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectSearchKeyword;
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsAnalyticsV2);
return function(v12) --[[ Line: 63 ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy), v11 (copy), l_selectSearchKeyword_0 (copy), v6 (copy), v7 (copy)
    v2.assert(not (v12.mountAsFullView and v12.showFullWithNoPeekView));
    return function(v13) --[[ Line: 67 ]]
        -- upvalues: v12 (copy), v4 (ref), v5 (ref), v11 (ref), l_selectSearchKeyword_0 (ref), v6 (ref), v7 (ref)
        if v12.closePreviousItemDetails then
            v4.closeFiltersAndItemDetails(v12.navigation);
        end;
        local v14 = {
            itemId = v12.itemId, 
            itemType = v12.itemType, 
            itemSubType = v12.itemSubType, 
            itemDetailsPeekViewRefs = v12.itemDetailsPeekViewRefs, 
            resultsListRef = v12.resultsListRef, 
            isFirstItemDetails = true, 
            mountAsFullView = v12.mountAsFullView, 
            showFullWithNoPeekView = v12.showFullWithNoPeekView, 
            widgetInfo = v12.widgetInfo, 
            onItemDetailsClosed = v12.onItemDetailsClosed
        };
        if v12.showFullWithNoPeekView or v12.mountAsFullView then
            local v15 = v5.getCurrentScreenIgnoreItemDetails(v12.avatarRoute);
            if v11() then
                local v16 = v13:getState();
                local v17 = l_selectSearchKeyword_0(v16);
                local v18, v19 = v6.getCategoryAndSubcategory(v16);
                local l_RequestId_0 = v16.AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
                v12.catalogAnalytics.openItemDetailsV2(v12.itemId, v12.itemType, v12.priceInRobux, v15, l_RequestId_0, v17, v18, v19, v16.AvatarExperience.AnalyticsMetadata);
            else
                v12.catalogAnalytics.openItemDetails(v12.itemId, v12.itemType, v12.priceInRobux, v15);
            end;
        end;
        v13:dispatch(v7(v12.navigation, v14));
    end;
end;