local l_script_FirstAncestor_0 = script:FindFirstAncestor("RealtimeDelivery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_List_0 = require(l_Parent_0.Cryo).List;
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.RealtimeTypes);
local v5 = require(script.Parent.useRobloxEventReceiver);
return function(v6, v7, v8) --[[ Line: 11 ]] --[[ Name: useRealtimeNamespace ]]
    -- upvalues: v5 (copy), v3 (copy), l_List_0 (copy)
    local v9 = v5();
    v3.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: v9 (copy), v6 (copy), v7 (copy)
        local v10 = v9:observeEvent(v6, v7);
        return function() --[[ Line: 17 ]]
            -- upvalues: v10 (copy)
            v10:disconnect();
        end;
    end, l_List_0.join({
        v6, 
        v9
    }, v8));
end;