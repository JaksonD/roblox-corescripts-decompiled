local l_Parent_0 = script:FindFirstAncestor("RobloxAppUpdate").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v4 = {
        _appUpdate = v3
    };
    setmetatable(v4, v2);
    return v4;
end;
v2.checkForUpdate = function(v5) --[[ Line: 18 ]] --[[ Name: checkForUpdate ]]
    -- upvalues: v1 (copy)
    return v1.new(function(v6, _) --[[ Line: 19 ]]
        -- upvalues: v5 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
            -- upvalues: v5 (ref), v6 (copy)
            v5._appUpdate:CheckForUpdate(function(v8) --[[ Line: 21 ]]
                -- upvalues: v6 (ref)
                v6({
                    appUpdateStatus = v8
                });
            end);
        end);
        if not l_status_0 then
            v6({
                errorMessage = l_result_0
            });
        end;
    end);
end;
v2.performManagedUpdate = function(v11) --[[ Line: 36 ]] --[[ Name: performManagedUpdate ]]
    v11._appUpdate:PerformManagedUpdate();
end;
v2.canPerformBinaryUpdate = function(v12) --[[ Line: 40 ]] --[[ Name: canPerformBinaryUpdate ]]
    return v12._appUpdate:CanPerformBinaryUpdate();
end;
return v2;