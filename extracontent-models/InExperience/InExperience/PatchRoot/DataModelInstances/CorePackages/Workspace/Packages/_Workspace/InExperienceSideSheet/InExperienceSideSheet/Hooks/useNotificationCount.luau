local l_Parent_0 = script:FindFirstAncestor("InExperienceSideSheet").Parent;
local _ = require(l_Parent_0.Chrome);
local v2 = require(l_Parent_0.React);
return function(v3) --[[ Line: 12 ]] --[[ Name: useNotificationCount ]]
    -- upvalues: v2 (copy)
    local v4, v5 = v2.useState(not v3:isEmpty());
    local v6, v7 = v2.useBinding(v3:get().value or 0);
    v2.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: v3 (copy), v5 (copy), v7 (copy)
        v3:connect(function(v8) --[[ Line: 17 ]]
            -- upvalues: v3 (ref), v5 (ref), v7 (ref)
            if v3:isEmpty() then
                v5(false);
                return;
            else
                v7((math.min(v8.value, 99)));
                v5(true);
                return;
            end;
        end);
    end, {
        v3
    });
    return v4, v6;
end;