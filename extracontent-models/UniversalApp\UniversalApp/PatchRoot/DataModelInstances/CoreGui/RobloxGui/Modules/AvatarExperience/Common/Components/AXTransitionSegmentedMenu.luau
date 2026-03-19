local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v5.AvatarRoute.Hooks.useAvatarRoute;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v11 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local l_SegmentedControl_0 = v4.App.Control.SegmentedControl;
return function(v15) --[[ Line: 33 ]] --[[ Name: AXTransitionSegmentedMenu ]]
    -- upvalues: v2 (copy), v11 (copy), v12 (copy), v13 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_AvatarScreen_0 (copy), l_FormFactor_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_SegmentedControl_0 (copy)
    local v16, v17 = v2.useState(234);
    local v18 = v11(v12);
    local v19 = v11(v13);
    local v20 = l_useNavigation_0();
    local l_name_0 = l_useAvatarRoute_0().opaque.name;
    local v22 = l_name_0 == l_AvatarScreen_0.Catalog and 1 or 2;
    local v23 = not (v15.formFactor == l_FormFactor_0.WIDE) and 234 or nil;
    local v24 = l_useLocalization_0({
        shopText = "Feature.Avatar.Action.Marketplace", 
        customizeText = "Feature.Catalog.Action.Customize"
    });
    local v25 = {
        {
            tabName = v24.shopText
        }, 
        {
            tabName = v24.customizeText
        }
    };
    local v27 = v2.useCallback(function(v26) --[[ Line: 54 ]]
        -- upvalues: v17 (copy)
        v17(v26.AbsoluteSize.X >= 234 and 234 or 224);
    end, {});
    local v29 = v2.useCallback(function(v28) --[[ Line: 58 ]]
        -- upvalues: l_name_0 (copy), l_AvatarScreen_0 (ref), v20 (copy), v18 (copy), v19 (copy)
        if v28 == 1 and l_name_0 ~= l_AvatarScreen_0.Catalog then
            v20.navigate(l_AvatarScreen_0.Catalog);
            v18.avatarToCatalogButton();
            return;
        else
            if v28 == 2 and l_name_0 ~= l_AvatarScreen_0.AvatarEditor then
                v20.navigate(l_AvatarScreen_0.AvatarEditor);
                v19.catalogToAvatarButton();
            end;
            return;
        end;
    end, {
        v20, 
        v18, 
        v19, 
        l_name_0
    });
    return v2.createElement(v3.Focusable.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v27
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        SegmentedControl = v2.createElement(l_SegmentedControl_0, {
            width = UDim.new(0, v16), 
            maxWidth = v23, 
            selectedTabIndex = v22, 
            onTabActivated = v29, 
            tabs = v25
        })
    });
end;