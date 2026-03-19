local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_SduiConditionKey_0 = require(l_script_FirstAncestor_0.ConditionalProps.SduiConditionalPropTypes).SduiConditionKey;
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: checkPresenceConditions ]]
    -- upvalues: l_SduiConditionKey_0 (copy)
    local v4 = {};
    if not v2 then
        return v4;
    else
        assert(v2, "allConditionalProps must exist");
        for v5, v6 in v2 do
            local v7 = nil;
            if v6.conditions then
                for v8, v9 in v6.conditions do
                    if v8 == l_SduiConditionKey_0.friendInGame then
                        v7 = true;
                        local v10 = v3[tostring(v9)];
                        if v10 then
                            for _ in v10 do
                                v7 = false;
                                break;
                            end;
                        end;
                        if v7 then
                            break;
                        end;
                    end;
                end;
            end;
            v4[v5] = v7;
        end;
        return v4;
    end;
end;