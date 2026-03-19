local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceInitialization").Parent;
local v1 = require(l_Parent_0.RealtimeDelivery);
return function(v2) --[[ Line: 8 ]] --[[ Name: useRemoteAvatarUpdateEffect ]]
    -- upvalues: v1 (copy)
    v1.useRealtimeNamespace("SignupAvatarInitializationProcessor", function(_) --[[ Line: 9 ]]
        -- upvalues: v2 (copy)
        v2();
    end, {
        v2
    });
    v1.useRealtimeConnectionStateChanged("SignupAvatarInitializationProcessor", function(_, v5) --[[ Line: 14 ]]
        -- upvalues: v2 (copy)
        if v5 then
            v2();
        end;
    end, {
        v2
    });
end;