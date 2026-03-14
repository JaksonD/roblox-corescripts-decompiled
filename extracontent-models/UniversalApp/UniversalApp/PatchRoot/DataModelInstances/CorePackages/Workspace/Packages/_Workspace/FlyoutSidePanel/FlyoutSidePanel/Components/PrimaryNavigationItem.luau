local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Text_0 = v2.Text;
local l_Icon_0 = v2.Icon;
local l_IconSize_0 = v2.Enums.IconSize;
local l_StatusIndicator_0 = v2.StatusIndicator;
local l_StatusIndicatorVariant_0 = v2.Enums.StatusIndicatorVariant;
local l_Flags_0 = v2.Utility.Flags;
local v10 = require(script.Parent.Parent.Constants);
return function(v11) --[[ Line: 22 ]] --[[ Name: PrimaryNavigationItem ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v2 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy), l_StatusIndicator_0 (copy), l_Flags_0 (copy), l_StatusIndicatorVariant_0 (copy), v10 (copy)
    local v12 = l_useTokens_0();
    return v1.createElement(v2.View, {
        tag = "size-full-0 auto-y", 
        LayoutOrder = v11.layoutOrder
    }, {
        PrimaryNavigationButton = v1.createElement("TextButton", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Text = "", 
            [v1.Event.Activated] = v11.onActivated
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v12.Gap.Small)
            }), 
            IconContainer = if v11.icon then v1.createElement(v2.View, {
                tag = "auto-xy padding-small", 
                LayoutOrder = 1
            }, {
                Icon = v1.createElement(l_Icon_0, {
                    style = v12.Color.Content.Emphasis, 
                    name = v11.icon, 
                    size = l_IconSize_0.Medium
                })
            }) else nil, 
            Text = if v11.text then v1.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v11.text, 
                tag = "auto-xy padding-y-small text-align-x-left text-truncate-end text-title-large text-wrap content-emphasis"
            }) else nil
        }), 
        StatusIndicator = if v11.notificationCount then v1.createElement(l_StatusIndicator_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -v12.Gap.Medium, 0.5, 0), 
            LayoutOrder = 3, 
            value = v11.notificationCount, 
            variant = if l_Flags_0.FoundationStatusIndicatorVariantExperiment then l_StatusIndicatorVariant_0.Contrast_Experiment else l_StatusIndicatorVariant_0.Emphasis, 
            max = v10.MAX_SHOWN_STATUS_INDICATOR_COUNT
        }) else nil
    });
end;