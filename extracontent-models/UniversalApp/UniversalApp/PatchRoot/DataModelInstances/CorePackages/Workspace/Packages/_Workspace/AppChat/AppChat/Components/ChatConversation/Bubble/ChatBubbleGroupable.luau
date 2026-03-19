local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.ChatBubbleEnum);
local v4 = require(l_Parent_0.Foundation);
local l_Image_0 = v4.Image;
local v8 = {
    alignment = Enum.HorizontalAlignment.Right, 
    children = {}, 
    imageStyle = {
        Color3 = Color3.new(0, 0, 0), 
        Transparency = 0
    }, 
    layoutOrder = 0, 
    onAbsoluteSizeChanged = function(_) --[[ Line: 33 ]] --[[ Name: onAbsoluteSizeChanged ]]

    end, 
    padding = 0, 
    position = UDim2.new(0, 0, 0, 0), 
    setContentWidth = function(_) --[[ Line: 36 ]] --[[ Name: setContentWidth ]]

    end, 
    variant = v3.BUBBLE_VARIANTS.SINGLE
};
ChatBubbleGroupable = function(v9) --[[ Line: 40 ]] --[[ Name: ChatBubbleGroupable ]]
    -- upvalues: v2 (copy), v8 (copy), v3 (copy), v1 (copy), l_Image_0 (copy), v4 (copy)
    local v10 = v2.Dictionary.union(v8, v9);
    local v11 = if v10.alignment == Enum.HorizontalAlignment.Left then v3.GROUPED_RECEIVED_BUBBLES else v3.GROUPED_OUTGOING_BUBBLES;
    local v12 = if v10.variant == v3.BUBBLE_VARIANTS.SINGLE then v3.GROUPED_BUBBLE_SINGLE else if v10.variant == v3.BUBBLE_VARIANTS.TOP then v11.BUBBLE_TOP else if v10.variant == v3.BUBBLE_VARIANTS.BOTTOM then v11.BUBBLE_BOTTOM else v11.BUBBLE_MIDDLE;
    return v1.createElement(l_Image_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Image = v12, 
        ScaleType = Enum.ScaleType.Slice, 
        slice = {
            center = v3.GROUPED_BUBBLE_SLICE_CENTER
        }, 
        imageStyle = v10.imageStyle, 
        Position = v10.position, 
        LayoutOrder = v10.layoutOrder, 
        onAbsoluteSizeChanged = v10.onAbsoluteSizeChanged
    }, v1.createElement(v4.View, {
        tag = "size-0 auto-xy", 
        BackgroundTransparency = 1, 
        padding = if typeof(v10.padding) == "table" then {
            top = v10.padding.top or UDim.new(0, 0), 
            bottom = v10.padding.bottom or UDim.new(0, 0), 
            left = v10.padding.left or UDim.new(0, 0), 
            right = v10.padding.right or UDim.new(0, 0)
        } else UDim2.fromOffset(v10.padding or 0, v10.padding or 0)
    }, v10.children));
end;
return v1.memo(ChatBubbleGroupable);