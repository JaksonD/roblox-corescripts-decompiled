local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v3 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v7 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v8 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_selectSearchKeyword_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectSearchKeyword;
local l_FFlagAXMISEnableMultiShopping_0 = v2.FFlagAXMISEnableMultiShopping;
return function(v13) --[[ Line: 33 ]]
    -- upvalues: v3 (copy), l_selectSearchKeyword_0 (copy), v4 (copy), v5 (copy), l_PeekViewState_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_AvatarScreen_0 (copy), v8 (copy), v7 (copy), v6 (copy)
    return function(v14) --[[ Line: 34 ]]
        -- upvalues: v13 (copy), v3 (ref), l_selectSearchKeyword_0 (ref), v4 (ref), v5 (ref), l_PeekViewState_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), l_AvatarScreen_0 (ref), v8 (ref), v7 (ref), v6 (ref)
        local v15 = v14:getState();
        local l_name_0 = v13.avatarRoute.opaque.name;
        local v17 = v3.getCurrentScreenIgnoreItemDetails(v13.avatarRoute);
        local v18 = l_selectSearchKeyword_0(v15);
        local v19, v20 = v4.getCategoryAndSubcategory(v15);
        local l_Look_0 = v5.ItemType.Look;
        v13.catalogAnalytics.openItemDetailsV2(v13.lookId, l_Look_0, v13.valueInRobux, v17, nil, v18, v19, v20, v15.AvatarExperience.AnalyticsMetadata);
        local l_Brief_0 = l_PeekViewState_0.Brief;
        if l_FFlagAXMISEnableMultiShopping_0 and v13.avatarRoute and v13.avatarRoute.opaque and v13.avatarRoute.opaque.name ~= l_AvatarScreen_0.MySharedAvatars then
            l_Brief_0 = l_PeekViewState_0.Full;
        end;
        v14:dispatch(v8(v13.catalogAnalytics, l_name_0, v7.None));
        v14:dispatch(v6(l_Brief_0));
    end;
end;