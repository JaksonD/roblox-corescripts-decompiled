local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.getCaptureMetadata);
local _ = require(l_Parent_0.Types);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local v4 = v1(v3);
    if v4 then
        return v4.placeId;
    else
        return nil;
    end;
end;