local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.SduiLoadTimer);
return function(v4, v5) --[[ Line: 8 ]] --[[ Name: useComponentLifecycleTiming ]]
    -- upvalues: v2 (copy)
    v2.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: v4 (copy)
        if v4 then
            v4.logComponentMounted();
        end;
    end, {
        v4
    });
    v2.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: v4 (copy), v5 (copy)
        if v4 and v5 then
            v4.logComponentReady();
        end;
    end, {
        v4, 
        v5
    });
end;