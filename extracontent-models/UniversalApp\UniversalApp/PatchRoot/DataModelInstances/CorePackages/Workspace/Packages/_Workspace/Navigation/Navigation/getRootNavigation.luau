local _ = require(script.Parent.types);
local function v1(v2) --[[ Line: 4 ]] --[[ Name: getRootNavigation ]]
    -- upvalues: v1 (copy)
    local v3 = v2._dangerouslyGetParent();
    if v3 then
        return (v1(v3));
    else
        return v2;
    end;
end;
return v1;