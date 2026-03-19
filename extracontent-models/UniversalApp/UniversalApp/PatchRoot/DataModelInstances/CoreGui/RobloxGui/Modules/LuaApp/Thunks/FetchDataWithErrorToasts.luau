local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(script.Parent.SetNetworkingErrorToast);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 8 ]]
        -- upvalues: v3 (copy), v1 (ref), v2 (ref)
        return v4:dispatch(v3):andThen(function(v5) --[[ Line: 9 ]]
            -- upvalues: v1 (ref)
            return v1.resolve(v5);
        end, function(v6) --[[ Line: 11 ]]
            -- upvalues: v4 (copy), v2 (ref), v1 (ref)
            v4:dispatch(v2(v6));
            return v1.reject(v6);
        end);
    end;
end;