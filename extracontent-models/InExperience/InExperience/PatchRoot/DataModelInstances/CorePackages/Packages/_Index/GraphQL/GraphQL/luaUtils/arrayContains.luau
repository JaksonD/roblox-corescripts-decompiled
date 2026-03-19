local v0 = require(script.Parent.deepEqual);
local v1 = require(script.Parent.deepContains);
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: v1 (copy), v0 (copy)
    for _, v6 in ipairs(v2) do
        if v4 then
            if v1(v6, v3) then
                return true;
            end;
        elseif v0(v6, v3) then
            return true;
        end;
    end;
    return false;
end;