local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v6(v5) --[[ Line: 12 ]] --[[ Name: getPadding ]]
    -- upvalues: v3 (copy)
    if v3.isBinding(v5) then
        return {
            PaddingTop = v5, 
            PaddingBottom = v5, 
            PaddingLeft = v5, 
            PaddingRight = v5
        };
    elseif typeof(v5) == "table" then
        return {
            PaddingTop = v5.top, 
            PaddingBottom = v5.bottom, 
            PaddingLeft = v5.left, 
            PaddingRight = v5.right
        };
    elseif typeof(v5) == "number" then
        return {
            PaddingTop = UDim.new(0, v5), 
            PaddingBottom = UDim.new(0, v5), 
            PaddingLeft = UDim.new(0, v5), 
            PaddingRight = UDim.new(0, v5)
        };
    elseif typeof(v5) == "Vector2" then
        return {
            PaddingTop = UDim.new(0, v5.Y), 
            PaddingBottom = UDim.new(0, v5.Y), 
            PaddingLeft = UDim.new(0, v5.X), 
            PaddingRight = UDim.new(0, v5.X)
        };
    elseif typeof(v5) == "UDim" then
        return {
            PaddingTop = v5, 
            PaddingBottom = v5, 
            PaddingLeft = v5, 
            PaddingRight = v5
        };
    elseif typeof(v5) == "UDim2" then
        return {
            PaddingTop = v5.Y, 
            PaddingBottom = v5.Y, 
            PaddingLeft = v5.X, 
            PaddingRight = v5.X
        };
    else
        return {};
    end;
end;
return v2.memo(function(v7) --[[ Line: 70 ]] --[[ Name: Padding ]]
    -- upvalues: v6 (copy), v2 (copy)
    local v8 = v6(v7.value);
    return v2.createElement("UIPadding", v8);
end);