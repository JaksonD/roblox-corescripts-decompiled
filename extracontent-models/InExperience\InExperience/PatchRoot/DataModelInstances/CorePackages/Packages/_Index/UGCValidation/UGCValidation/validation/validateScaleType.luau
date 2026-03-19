local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.Analytics);
return function(v4, v5) --[[ Line: 12 ]] --[[ Name: validateScaleType ]]
    -- upvalues: v1 (copy), v3 (copy)
    if not v4 then
        return true;
    elseif not v1.AvatarPartScaleTypes[v4.Value] then
        v3.reportFailure(v3.ErrorType.validateScaleType_InvalidAvatarPartScaleType, nil, v5);
        assert(v4.Parent);
        return false, {
            string.format("The AvatarPartScaleType value in '%s' is invalid. Please, verify the value you are using is either Classic, ProportionsSlender, or ProportionsNormal.", v4.Parent.Name)
        };
    else
        return true;
    end;
end;