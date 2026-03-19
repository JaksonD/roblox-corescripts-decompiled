local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.useImpressionsTagger);
return function(v3) --[[ Line: 14 ]] --[[ Name: ImpressionsTagWrapper ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1.useRef(nil);
    v2(v4, v3.impressionsTag, v3.impressionsIndex);
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        LayoutOrder = v3.impressionsIndex, 
        ref = v4
    }, {
        ComponentWithImpressionsTag = v3.renderComponent()
    });
end;