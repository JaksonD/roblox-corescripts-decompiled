local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewChatBubbleUI);
local v7 = {
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
return function(v8) --[[ Line: 40 ]] --[[ Name: HiddenMessage ]]
    -- upvalues: v3 (copy), v7 (copy), v4 (copy), v2 (copy), v5 (copy), v6 (copy)
    local v9 = v3.Dictionary.union(v7, v8);
    local v10 = v4.Hooks.useTokens();
    return v2.createElement(v5, {
        isIncoming = v9.isIncoming, 
        hasTail = v9.hasTail, 
        isPending = v9.isPending, 
        isUnfiltered = false, 
        padding = if v6 then {
            top = UDim.new(0, v10.Padding.Small), 
            bottom = UDim.new(0, v10.Padding.Small), 
            left = UDim.new(0, v10.Padding.Medium), 
            right = UDim.new(0, v10.Padding.Medium)
        } else v10.Padding.Small, 
        LayoutOrder = v9.LayoutOrder, 
        isRepliedTo = v9.isRepliedTo, 
        isPressed = v9.isPressed, 
        isLastMessageInMessageGroup = v9.isLastMessageInMessageGroup, 
        [v2.Change.AbsoluteSize] = v9[v2.Change.AbsoluteSize]
    }, {
        IconContainer = v2.createElement(v4.View, {
            tag = "row align-x-center align-y-center content-muted", 
            Size = UDim2.fromOffset(180 - v10.Padding.Medium * 2, 40 - v10.Padding.Small * 2)
        }, {
            LockIcon = v2.createElement(v4.Icon, {
                name = v4.Enums.IconName.LockClosed, 
                size = v4.Enums.IconSize.Medium, 
                variant = v4.Enums.IconVariant.Regular
            })
        })
    });
end;