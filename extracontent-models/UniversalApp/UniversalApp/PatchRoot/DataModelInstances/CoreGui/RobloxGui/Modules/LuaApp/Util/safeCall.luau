local function _() --[[ Line: 2 ]] --[[ Name: IsRunningInStudio ]]
    return game:GetService("RunService"):IsStudio();
end;
local v1 = game:GetService("RunService"):IsStudio();
return function(v2, v3, v4) --[[ Line: 8 ]] --[[ Name: PCALL ]]
    -- upvalues: v1 (copy)
    local l_v1_0 = v1;
    if v4 ~= nil then
        l_v1_0 = v4;
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
        -- upvalues: v2 (copy)
        return v2();
    end);
    if l_status_0 then
        return l_result_0;
    elseif l_v1_0 then
        assert(l_status_0, l_result_0);
        return v3;
    else
        local v8 = "safeCall failed";
        pcall(function() --[[ Line: 26 ]]
            -- upvalues: v8 (ref), l_result_0 (copy)
            v8 = tostring(l_result_0);
        end);
        warn(v8);
        return v3;
    end;
end;