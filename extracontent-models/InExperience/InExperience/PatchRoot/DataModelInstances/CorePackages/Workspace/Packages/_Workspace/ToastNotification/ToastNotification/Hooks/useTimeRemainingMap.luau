local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_utils_0 = l_Parent_0.utils;
local _ = require(l_Parent_0.type);
local v4 = require(l_utils_0.toastNotificationHelper);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v1.SharedFlags.FFlagRemoveDependencyArrayAntipattern;
local l_getNearestWholeNumber_0 = v4.getNearestWholeNumber;
local l_calculateTimeRemaining_0 = v4.calculateTimeRemaining;
local l_LuauPolyfill_0 = v1.LuauPolyfill;
local l_React_0 = v1.React;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_clearInterval_0 = l_LuauPolyfill_0.clearInterval;
local l_setInterval_0 = l_LuauPolyfill_0.setInterval;
return function(v13, v14) --[[ Line: 29 ]] --[[ Name: useTimeRemainingMap ]]
    -- upvalues: l_React_0 (copy), l_getNearestWholeNumber_0 (copy), l_calculateTimeRemaining_0 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local _, v16 = l_React_0.useState(0);
    local v17 = {};
    local v18 = true;
    for v19, v20 in pairs(v13) do
        local v21 = l_getNearestWholeNumber_0(l_calculateTimeRemaining_0(v20, v14.notificationReceivedTimestampMs, v14.displayTimestampMs) / 1000);
        if v21 > 0 then
            v18 = false;
        end;
        v17[v19] = math.max(0, v21);
    end;
    l_React_0.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v18 (ref), l_setInterval_0 (ref), v16 (copy), l_clearInterval_0 (ref)
        local v22 = nil;
        if not v18 then
            v22 = l_setInterval_0(function() --[[ Line: 50 ]]
                -- upvalues: v16 (ref)
                v16(os.clock());
            end, 100);
        end;
        return function() --[[ Line: 55 ]]
            -- upvalues: v22 (ref), l_clearInterval_0 (ref)
            if v22 then
                l_clearInterval_0(v22);
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v18, 
        v16
    } else l_dependencyArray_0(v18, v16));
    return v17;
end;