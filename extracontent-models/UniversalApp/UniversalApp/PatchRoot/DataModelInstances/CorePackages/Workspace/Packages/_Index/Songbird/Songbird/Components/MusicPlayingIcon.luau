local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Components.AnimatedBar);
local v4 = {
    numAnimatedBars = 5, 
    isMoving = true
};
local v5 = {
    0.4, 
    0.3, 
    0.75, 
    0.55
};
return function(v6) --[[ Line: 27 ]] --[[ Name: MusicPlayingIcon ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy), v5 (copy)
    local v7 = v1.Dictionary.join(v4, v6);
    local v8 = 8 / v7.numAnimatedBars;
    local v9 = {};
    for v10 = 1, v7.numAnimatedBars do
        v9[("Bar%*"):format(v10)] = v2.createElement(v3, {
            layoutOrder = v10, 
            width = UDim.new(1 / (v7.numAnimatedBars * 1.3), -v8), 
            heightRange = v7.heightRange, 
            isMoving = v7.isMoving, 
            staticHeight = v5[v10]
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ZIndex = v7.zIndex
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v8)
        })
    }, v9);
end;