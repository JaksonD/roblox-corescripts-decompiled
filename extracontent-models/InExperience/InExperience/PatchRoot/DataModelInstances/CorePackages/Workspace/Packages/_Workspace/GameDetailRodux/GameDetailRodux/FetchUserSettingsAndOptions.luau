local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local v1 = require(l_script_FirstAncestor_0.GameDetails.GetUserSettingsAndOptions);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1(v4):andThen(function(v5) --[[ Line: 8 ]]
        -- upvalues: v3 (ref)
        local l_responseBody_0 = v5.responseBody;
        if not l_responseBody_0 then
            v3.reject("Unexpected response when fetching user settings and options");
        end;
        return v3.resolve(l_responseBody_0);
    end, function(v7) --[[ Line: 16 ]]
        -- upvalues: v3 (ref)
        return v3.reject(v7);
    end);
end;