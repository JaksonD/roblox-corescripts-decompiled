local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_1.Foundation);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v7 = require(l_Parent_0.Core.Style.useStyle);
local _ = require(l_Parent_0.App.ImageSet.ImagesTypes);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local l_withHoverTooltip_0 = require(l_Parent_0.App.Dialog.TooltipV2.Controllers).withHoverTooltip;
local v11 = require(l_Parent_0.App.Dialog.Tooltip.Enum.TooltipOrientation);
local v12 = require(l_Parent_0.Core.Control.StateLayer);
local v13 = require(l_Parent_0.App.Indicator.Enum.BadgeVariant);
local v14 = require(l_Parent_0.Utility.migrateBadgeVariant);
local l_StatusIndicator_0 = v5.StatusIndicator;
local v16 = {
    badgeVariant = v13.Alert, 
    tooltipTarget = l_CoreGui_0, 
    disableOutset = false, 
    onMedia = false
};
return v3.forwardRef(function(v17, v18) --[[ Line: 60 ]] --[[ Name: UtilityActionIcon ]]
    -- upvalues: v4 (copy), v16 (copy), v7 (copy), v3 (copy), l_withHoverTooltip_0 (copy), v11 (copy), v12 (copy), l_Label_0 (copy), l_StatusIndicator_0 (copy), v14 (copy)
    local v19 = v4.Dictionary.join(v16, v17);
    local l_anchorPoint_0 = v19.anchorPoint;
    local l_position_0 = v19.position;
    local l_layoutOrder_0 = v19.layoutOrder;
    local l_icon_0 = v19.icon;
    local l_badgeValue_0 = v19.badgeValue;
    local l_badgeVariant_0 = v19.badgeVariant;
    local l_tooltipText_0 = v19.tooltipText;
    local l_tooltipTarget_0 = v19.tooltipTarget;
    local l_disableOutset_0 = v19.disableOutset;
    local l_onMedia_0 = v19.onMedia;
    local l_onActivated_0 = v19.onActivated;
    local l_Tokens_0 = v7().Tokens;
    local l_Size_500_0 = l_Tokens_0.Global.Size_500;
    local l_Medium_0 = l_Tokens_0.Semantic.Icon.Size.Medium;
    local v34 = if l_onMedia_0 then l_Tokens_0.Global.Color.White else l_Tokens_0.Semantic.Color.Icon.Emphasis;
    local v35 = if v19.iconColor then v19.iconColor else v34;
    local v36 = l_onMedia_0 and "Darken" or "Standard";
    local v37 = Vector2.new(0, 1);
    local v38 = UDim2.new(0.5, l_Tokens_0.Global.Size_25, 0.5, -l_Tokens_0.Global.Size_25);
    local v39 = v3.useMemo(function() --[[ Line: 86 ]]
        -- upvalues: l_disableOutset_0 (copy), l_Tokens_0 (copy)
        if l_disableOutset_0 then
            return nil;
        else
            return {
                top = UDim.new(0, l_Tokens_0.Global.Size_50), 
                right = UDim.new(0, l_Tokens_0.Global.Size_50), 
                bottom = UDim.new(0, l_Tokens_0.Global.Size_50), 
                left = UDim.new(0, l_Tokens_0.Global.Size_50)
            };
        end;
    end, {
        l_disableOutset_0, 
        l_Tokens_0
    });
    local v41 = v3.useMemo(function() --[[ Line: 97 ]]
        -- upvalues: l_Size_500_0 (copy), v39 (copy)
        local v40 = UDim.new(0, l_Size_500_0);
        if v39 then
            return (UDim2.new(v40 + v39.left + v39.right, v40 + v39.top + v39.bottom));
        else
            return (UDim2.new(v40, v40));
        end;
    end, {
        l_Size_500_0, 
        v39
    });
    return l_withHoverTooltip_0({
        bodyText = l_tooltipText_0
    }, {
        disabled = not l_tooltipText_0 or false, 
        preferredOrientation = v11.Bottom, 
        guiTarget = l_tooltipTarget_0, 
        DEBUG_useTargetDirectly = v19._DEBUG_is_plugin, 
        DisplayOrder = 10
    }, function(v42, v43) --[[ Line: 112 ]]
        -- upvalues: v3 (ref), v41 (copy), l_anchorPoint_0 (copy), l_position_0 (copy), l_layoutOrder_0 (copy), v18 (copy), l_onMedia_0 (copy), l_Size_500_0 (copy), l_Tokens_0 (copy), v12 (ref), v36 (copy), v39 (copy), l_onActivated_0 (copy), l_Label_0 (ref), l_Medium_0 (copy), l_icon_0 (copy), v35 (copy), l_badgeValue_0 (copy), l_StatusIndicator_0 (ref), v38 (copy), v37 (copy), v14 (ref), l_badgeVariant_0 (copy), v19 (copy)
        return v3.createElement("Frame", {
            Selectable = false, 
            Size = v41, 
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            [v3.Change.AbsoluteSize] = v42, 
            [v3.Change.AbsolutePosition] = v42, 
            ref = v18
        }, {
            Background = if l_onMedia_0 then v3.createElement("Frame", {
                Selectable = false, 
                Size = UDim2.fromOffset(l_Size_500_0, l_Size_500_0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Tokens_0.Global.Color.Black.Color3, 
                BackgroundTransparency = 0.5, 
                ZIndex = 1
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Circle)
                })
            }) else nil, 
            StateLayer = v3.createElement(v12, {
                size = UDim2.fromOffset(l_Size_500_0, l_Size_500_0), 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                cornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Circle), 
                zIndex = 2, 
                stateStyle = v36, 
                outset = v39, 
                onStateChanged = v43, 
                onActivated = l_onActivated_0
            }), 
            Icon = v3.createElement(l_Label_0, {
                Selectable = false, 
                Size = UDim2.fromOffset(l_Medium_0, l_Medium_0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = l_icon_0, 
                ImageColor3 = v35.Color3, 
                ImageTransparency = v35.Transparency, 
                BackgroundTransparency = 1, 
                ZIndex = 3
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Circle)
                }), 
                Badge = if l_badgeValue_0 then v3.createElement(l_StatusIndicator_0, {
                    Position = v38, 
                    AnchorPoint = v37, 
                    value = tonumber(l_badgeValue_0), 
                    variant = v14(l_badgeVariant_0), 
                    max = tonumber(l_badgeValue_0) and 99 or nil
                }) else nil
            }, v19.children)
        });
    end);
end);