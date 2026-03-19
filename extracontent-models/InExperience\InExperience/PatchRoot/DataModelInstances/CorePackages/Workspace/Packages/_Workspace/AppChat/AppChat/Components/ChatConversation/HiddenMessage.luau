local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize);
local v5 = {
    isIncoming = false, 
    hasTail = false, 
    isPending = false, 
    isRepliedTo = false, 
    isPressed = false, 
    innerPadding = 0, 
    maxWidth = 180, 
    LayoutOrder = 0, 
    isLastMessageInMessageGroup = false
};
return function(v6) --[[ Line: 38 ]] --[[ Name: HiddenMessage ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v1 (copy), v4 (copy)
    local v7 = v2.Dictionary.union(v5, v6);
    local v8 = v3.Hooks.useTokens();
    return v1.createElement(v4, {
        isIncoming = v7.isIncoming, 
        hasTail = v7.hasTail, 
        isPending = v7.isPending, 
        isUnfiltered = false, 
        padding = {
            top = UDim.new(0, v8.Padding.Small), 
            bottom = UDim.new(0, v8.Padding.Small), 
            left = UDim.new(0, v8.Padding.Medium), 
            right = UDim.new(0, v8.Padding.Medium)
        }, 
        LayoutOrder = v7.LayoutOrder, 
        isRepliedTo = v7.isRepliedTo, 
        isPressed = v7.isPressed, 
        isLastMessageInMessageGroup = v7.isLastMessageInMessageGroup, 
        [v1.Change.AbsoluteSize] = v7[v1.Change.AbsoluteSize]
    }, {
        IconContainer = v1.createElement(v3.View, {
            tag = "row align-x-center align-y-center content-muted", 
            Size = UDim2.fromOffset(180 - v8.Padding.Medium * 2, 40 - v8.Padding.Small * 2)
        }, {
            LockIcon = v1.createElement(v3.Icon, {
                name = v3.Enums.IconName.LockClosed, 
                size = v3.Enums.IconSize.Medium, 
                variant = v3.Enums.IconVariant.Regular
            })
        })
    });
end;