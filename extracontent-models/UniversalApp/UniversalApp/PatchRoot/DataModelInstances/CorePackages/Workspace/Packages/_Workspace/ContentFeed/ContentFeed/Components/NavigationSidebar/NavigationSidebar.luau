local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Icon_0 = v2.Icon;
local l_IconSize_0 = v2.Enums.IconSize;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v7) --[[ Line: 21 ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v8 = l_useTokens_0();
    return v1.createElement(l_View_0, {
        Position = v7.position, 
        tag = "align-x-center align-y-center anchor-center-left auto-xy bg-action-subtle col gap-medium items-center"
    }, {
        PreviousButton = v1.createElement(l_View_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            isDisabled = v7.isTerminalInitialPost, 
            onActivated = v7.onNavigateUp, 
            Position = UDim2.fromScale(0.5, 0.5), 
            tag = {
                ["auto-xy bg-action-standard padding-medium radius-circle"] = true, 
                ["bg-action-subtle"] = v7.isTerminalInitialPost
            }, 
            LayoutOrder = 1
        }, {
            CycleUpIcon = v1.createElement(l_Icon_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                IconSize = l_IconSize_0.Small, 
                name = "icons/actions/truncationCollapse", 
                Position = UDim2.fromScale(0.5, 0.5), 
                style = if v7.isTerminalInitialPost then v8.Color.None else v8.Color.ActionEmphasis.Foreground, 
                ZIndex = 2
            })
        }), 
        NextButton = v1.createElement(l_View_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            isDisabled = v7.isTerminalFinalPost, 
            onActivated = v7.onNavigateDown, 
            Position = UDim2.fromScale(0.5, 0.5), 
            tag = {
                ["auto-xy bg-action-standard padding-medium radius-circle"] = true, 
                ["bg-action-subtle"] = v7.isTerminalFinalPost
            }, 
            LayoutOrder = 2
        }, {
            CycleDownIcon = v1.createElement(l_Icon_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                IconSize = l_IconSize_0.Small, 
                name = "icons/actions/truncationExpand", 
                Position = UDim2.fromScale(0.5, 0.5), 
                style = if v7.isTerminalFinalPost then v8.Color.None else v8.Color.ActionEmphasis.Foreground, 
                ZIndex = 2
            })
        })
    });
end;