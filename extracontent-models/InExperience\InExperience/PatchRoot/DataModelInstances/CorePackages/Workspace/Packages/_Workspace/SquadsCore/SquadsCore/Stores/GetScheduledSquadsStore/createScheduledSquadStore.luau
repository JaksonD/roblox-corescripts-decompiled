local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local l_createComputed_0 = v2.createComputed;
local l_getSubscribedScheduledSquads_0 = require(l_script_FirstAncestor_0.NetworkRequests).getSubscribedScheduledSquads;
local _ = require(l_script_FirstAncestor_0.Types);
return function() --[[ Line: 21 ]]
    -- upvalues: v2 (copy), l_createComputed_0 (copy), l_getSubscribedScheduledSquads_0 (copy)
    local v6, v7 = v2.createSignal({});
    local v9 = l_createComputed_0(function(v8) --[[ Line: 24 ]]
        -- upvalues: v6 (copy)
        return v6(v8);
    end);
    local function v11() --[[ Line: 28 ]]
        -- upvalues: l_getSubscribedScheduledSquads_0 (ref), v7 (copy)
        l_getSubscribedScheduledSquads_0(function(v10) --[[ Line: 29 ]]
            -- upvalues: v7 (ref)
            v7(v10);
        end, nil);
    end;
    return {
        getAllScheduledSquads = v9, 
        fetchSubscribedScheduledSquads = v11
    };
end;