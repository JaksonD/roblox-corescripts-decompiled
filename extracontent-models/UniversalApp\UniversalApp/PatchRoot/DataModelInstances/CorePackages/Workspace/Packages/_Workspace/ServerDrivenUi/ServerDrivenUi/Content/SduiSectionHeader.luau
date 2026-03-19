local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v4.Hooks.useTokens;
local l_View_0 = v4.View;
local v7 = require(l_Parent_0.Responsive);
local l_TooltipOrientation_0 = v3.App.Dialog.Enum.TooltipOrientation;
local l_IconWithTooltip_0 = require(l_Parent_0.AppBlox).IconWithTooltip;
local v10 = require(l_script_FirstAncestor_0.Content.SduiTextIconRow);
local l_Images_0 = require(l_Parent_0.FoundationImages).Images;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v13 = game:DefineFastFlag("AddLayoutOrderToSduiSectionHeaderIconComponent", false);
local v14 = game:DefineFastFlag("LuaAppSduiSeeAllArrowIconMigration2", false);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v2.memo(function(v16) --[[ Line: 87 ]] --[[ Name: SduiSectionHeader ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useTokens_0 (copy), v7 (copy), v14 (copy), l_GetImageData_0 (copy), l_Images_0 (copy), v13 (copy), v2 (copy), l_View_0 (copy), v10 (copy), l_IconWithTooltip_0 (copy), l_TooltipOrientation_0 (copy)
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    if l_FFlagSduiServerCompat_0 then
        v17 = v16.layoutOrder;
        v18 = v16.anchorPoint;
        v19 = v16.automaticSize;
        v20 = v16.size;
        v21 = v16.zIndex;
        v22 = v16.position;
    else
        v17 = v16.LayoutOrder;
        v18 = v16.AnchorPoint;
        v19 = v16.AutomaticSize;
        v20 = v16.Size;
        v21 = v16.ZIndex;
        v22 = v16.Position;
    end;
    local v23 = l_useTokens_0();
    local v24 = v16.titleFontStyle or v23.Typography.HeadingSmall;
    local v25 = v16.titleColor or v23.Color.Content.Emphasis;
    local v26 = v16.subtitleFontStyle or v23.Typography.BodyMedium;
    local v27 = v16.subtitleColor or v23.Color.Content.Default;
    local v28 = v16.verticalGap or v23.Gap.XXSmall;
    local l_Small_0 = v23.Gap.Small;
    local v30 = v16.titleGap or v23.Gap.XXSmall;
    local v31 = v16.titleIconWidth or v23.Size.Size_600;
    local v32 = v16.subtitleText ~= nil and v16.subtitleText ~= "" or v16.subtitleComponent ~= nil;
    local v33 = if v16.onSubtitleActivated then v16.onSubtitleActivated else v16.onTitleActivated;
    local v34 = v16.subtitleGap or v23.Gap.XXSmall;
    local v35 = v16.subtitleIconWidth or v23.Size.Size_400;
    local l_Size_700_0 = v23.Size.Size_700;
    local v37 = v7.usePreferredInput();
    local v38 = v16.allowInteractionForDirectionalInput or v37 ~= v7.Input.Directional;
    local v39 = v38 and (v16.infoText ~= nil or v16.iconComponent);
    local v40 = v38 and v16.onTitleActivated ~= nil;
    local v41 = v38 and (v40 or v16.onSubtitleActivated ~= nil);
    local v42 = nil;
    if v14 then
        v42 = v16.titleIcon;
        if v42 and (v42 == l_GetImageData_0("LuaApp/icons/GameDetails/navigation/pushRight_small") or v42 == l_Images_0["icons/navigation/pushRight_small"]) then
            v42 = l_Images_0["icons/actions/cycleRight"];
            v31 = v23.Size.Size_500;
            v30 = v23.Gap.XSmall;
        end;
    end;
    local v43 = if v13 and v16.iconComponent then v2.createElement(l_View_0, {
        tag = "auto-xy", 
        LayoutOrder = 2
    }, {
        IconComponent = v16.iconComponent
    }) else v16.iconComponent;
    return v2.createElement("Frame", {
        Position = v22, 
        AnchorPoint = v18, 
        AutomaticSize = v19 or Enum.AutomaticSize.Y, 
        Size = v20 or UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v17, 
        ZIndex = v21, 
        [v2.Tag] = if v16.testId then ("data-testid=%*"):format(v16.testId) else nil
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_Small_0), 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        LeftContentFrame = v2.createElement(v40 and "TextButton" or "Frame", {
            LayoutOrder = 1, 
            Text = v40 and "" or nil, 
            TextTransparency = v40 and 1 or nil, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutoButtonColor = not v40 and nil, 
            [v2.Event.Activated] = if v40 then v16.onTitleActivated else nil, 
            Active = v40, 
            Selectable = v40
        }, {
            UIFlexItem = v2.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Shrink
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                HorizontalFlex = Enum.UIFlexAlignment.Fill, 
                SortOrder = Enum.SortOrder.Name, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v28), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            ContentRow1 = v16.titleComponent or v2.createElement(v10, {
                gap = v30, 
                text = v16.titleText, 
                fontStyle = v24, 
                textColor = v25.Color3, 
                textFlexMode = Enum.UIFlexMode.Shrink, 
                icon = if v38 then if v14 then v42 else v16.titleIcon else nil, 
                iconWidth = v31, 
                iconColor = v25.Color3, 
                Selectable = if not l_FFlagSduiServerCompat_0 then v40 else nil, 
                selectable = if l_FFlagSduiServerCompat_0 then v40 else nil, 
                testId = "--sdui-section-header-title"
            }) or nil, 
            ContentRow2 = v16.subtitleComponent or v32 and v2.createElement(v10, {
                onActivated = v33, 
                gap = v34, 
                text = v16.subtitleText, 
                fontStyle = v26, 
                textColor = v27.Color3, 
                textFlexMode = Enum.UIFlexMode.Shrink, 
                icon = if v38 then v16.subtitleIcon else nil, 
                iconWidth = v35, 
                iconColor = v27.Color3, 
                Selectable = if not l_FFlagSduiServerCompat_0 then v41 else nil, 
                selectable = if l_FFlagSduiServerCompat_0 then v41 else nil, 
                testId = "--sdui-section-header-subtitle"
            }) or nil
        }), 
        IconWithTooltip = v43 or v39 and v16.infoText and v2.createElement(l_IconWithTooltip_0, {
            layoutOrder = 2, 
            tooltipOrientation = l_TooltipOrientation_0.Bottom, 
            hoverText = v16.infoText, 
            triggerPointName = "IconWithTooltip", 
            onActivateTooltip = v16.onInfoIconActivated, 
            supportVR = true, 
            supportTenFootUi = true, 
            size = UDim2.new(0, l_Size_700_0, 0, l_Size_700_0), 
            position = if v32 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0), 
            anchorPoint = if v32 then Vector2.new(1, 0) else Vector2.new(1, 0.5)
        }) or nil
    });
end);