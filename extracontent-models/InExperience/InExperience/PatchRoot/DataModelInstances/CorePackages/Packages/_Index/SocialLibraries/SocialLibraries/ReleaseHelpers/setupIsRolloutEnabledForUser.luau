local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(script.Parent.throttleUserId);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function() --[[ Line: 6 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (copy)
        local l_LocalPlayer_0 = v1.Players.LocalPlayer;
        if not l_LocalPlayer_0 or not l_LocalPlayer_0.UserId then
            return false;
        else
            return v2({
                throttle = v3(), 
                userId = l_LocalPlayer_0.UserId
            });
        end;
    end;
end;