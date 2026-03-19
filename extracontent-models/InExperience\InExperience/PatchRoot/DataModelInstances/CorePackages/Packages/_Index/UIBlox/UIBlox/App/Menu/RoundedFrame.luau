local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.React);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local _ = require(l_Parent_0.Style.StyleTypes);
local v5 = {
    zIndex = 1
};
return function(v6) --[[ Line: 27 ]]
    -- upvalues: l_Object_0 (copy), v5 (copy), v2 (copy)
    local v7 = l_Object_0.assign({}, v5, v6);
    return v2.createElement("Frame", {
        ZIndex = v7.zIndex, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        TopContainer = v2.createElement("Frame", {
            Position = UDim2.fromScale(0, 0), 
            Size = UDim2.fromScale(1, 0.5), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1
        }, {
            Content = v2.createElement("Frame", {
                Position = UDim2.fromScale(0, 0), 
                Size = UDim2.fromScale(1, 2), 
                BackgroundColor3 = v7.background.Color, 
                BackgroundTransparency = v7.background.Transparency
            }, {
                UICorner = if v7.topCornerRadius then v2.createElement("UICorner", {
                    CornerRadius = v7.topCornerRadius
                }) else nil
            })
        }), 
        BottomContainer = v2.createElement("Frame", {
            Position = UDim2.fromScale(0, 0.5), 
            Size = UDim2.fromScale(1, 0.5), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1
        }, {
            Content = v2.createElement("Frame", {
                Position = UDim2.fromScale(0, -1), 
                Size = UDim2.fromScale(1, 2), 
                BackgroundColor3 = v7.background.Color, 
                BackgroundTransparency = v7.background.Transparency
            }, {
                UICorner = if v7.bottomCornerRadius then v2.createElement("UICorner", {
                    CornerRadius = v7.bottomCornerRadius
                }) else nil
            })
        })
    });
end;