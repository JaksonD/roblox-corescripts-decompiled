local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 12 ]] --[[ Name: Box ]]
    -- upvalues: v1 (copy)
    local v3 = if v2.children then table.clone(v2.children) else {};
    local v4 = table.clone(v2);
    v4.cornerRadius = nil;
    v4.padding = nil;
    v4.children = nil;
    local v5 = if typeof(v2.padding) == "number" then {
        PaddingBottom = UDim.new(0, v2.padding), 
        PaddingLeft = UDim.new(0, v2.padding), 
        PaddingRight = UDim.new(0, v2.padding), 
        PaddingTop = UDim.new(0, v2.padding)
    } else if typeof(v2.padding) == "table" then {
        PaddingTop = UDim.new(0, if v2.padding and v2.padding[1] then v2.padding[1] else 0), 
        PaddingRight = UDim.new(0, if v2.padding and v2.padding[2] then v2.padding[2] else 0), 
        PaddingBottom = UDim.new(0, if v2.padding and v2.padding[3] then v2.padding[3] else 0), 
        PaddingLeft = UDim.new(0, if v2.padding and v2.padding[4] then v2.padding[4] else 0)
    } else nil;
    if v5 then
        v3.Padding = v1.createElement("UIPadding", v5);
    end;
    if v2.cornerRadius then
        v3.Radius = v1.createElement("UICorner", {
            CornerRadius = v2.cornerRadius
        });
    end;
    return v1.createElement("Frame", v4, v3);
end;