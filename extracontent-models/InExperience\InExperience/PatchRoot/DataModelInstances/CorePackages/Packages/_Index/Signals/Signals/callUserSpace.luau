local v0 = _G.__SIGNALS_VALIDATION_ENABLED__ or _G.__DEV__;
local function v4(v1, v2, ...) --[[ Line: 3 ]] --[[ Name: handleNoYieldValidation ]]
    if not v2 then
        local v3 = ...;
        if typeof(v3) == "string" then
            error(debug.traceback(v1, v3), 2);
        else
            error(tostring(v3), 2);
        end;
    end;
    if coroutine.status(v1) ~= "dead" then
        error(debug.traceback(v1, "Attempted to yield!"), 2);
    end;
    return ...;
end;
local function v7(v5, ...) --[[ Line: 20 ]] --[[ Name: callWithValidation ]]
    -- upvalues: v4 (copy)
    local v6 = coroutine.create(v5);
    return v4(v6, coroutine.resume(v6, ...));
end;
local function v9(v8, ...) --[[ Line: 25 ]] --[[ Name: callWithoutValidation ]]
    return v8(...);
end;
if v0 then
    return v7;
else
    return v9;
end;