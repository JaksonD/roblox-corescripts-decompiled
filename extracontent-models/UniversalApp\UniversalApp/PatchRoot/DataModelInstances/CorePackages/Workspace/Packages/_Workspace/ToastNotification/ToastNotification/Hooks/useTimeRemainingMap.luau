local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_utils_0 = l_Parent_0.utils;
local _ = require(l_Parent_0.type);
local v4 = require(l_utils_0.toastNotificationHelper);
local l_getNearestWholeNumber_0 = v4.getNearestWholeNumber;
local l_calculateTimeRemaining_0 = v4.calculateTimeRemaining;
local l_LuauPolyfill_0 = v1.LuauPolyfill;
local l_React_0 = v1.React;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_clearInterval_0 = l_LuauPolyfill_0.clearInterval;
local l_setInterval_0 = l_LuauPolyfill_0.setInterval;
return function(v12, v13) --[[ Line: 26 ]] --[[ Name: useTimeRemainingMap ]]
    -- upvalues: l_React_0 (copy), l_getNearestWholeNumber_0 (copy), l_calculateTimeRemaining_0 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_dependencyArray_0 (copy)
    local _, v15 = l_React_0.useState(0);
    local v16 = {};
    local v17 = true;
    for v18, v19 in pairs(v12) do
        local v20 = l_getNearestWholeNumber_0(l_calculateTimeRemaining_0(v19, v13.notificationReceivedTimestampMs, v13.displayTimestampMs) / 1000);
        if v20 > 0 then
            v17 = false;
        end;
        v16[v18] = math.max(0, v20);
    end;
    l_React_0.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v17 (ref), l_setInterval_0 (ref), v15 (copy), l_clearInterval_0 (ref)
        local v21 = nil;
        if not v17 then
            v21 = l_setInterval_0(function() --[[ Line: 46 ]]
                -- upvalues: v15 (ref)
                v15(os.clock());
            end, 100);
        end;
        return function() --[[ Line: 51 ]]
            -- upvalues: v21 (ref), l_clearInterval_0 (ref)
            if v21 then
                l_clearInterval_0(v21);
            end;
        end;
    end, l_dependencyArray_0(v17, v15));
    return v16;
end;