local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.ChatBubbleEnum);
local v4 = require(l_Parent_0.Foundation);
local v5 = {
    isIncoming = false
};
RepliedToMarker = function(v6) --[[ Line: 32 ]] --[[ Name: RepliedToMarker ]]
    -- upvalues: v2 (copy), v5 (copy), v1 (copy), v4 (copy), v3 (copy)
    local v7 = v2.Dictionary.union(v5, v6);
    return v1.createElement(v4.View, {
        tag = "bg-shift-400 self-stretch", 
        Size = UDim2.new(0, v3.REPLIED_TO_MARKER_WIDTH, 0, 0), 
        BorderSizePixel = 0, 
        AnchorPoint = if v7.isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0), 
        LayoutOrder = v7.layoutOrder
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;
return v1.memo(RepliedToMarker);