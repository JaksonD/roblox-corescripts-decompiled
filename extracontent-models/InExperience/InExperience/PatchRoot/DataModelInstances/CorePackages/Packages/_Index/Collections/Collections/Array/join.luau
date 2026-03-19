local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local _ = require(l_Parent_1.ES7Types);
local v3 = require(l_Parent_0.map);
return function(v4, v5) --[[ Line: 22 ]]
    -- upvalues: v3 (copy)
    if #v4 == 0 then
        return "";
    else
        local v7 = v3(v4, function(v6) --[[ Line: 27 ]]
            return (tostring(v6));
        end);
        return table.concat(v7, v5 or ",");
    end;
end;