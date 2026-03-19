local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
local v2 = require(script.Parent.map);
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy)
    if #v3 == 0 then
        return "";
    else
        local v6 = v2(v3, function(v5) --[[ Line: 12 ]]
            return (tostring(v5));
        end);
        return table.concat(v6, v4 or ",");
    end;
end;