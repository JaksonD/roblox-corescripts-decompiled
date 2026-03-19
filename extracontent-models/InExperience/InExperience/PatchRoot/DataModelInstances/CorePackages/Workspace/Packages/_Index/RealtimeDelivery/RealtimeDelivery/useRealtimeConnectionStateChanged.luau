local l_script_FirstAncestor_0 = script:FindFirstAncestor("RealtimeDelivery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_List_0 = require(l_Parent_0.Cryo).List;
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.RealtimeTypes);
local v5 = require(script.Parent.useRobloxEventReceiver);
local v6 = require(script.Parent.useRealtimeNamespace);
return function(v7, v8, v9) --[[ Line: 12 ]] --[[ Name: useRealtimeConnectionStateChanged ]]
    -- upvalues: v5 (copy), v3 (copy), v6 (copy), l_List_0 (copy)
    local v10 = v5();
    local v11 = v3.useRef(nil);
    v6(v7, function(v12) --[[ Line: 20 ]]
        -- upvalues: v11 (copy)
        local l_SequenceNumber_0 = v12.SequenceNumber;
        if l_SequenceNumber_0 and (v11.current == nil or v11.current < l_SequenceNumber_0) then
            v11.current = l_SequenceNumber_0;
        end;
    end, l_List_0.join({
        v7
    }, v9));
    v3.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v10 (copy), v7 (copy), v11 (copy), v8 (copy)
        local v19 = v10:observeEvent("signalR", function(v14, _, v16) --[[ Line: 32 ]]
            -- upvalues: v7 (ref), v11 (ref), v8 (ref)
            local v17 = v16[v7];
            local v18 = v17 ~= nil and (v11.current == nil or v11.current ~= v17);
            if v17 then
                v11.current = v17;
            end;
            v8(v14, v18);
        end);
        return function() --[[ Line: 47 ]]
            -- upvalues: v19 (copy)
            v19:disconnect();
        end;
    end, l_List_0.join({
        v10, 
        v11.current
    }, v9));
end;