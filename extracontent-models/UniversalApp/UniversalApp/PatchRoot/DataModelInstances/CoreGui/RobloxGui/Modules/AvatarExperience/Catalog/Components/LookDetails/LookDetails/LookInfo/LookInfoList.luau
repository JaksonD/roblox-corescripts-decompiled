local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoRow);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v11 = require(l_Modules_0.LuaApp.AppPage);
local v12 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableShowRobloxAsLookCreator);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableHideRobloxCreatorOnDetailsPage);
return (v2.forwardRef(function(v17, _) --[[ Line: 39 ]]
    -- upvalues: v16 (copy), v8 (copy), v15 (copy), v12 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), v2 (copy), v7 (copy), v10 (copy), v9 (copy), v11 (copy), l_Focusable_0 (copy), v14 (copy), v6 (copy)
    local v19 = nil;
    if v17.lookDetails and v17.lookDetails.curator then
        v19 = v17.lookDetails.curator;
    end;
    local v20 = v19 and v19.id;
    local v21 = v19 and v19.type;
    local v22 = nil;
    v22 = if v16() then v19 and v19.name and v19.name:lower() ~= v8.RobloxCreatorName:lower() else v19 and v19.name and (v15() or v19.name:lower() ~= v8.RobloxCreatorName:lower());
    local v23 = v17.lookDetails and v17.lookDetails.totalValue or "";
    local v25 = v12(function(v24) --[[ Line: 58 ]]
        return v24.getWebViewSupport();
    end);
    local v26 = l_useNavigation_0();
    local l_isTryOn_0 = v17.isTryOn;
    local v28 = l_useDispatch_0();
    local v30 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v20 (copy), v21 (copy), v7 (ref), v10 (ref), l_isTryOn_0 (copy), v28 (copy), v9 (ref), v11 (ref), v26 (copy)
        if v20 then
            local v29 = if v21 == v7.CreatorType.Group then v10.user.group({
                groupId = v20
            }) else v10.user.profile({
                userId = v20
            });
            if l_isTryOn_0 then
                v28(v9({
                    name = v11.GenericWebPage, 
                    detail = v29, 
                    extraProps = {
                        titleKey = "CommonUI.Features.Label.Profile"
                    }
                }));
                return;
            else
                v26.navigate(v11.GenericWebPage, {
                    detail = v29, 
                    extraProps = {
                        titleKey = "CommonUI.Features.Label.Profile"
                    }
                });
            end;
        end;
    end, {
        v20, 
        v21, 
        l_isTryOn_0, 
        v28
    });
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v17.LayoutOrder
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = if v14() then v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v17.innerPadding), 
            PaddingRight = UDim.new(0, v17.innerPadding)
        }) else nil, 
        Curator = if v22 then v2.createElement(v6, {
            infoName = "Feature.Avatar.Label.By", 
            infoData = v19.name, 
            onActivate = if not v25 or v17.disableInteractions then nil else v30, 
            hasVerifiedBadge = if v19 then v19.hasVerifiedBadge else false, 
            LayoutOrder = 2
        }) else nil, 
        TotalValue = v2.createElement(v6, {
            infoName = "Feature.Catalog.Label.Filter.TotalValue", 
            infoData = v7.RobloxEmoji.Robux .. v23, 
            LayoutOrder = 3
        })
    });
end));