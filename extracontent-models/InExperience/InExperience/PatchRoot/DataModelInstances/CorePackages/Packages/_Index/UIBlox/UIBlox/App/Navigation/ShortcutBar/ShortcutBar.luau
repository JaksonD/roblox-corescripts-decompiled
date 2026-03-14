local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_1.UIBloxConfig);
local v5 = require(l_Parent_2.React);
local v6 = require(l_Parent_2.ReactOtter);
local v7 = require(l_Parent_2.Foundation);
local v8 = require(l_Parent_2.ReactUtils);
local l_useDelayedActionHandler_0 = v8.useDelayedActionHandler;
local l_useEventConnection_0 = v8.useEventConnection;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v12 = require(l_Parent_1.Core.Style.useStyle);
local _ = require(script.Parent.Types);
local v14 = require(script.Parent.Shortcut);
local v15 = require(l_Parent_1.Utility.useInputType);
local v16 = require(l_Parent_0.Utilities);
local _ = require(l_Parent_1.Enums.InputType);
local v18 = {
    dampingRatio = 2, 
    frequency = 3
};
local v19 = {
    items = {}, 
    spacingTop = 12, 
    spacingTrailing = 30, 
    spacingBottom = 12, 
    spacingLeading = 18, 
    itemsGap = 24, 
    itemIconLabelGap = 6, 
    actionTextSpacingLeading = 12
};
return function(v20) --[[ Line: 71 ]] --[[ Name: ShortcutBar ]]
    -- upvalues: l_Object_0 (copy), v19 (copy), v12 (copy), v7 (copy), v4 (copy), v5 (copy), v15 (copy), v6 (copy), l_useDelayedActionHandler_0 (copy), v18 (copy), v16 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy), v14 (copy)
    local v21 = l_Object_0.assign({}, v19, v20);
    local v22 = v12();
    local v23 = v7.Hooks.useTokens();
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    if v4.useTokenizedShortcutBar then
        v24 = v20.spacingTop or v23.Padding.Small;
        v25 = v20.spacingTrailing or v23.Padding.XLarge;
        v26 = v20.spacingBottom or v23.Padding.Small;
        v27 = v20.spacingLeading or v23.Padding.Medium;
        v28 = v20.itemsGap or v23.Gap.Large;
        v29 = v20.itemIconLabelGap or v23.Gap.XSmall;
        v30 = v20.actionTextSpacingLeading or v23.Padding.Small;
    end;
    local v31 = {
        UICorner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        Padding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v24 or v21.spacingTop), 
            PaddingRight = UDim.new(0, v25 or v21.spacingTrailing), 
            PaddingBottom = UDim.new(0, v26 or v21.spacingBottom), 
            PaddingLeft = UDim.new(0, v27 or v21.spacingLeading)
        }), 
        ListLayout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v28 or v21.itemsGap)
        })
    };
    local v32 = v15();
    local v33, v34 = v6.useAnimatedBinding(0);
    local v35 = l_useDelayedActionHandler_0(if v21.transitionDelaySeconds then v21.transitionDelaySeconds else 0, 0.1, function() --[[ Line: 114 ]]
        -- upvalues: v34 (copy), v6 (ref), v18 (ref)
        v34(v6.spring(0, v18));
    end);
    local function v36() --[[ Line: 119 ]] --[[ Name: onInputChanged ]]
        -- upvalues: v21 (copy), v34 (copy), v6 (ref), v18 (ref), v35 (copy)
        if v21.transitionDelaySeconds then
            v34(v6.spring(1, v18));
            v35();
        end;
    end;
    local v37, v38 = v5.useState(v16.filterItems(v21.items, v32));
    l_useEventConnection_0(l_UserInputService_0.InputChanged, v36);
    v5.useEffect(function() --[[ Line: 129 ]]
        -- upvalues: v38 (copy), v16 (ref), v21 (copy), v32 (copy)
        v38(v16.filterItems(v21.items, v32));
    end, {
        v32, 
        v21.items
    });
    for v39, v40 in ipairs(v37) do
        v31["Item" .. tostring(v39)] = v5.createElement(v14, {
            index = v39, 
            iconLabelGap = v29 or v21.itemIconLabelGap, 
            actionTextSpacingLeading = v30 or v21.actionTextSpacingLeading, 
            publicProps = v40
        });
    end;
    if #v37 > 0 then
        local l_Contrast_0 = v22.Tokens.Semantic.Color.BackgroundUi.Contrast;
        return v5.createElement("CanvasGroup", {
            Position = v21.position, 
            AnchorPoint = v21.anchorPoint, 
            BackgroundTransparency = 1, 
            GroupTransparency = if v21.transitionDelaySeconds then v33 else 0, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            ShortcutBarComponent = v5.createElement("Frame", {
                Size = UDim2.fromOffset(0, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Contrast_0.Color3, 
                BackgroundTransparency = l_Contrast_0.Transparency, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, v31)
        });
    else
        return nil;
    end;
end;