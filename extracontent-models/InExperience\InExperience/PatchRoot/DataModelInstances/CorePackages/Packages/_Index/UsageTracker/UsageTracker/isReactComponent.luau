local l_Parent_0 = script:FindFirstAncestor("UsageTracker").Parent;
local v1 = require(l_Parent_0.ReactIs);
return function(v2) --[[ Line: 5 ]] --[[ Name: isReactComponent ]]
    -- upvalues: v1 (copy)
    local l_status_0, l_result_0 = pcall(v1.isValidElementType, v2);
    if l_status_0 and l_result_0 then
        if typeof(v2) == "function" then
            local v5, v6 = debug.info(v2, "a");
            local v7 = string.sub(debug.info(v2, "n"), 1, 3) == "use";
            if v5 == 1 and not v6 and not v7 then
                return true;
            end;
        elseif typeof(v2) == "table" then
            return true;
        end;
    end;
    return false;
end;