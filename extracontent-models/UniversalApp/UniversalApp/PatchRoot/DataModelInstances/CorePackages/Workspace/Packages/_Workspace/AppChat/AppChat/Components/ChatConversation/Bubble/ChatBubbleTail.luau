local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.ChatBubbleEnum);
local v4 = {
    isIncoming = false, 
    imageColor = Color3.new(0, 0, 0), 
    imageTransparency = 0
};
ChatBubbleTail = function(v5) --[[ Line: 38 ]] --[[ Name: ChatBubbleTail ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v1 (copy)
    local v6 = v2.Dictionary.union(v4, v5);
    local v7 = if v6.isIncoming then v3.RECEIVED_TAIL else v3.SENT_TAIL;
    local v8 = if v6.isIncoming then UDim2.new(0, 0, 0, 0) else UDim2.new(1, 0, 0, 0);
    return v1.createElement("ImageLabel", {
        AnchorPoint = if v6.isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0), 
        Size = UDim2.new(0, v3.TAIL_WIDTH, 0, v3.TAIL_WIDTH), 
        BackgroundTransparency = 1, 
        ImageColor3 = v6.imageColor, 
        Position = v8, 
        Image = v7, 
        ImageTransparency = v6.imageTransparency
    });
end;
return v1.memo(ChatBubbleTail);