local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local l_useImpressionsTagger_0 = require(l_Parent_0.Impressions).useImpressionsTagger;
return v1.memo(function(v3) --[[ Line: 17 ]] --[[ Name: SduiFeedItem ]]
    -- upvalues: v1 (copy), l_useImpressionsTagger_0 (copy)
    local v4 = v1.useRef(nil);
    l_useImpressionsTagger_0(v4, v3.impressionsTag, v3.index);
    return v1.createElement("Frame", {
        ref = v4, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        SelectionGroup = true, 
        SelectionBehaviorLeft = v3.selectionBehaviorLeft, 
        SelectionBehaviorRight = v3.selectionBehaviorRight, 
        LayoutOrder = v3.layoutOrder, 
        ZIndex = v3.zIndex
    }, v3.children);
end);