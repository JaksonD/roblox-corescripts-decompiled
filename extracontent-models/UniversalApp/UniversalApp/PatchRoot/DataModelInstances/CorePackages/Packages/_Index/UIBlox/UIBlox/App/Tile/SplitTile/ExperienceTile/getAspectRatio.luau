local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Enum.AspectRatioMode);
local v2 = {
    [v1.Wide] = 0.5625, 
    [v1.Square] = 1
};
return function(v3) --[[ Line: 14 ]] --[[ Name: getAspectRatio ]]
    -- upvalues: v2 (copy)
    local v4 = v2[v3];
    if not v4 then
        error("Unkown aspect ratio " .. tostring(v3));
    end;
    return v4;
end;