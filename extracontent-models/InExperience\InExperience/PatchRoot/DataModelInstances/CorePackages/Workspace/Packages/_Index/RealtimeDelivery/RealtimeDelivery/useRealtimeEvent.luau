local l_script_FirstAncestor_0 = script:FindFirstAncestor("RealtimeDelivery");
local _ = require(l_script_FirstAncestor_0.RealtimeTypes);
local v2 = require(script.Parent.useRealtimeNamespace);
return function(v3, v4, v5, v6) --[[ Line: 8 ]] --[[ Name: useRealtimeEvent ]]
    -- upvalues: v2 (copy)
    v2(v3, function(v7) --[[ Line: 14 ]]
        -- upvalues: v4 (copy), v5 (copy)
        if v7.Type == v4 then
            v5(v7);
        end;
    end, v6);
end;