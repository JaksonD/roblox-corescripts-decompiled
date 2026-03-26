local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v4 = require(l_script_FirstAncestor_0.Utils.getConversationTimestamp);
local function v6(v5) --[[ Line: 10 ]] --[[ Name: computeTimestamp ]]
    -- upvalues: v4 (copy), l_DateTime_0 (copy)
    if v5 == nil then
        return "";
    else
        return v4(l_DateTime_0.fromUnixTimestamp(v5));
    end;
end;
return function(v7) --[[ Line: 17 ]] --[[ Name: useRelativeTimestampBinding ]]
    -- upvalues: v2 (copy), v6 (copy)
    local v8, v9 = v2.useBinding(v6(v7));
    v2.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: v9 (copy), v6 (ref), v7 (copy)
        v9(v6(v7));
        if v7 == nil then
            return function() --[[ Line: 24 ]]

            end;
        else
            local v10 = false;
            local function v11() --[[ Line: 29 ]] --[[ Name: scheduleUpdate ]]
                -- upvalues: v10 (ref), v9 (ref), v6 (ref), v7 (ref), v11 (copy)
                task.delay(30, function() --[[ Line: 30 ]]
                    -- upvalues: v10 (ref), v9 (ref), v6 (ref), v7 (ref), v11 (ref)
                    if v10 then
                        return;
                    else
                        v9(v6(v7));
                        v11();
                        return;
                    end;
                end);
            end;
            task.delay(30, function() --[[ Line: 30 ]]
                -- upvalues: v10 (ref), v9 (ref), v6 (ref), v7 (ref), v11 (copy)
                if v10 then
                    return;
                else
                    v9(v6(v7));
                    v11();
                    return;
                end;
            end);
            return function() --[[ Line: 41 ]]
                -- upvalues: v10 (ref)
                v10 = true;
            end;
        end;
    end, {
        v7
    });
    return v8;
end;