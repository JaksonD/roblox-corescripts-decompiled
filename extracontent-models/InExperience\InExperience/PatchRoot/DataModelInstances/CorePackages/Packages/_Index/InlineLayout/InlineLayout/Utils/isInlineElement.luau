local l_Parent_0 = script:FindFirstAncestor("Utils").Parent;
local v1 = require(l_Parent_0.Components.InlineLayout.InlineLayoutElements.HardBreakElement);
local v2 = require(l_Parent_0.Utils.InlineElementType);
return function(v3) --[[ Line: 6 ]] --[[ Name: isInlineElement ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v3 == v1 then
        return true;
    elseif type(v3) == "table" then
        local v4 = getmetatable(v3);
        local v5 = false;
        if v4 ~= nil then
            v5 = v4.__type == v2;
        end;
        return v5;
    else
        return false;
    end;
end;