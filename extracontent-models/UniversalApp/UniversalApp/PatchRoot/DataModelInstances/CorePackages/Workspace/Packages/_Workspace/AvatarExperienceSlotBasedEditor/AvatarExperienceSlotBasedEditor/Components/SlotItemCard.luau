local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.React);
local l_AXTooltip_0 = require(l_Parent_0.AXCommon).Components.AXTooltip;
local v3 = require(l_Parent_0.AvatarExperienceUIKit);
local l_ItemCard_0 = v3.ItemCardComponents.ItemCard;
local l_ItemCardHeader_0 = v3.ItemCardComponents.ItemCardHeader;
local v6 = require(script.Parent.SlotItemCardFooter);
local v7 = require(l_Parent_0.Foundation);
local l_View_0 = v7.View;
local l_useTokens_0 = v7.Hooks.useTokens;
local v10 = require(l_Parent_0.ReactOtter);
local l_FFlagAXSlotBasedEditorCategoryTooltip_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXSlotBasedEditorCategoryTooltip;
local v12 = game:DefineFastString("AXSlotBasedEditorCategoryTooltipKey", "SlotEditorSecondCategory");
local v13 = {
    dampingRatio = 1, 
    frequency = 1
};
return (v1.forwardRef(function(v14, v15) --[[ Line: 45 ]]
    -- upvalues: l_useTokens_0 (copy), v10 (copy), v1 (copy), v7 (copy), v13 (copy), l_FFlagAXSlotBasedEditorCategoryTooltip_0 (copy), l_ItemCard_0 (copy), l_ItemCardHeader_0 (copy), l_View_0 (copy), l_AXTooltip_0 (copy), v12 (copy), v6 (copy)
    local v16 = l_useTokens_0();
    local v17, v18 = v10.useAnimatedBinding(1);
    local v19, v20 = v1.useState(false);
    local v22 = v1.useCallback(function(v21) --[[ Line: 51 ]]
        -- upvalues: v7 (ref), v20 (copy)
        if v21 == v7.Enums.ControlState.Default then
            v20(false);
            return;
        else
            if v21 == v7.Enums.ControlState.Hover then
                v20(true);
            end;
            return;
        end;
    end, {});
    v1.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v19 (copy), v16 (copy), v18 (copy), v10 (ref), v13 (ref)
        local v23 = if v19 then v16.Color.Stroke.Emphasis.Transparency else 1;
        v18(v10.spring(v23, v13));
    end, {
        v19
    });
    local v24 = nil;
    local v25 = nil;
    if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then
        v24 = v1.createRef();
        v25 = v1.useCallback(function() --[[ Line: 70 ]]
            -- upvalues: v24 (ref), v14 (copy)
            if v24.current then
                v24.current();
            end;
            if v14.onActivated then
                v14.onActivated();
            end;
        end, {
            v14.onActivated
        });
    end;
    return v1.createElement(l_ItemCard_0, {
        Size = v14.Size or UDim2.fromOffset(v16.Size.Size_2500, 0), 
        LayoutOrder = v14.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        onActivated = if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then v25 else v14.onActivated, 
        ref = v15, 
        headerSlot = v1.createElement(l_ItemCardHeader_0, {
            LayoutOrder = 1, 
            BackgroundTransparency = 1
        }, v1.createElement(l_View_0, {
            onStateChanged = v22, 
            stateLayer = {
                affordance = v7.Enums.StateLayerAffordance.None
            }, 
            onActivated = if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then v25 else v14.onActivated, 
            Size = UDim2.fromScale(1, 1), 
            backgroundStyle = {
                Transparency = 1
            }, 
            selection = {
                Selectable = false
            }, 
            padding = {
                top = UDim.new(0, v16.Padding.XXSmall), 
                bottom = UDim.new(0, v16.Padding.XXSmall), 
                left = UDim.new(0, v16.Padding.XXSmall), 
                right = UDim.new(0, v16.Padding.XXSmall)
            }
        }, {
            CornerRadius = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, v16.Semantic.Radius.Medium)
            }), 
            HeaderSlot = v14.renderHeaderSlot(), 
            HoverFrame = v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2, 
                BackgroundTransparency = v17
            }, {
                CornerRadius = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v16.Semantic.Radius.Medium)
                })
            }), 
            BorderFrame = v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v16.Color.Surface.Surface_200.Color3, 
                BackgroundTransparency = v14.BackgroundTransparency or 0
            }, {
                CornerRadius = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v16.Semantic.Radius.Medium)
                }), 
                Stroke = v1.createElement("UIStroke", {
                    Color = v16.Color.Stroke.Default.Color3, 
                    Transparency = if v14.isActive then v16.Color.Selection.End.Transparency else v16.Color.State.Press.Transparency, 
                    Thickness = v16.Stroke.Thick
                })
            }), 
            AXTooltip = l_FFlagAXSlotBasedEditorCategoryTooltip_0 and v1.createElement(l_AXTooltip_0, {
                popoverSide = "Top", 
                tooltipLocalizationKey = "Feature.Avatar.Tooltip.CustomizeOverhaulSubcategories", 
                tooltipStorageKey = v12, 
                dismissTooltipRef = v24, 
                showTooltip = v14.showSecondCategoryTooltip
            })
        })), 
        footerSlot = v1.createElement(v6, {
            LayoutOrder = 2, 
            title = v14.title, 
            TextXAlignment = Enum.TextXAlignment.Center
        })
    });
end));