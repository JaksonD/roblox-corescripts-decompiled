local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_ItemCardFooter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardFooter;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useTokens_0 = v3.Hooks.useTokens;
local _ = require(script.Parent.useSettingsTileProps);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local function v13(v12) --[[ Line: 25 ]] --[[ Name: selectDeviceOrientation ]]
    return v12.DeviceOrientation;
end;
return v2.forwardRef(function(v14, v15) --[[ Line: 29 ]] --[[ Name: AvatarSwitcherSettingsTile ]]
    -- upvalues: l_useTokens_0 (copy), l_useSelector_0 (copy), v13 (copy), v6 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_useLocalization_0 (copy), v2 (copy), v3 (copy), v10 (copy), l_ItemCardFooter_0 (copy)
    local v16 = l_useTokens_0();
    local v17 = l_useSelector_0(v13) == v6.Keys.Portrait;
    local v18 = nil;
    if l_FFlagAXRootSlotBasedEditorFlag_0 then
        v18 = l_useLocalization_0({
            label = "Feature.Avatar.Label.AddEdit"
        });
    end;
    return v2.createElement(v3.View, {
        tag = "auto-xy clip", 
        Size = if v14.squareAspectRatio then UDim2.fromOffset(v14.itemWidth, v14.itemWidth) else UDim2.fromOffset(v14.itemWidth, v14.itemWidth * 2)
    }, {
        AspectRatio = v2.createElement("UIAspectRatioConstraint", {
            AspectRatio = if v14.squareAspectRatio then v10.ItemTileSquareAspectRatio else v10.ItemTileTallAspectRatio, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        ItemCardFooterLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v16.Gap.Small)
        }), 
        SettingsTileContent = v2.createElement(v3.View, {
            tag = "clip auto-xy size-full-full", 
            Size = UDim2.fromOffset(v14.itemWidth, v14.itemWidth), 
            cornerRadius = UDim.new(0, v16.Semantic.Radius.Medium), 
            onActivated = v14.onActivated, 
            backgroundStyle = v16.Semantic.Color.Common.Placeholder, 
            ref = v15, 
            LayoutOrder = l_FFlagAXRootSlotBasedEditorFlag_0 and 1 or nil
        }, {
            SettingsTileIcon = v2.createElement(v3.Icon, {
                name = "icons/common/plus", 
                style = v16.Color.Content.Muted, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            })
        }), 
        FooterSlot = if l_FFlagAXRootSlotBasedEditorFlag_0 then v2.createElement(l_ItemCardFooter_0, {
            title = v18.label, 
            titleTextSize = if v17 then v16.Typography.BodySmall else nil, 
            LayoutOrder = 2
        }) else nil
    });
end);