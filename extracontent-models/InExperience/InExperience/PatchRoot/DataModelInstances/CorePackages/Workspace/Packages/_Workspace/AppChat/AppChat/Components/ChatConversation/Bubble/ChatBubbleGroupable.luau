local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.ChatBubbleEnum);
local v4 = require(l_Parent_0.Foundation);
local l_Image_0 = v4.Image;
local v6 = game:DefineFastFlag("AppChatCorrectGroupedBubbleSlice", false);
local v9 = {
    alignment = Enum.HorizontalAlignment.Right, 
    children = {}, 
    imageStyle = {
        Color3 = Color3.new(0, 0, 0), 
        Transparency = 0
    }, 
    layoutOrder = 0, 
    onAbsoluteSizeChanged = function(_) --[[ Line: 34 ]] --[[ Name: onAbsoluteSizeChanged ]]

    end, 
    padding = 0, 
    position = UDim2.new(0, 0, 0, 0), 
    setContentWidth = function(_) --[[ Line: 37 ]] --[[ Name: setContentWidth ]]

    end, 
    variant = v3.BUBBLE_VARIANTS.SINGLE
};
ChatBubbleGroupable = function(v10) --[[ Line: 41 ]] --[[ Name: ChatBubbleGroupable ]]
    -- upvalues: v2 (copy), v9 (copy), v3 (copy), v1 (copy), l_Image_0 (copy), v6 (copy), v4 (copy)
    local v11 = v2.Dictionary.union(v9, v10);
    local v12 = if v11.alignment == Enum.HorizontalAlignment.Left then v3.GROUPED_RECEIVED_BUBBLES else v3.GROUPED_OUTGOING_BUBBLES;
    local v13 = if v11.variant == v3.BUBBLE_VARIANTS.SINGLE then v3.GROUPED_BUBBLE_SINGLE else if v11.variant == v3.BUBBLE_VARIANTS.TOP then v12.BUBBLE_TOP else if v11.variant == v3.BUBBLE_VARIANTS.BOTTOM then v12.BUBBLE_BOTTOM else v12.BUBBLE_MIDDLE;
    return v1.createElement(l_Image_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Image = v13, 
        ScaleType = Enum.ScaleType.Slice, 
        slice = if v6 then {
            center = v3.GROUPED_BUBBLE_SLICE_CENTER
        } else {
            center = v3.GROUPED_BUBBLE_SLICE_CENTER_DEPRECATED
        }, 
        imageStyle = v11.imageStyle, 
        Position = v11.position, 
        LayoutOrder = v11.layoutOrder, 
        onAbsoluteSizeChanged = v11.onAbsoluteSizeChanged
    }, v1.createElement(v4.View, {
        tag = "size-0 auto-xy", 
        BackgroundTransparency = 1, 
        padding = if typeof(v11.padding) == "table" then {
            top = v11.padding.top or UDim.new(0, 0), 
            bottom = v11.padding.bottom or UDim.new(0, 0), 
            left = v11.padding.left or UDim.new(0, 0), 
            right = v11.padding.right or UDim.new(0, 0)
        } else UDim2.fromOffset(v11.padding or 0, v11.padding or 0)
    }, v11.children));
end;
return v1.memo(ChatBubbleGroupable);