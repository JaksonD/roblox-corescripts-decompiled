local l_Parent_0 = script:FindFirstAncestor("LandingPage").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
return function(v3) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v3.totalAvatars == 0 then
        return v1.createElement(v2.View, {
            tag = "row gap-small align-x-center auto-xy padding-y-small", 
            LayoutOrder = v3.LayoutOrder or 0
        });
    else
        local v4 = {};
        for v5 = 1, v3.totalAvatars do
            v4[v5] = v1.createElement("Frame", {
                Size = UDim2.new(0, 8, 0, 8), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                Transparency = v5 == v3.highlightedIndex and 0 or 0.6, 
                BorderSizePixel = 0
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            });
        end;
        return v1.createElement(v2.View, {
            tag = "row gap-small align-x-center size-full-0 padding-bottom-large", 
            LayoutOrder = v3.LayoutOrder or 0
        }, v4);
    end;
end;