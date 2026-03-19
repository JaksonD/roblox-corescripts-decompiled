local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Http.NetworkingPresence);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v2) --[[ Line: 6 ]]
        -- upvalues: v1 (ref)
        local l_Users_0 = v2:getState().Users;
        local v4 = {};
        for v5, _ in pairs(l_Users_0) do
            if v5 ~= "-1" then
                table.insert(v4, v5);
            end;
        end;
        v2:dispatch(v1.GetPresencesFromUserIds.API(v4)):catch(function(v7) --[[ Line: 17 ]]
            warn("NetworkingPresence failure in getAllUserPresences, Status: " .. tostring(v7));
        end);
    end;
end;