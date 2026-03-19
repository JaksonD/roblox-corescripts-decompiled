local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_TooltipOrientation_0 = v4.App.Dialog.Enum.TooltipOrientation;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_IconWithTooltip_0 = require(l_Parent_0.AppBlox).IconWithTooltip;
local v10 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v10.usePreferredInput;
local v12 = require(l_script_FirstAncestor_0.checkAndFormatPossibleLink);
local _ = require(l_script_FirstAncestor_0.SeeAllButtonType_Legacy);
local v14 = l_Images_0["icons/actions/truncationCollapse_small"];
local v15 = l_Images_0["icons/actions/cycleRight"];
local v16 = {
    AutomaticSize = Enum.AutomaticSize.Y, 
    Size = UDim2.new(1, 0, 0, 0), 
    tooltipSupportsVR = true, 
    tooltipSupportsTenFootUi = true
};
local function v22(v17) --[[ Line: 79 ]] --[[ Name: HeaderButton ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy)
    local v18 = l_useDesignTokens_0();
    local l_Size_200_0 = v18.Global.Size_200;
    local l_Emphasis_0 = v18.Semantic.Color.Text.Emphasis;
    local l_image_0 = v17.image;
    return v2.createElement(l_ImageSetLabel_0, {
        Size = v17.Size or UDim2.new(0, l_Size_200_0, 0, l_Size_200_0), 
        BackgroundTransparency = 1, 
        Image = l_image_0, 
        ImageColor3 = l_Emphasis_0.Color3, 
        ImageTransparency = l_Emphasis_0.Transparency, 
        LayoutOrder = v17.LayoutOrder, 
        Rotation = v17.Rotation, 
        AnchorPoint = v17.AnchorPoint, 
        Position = v17.Position
    });
end;
return v2.memo(function(v23) --[[ Line: 106 ]] --[[ Name: CollectionHeader ]]
    -- upvalues: v3 (copy), v16 (copy), v2 (copy), l_usePreferredInput_0 (copy), l_useDesignTokens_0 (copy), v10 (copy), v12 (copy), v22 (copy), v15 (copy), v14 (copy), l_IconWithTooltip_0 (copy), l_TooltipOrientation_0 (copy)
    local v24 = v3.Dictionary.join(v16, v23);
    local v25, v26 = v2.useBinding(0);
    local v28 = v2.useCallback(function(v27) --[[ Line: 110 ]]
        -- upvalues: v26 (copy)
        v26(v27.AbsoluteSize.X);
    end, {});
    local v29 = l_usePreferredInput_0();
    local v30 = l_useDesignTokens_0();
    local v31 = v24.titleTypography or v30.Semantic.Typography.Header;
    local v32 = v24.titleColor or v30.Semantic.Color.Text.Emphasis;
    local v33 = v24.subtitleTypography or v30.Semantic.Typography.CaptionBody;
    local v34 = v24.subtitleTypography and v24.subtitleTypography.FontSize or 17.64 * v30.Global.Stroke_100;
    local v35 = v24.subtitleColor or v30.Semantic.Color.Text.Default;
    local l_Space_25_0 = v30.Global.Space_25;
    local l_Space_150_0 = v30.Global.Space_150;
    local v38 = not v24.hideButton and v29 ~= v10.Input.Directional and v24.onActivate and true or false;
    local l_Size_350_0 = v30.Global.Size_350;
    local l_Space_50_0 = v30.Global.Space_50;
    local l_Size_250_0 = v30.Global.Size_250;
    local v42 = v24.tooltipInfoText ~= nil;
    local v43 = if v38 then l_Size_250_0 else 0;
    local v44 = if v42 then l_Size_350_0 + l_Space_150_0 else 0;
    local v45 = if v42 then v44 else 0;
    local v46 = false;
    if v24.subtitle ~= nil then
        v46 = v24.subtitle ~= "";
    end;
    local v47, v48 = v12(v24.subtitle);
    local v49 = if v24.onActivateSubtitle then v24.onActivateSubtitle else v24.onActivate;
    if v24.onActivateSubtitle then
        v47 = true;
    end;
    local l_Size_125_0 = v30.Global.Size_125;
    local v51 = if v47 then l_Size_125_0 else 0;
    local v52 = v47 and v49 ~= nil;
    return v2.createElement("Frame", {
        Position = v24.Position, 
        AutomaticSize = v24.AutomaticSize, 
        Size = v24.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v24.LayoutOrder, 
        ZIndex = v24.ZIndex, 
        [v2.Change.AbsoluteSize] = v28
    }, {
        LeftContentFrame = v2.createElement(v38 and "TextButton" or "Frame", {
            Text = v38 and "" or nil, 
            Size = UDim2.new(1, -v45, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            AnchorPoint = v24.AnchorPoint, 
            BorderSizePixel = 0, 
            AutoButtonColor = not v38 and nil, 
            [v2.Event.Activated] = if v38 then v24.onActivate else nil, 
            Active = v38, 
            Selectable = v38
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, l_Space_25_0), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            TitleContainer = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, l_Space_50_0), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Title = if typeof(v24.title) == "string" then v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = v24.title, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    Font = v31.Font, 
                    TextSize = v31.FontSize, 
                    TextTransparency = v32.Transparency, 
                    TextColor3 = v32.Color3, 
                    TextWrapped = false, 
                    TextTruncate = Enum.TextTruncate.SplitWord, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }, {
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = v25:map(function(v53) --[[ Line: 228 ]]
                            -- upvalues: v43 (copy), v44 (copy)
                            local v54 = v53 - v43 - v44;
                            if v54 > 0 then
                                return Vector2.new(v54, 1e999);
                            else
                                return nil;
                            end;
                        end)
                    })
                }) else if typeof(v24.title) == "function" then v24.title() else nil, 
                SeeAllButton = v38 and v2.createElement(v22, {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(l_Size_250_0, l_Size_250_0), 
                    image = v15
                }) or nil
            }), 
            SubtitleFrame = v46 and v2.createElement(v52 and "TextButton" or "Frame", {
                LayoutOrder = 2, 
                Text = v52 and "" or nil, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutoButtonColor = not v52 and nil, 
                [v2.Event.Activated] = if v52 then v49 else nil, 
                Active = v52, 
                Selectable = v52
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, v30.Global.Size_25), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Subtitle = v2.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Text = v48, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    Font = v33.Font, 
                    TextSize = v34, 
                    TextTransparency = v32.Transparency, 
                    TextColor3 = v35.Color3, 
                    TextWrapped = false, 
                    TextTruncate = Enum.TextTruncate.SplitWord, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    RichText = v47
                }, {
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = v25:map(function(v55) --[[ Line: 282 ]]
                            -- upvalues: v51 (copy)
                            local v56 = v55 - v51;
                            if v56 > 0 then
                                return Vector2.new(v56, 1e999);
                            else
                                return nil;
                            end;
                        end)
                    })
                }), 
                SubtitleLinkArrow = not (not v47 or v38) and v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(v51, v51), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true
                }, {
                    Icon = v2.createElement(v22, {
                        image = v14, 
                        Size = UDim2.new(1, v30.Global.Size_25, 1, v30.Global.Size_25), 
                        Rotation = 90, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                }) or nil
            }) or nil
        }), 
        IconWithTooltip = v42 and v2.createElement(l_IconWithTooltip_0, {
            tooltipOrientation = l_TooltipOrientation_0.Bottom, 
            hoverText = v24.tooltipInfoText, 
            triggerPointName = "IconWithTooltip", 
            onActivateTooltip = v24.onActivateInfoIcon, 
            supportVR = v24.tooltipSupportsVR, 
            supportTenFootUi = v24.tooltipSupportsTenFootUi, 
            size = UDim2.new(0, l_Size_350_0, 0, l_Size_350_0), 
            position = if v46 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0), 
            anchorPoint = if v46 then Vector2.new(1, 0) else Vector2.new(1, 0.5)
        }) or nil
    });
end);