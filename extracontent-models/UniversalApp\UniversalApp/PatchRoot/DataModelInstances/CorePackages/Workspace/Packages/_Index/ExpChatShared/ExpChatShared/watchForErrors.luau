local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local v1 = require(l_script_FirstAncestor_0.Analytics);
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    v2.Error:Connect(function(_, v6, v7) --[[ Line: 5 ]]
        -- upvalues: v3 (copy), v4 (copy), v1 (ref)
        if v7 == v3 or v6 and string.find(v6, "ExpChat") then
            local v8 = v4 and "expChatErrorCountServer" or "expChatErrorCountClient";
            v1.reportCounter(v8);
        end;
    end);
end;