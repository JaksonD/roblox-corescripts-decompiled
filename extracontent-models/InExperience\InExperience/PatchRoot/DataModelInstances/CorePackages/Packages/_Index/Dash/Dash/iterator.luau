local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 13 ]] --[[ Name: iterator ]]
    if typeof(v2) == "function" then
        return v2;
    elseif typeof(v2) == "table" then
        if #v2 > 0 then
            return ipairs(v2);
        else
            return pairs(v2);
        end;
    else
        return nil;
    end;
end;