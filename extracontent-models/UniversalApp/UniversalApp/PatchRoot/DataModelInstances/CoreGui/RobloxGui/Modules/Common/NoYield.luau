local function v2(v0, v1, ...) --[[ Line: 10 ]] --[[ Name: resultHandler ]]
    if not v1 then
        error(..., 2);
    end;
    if coroutine.status(v0) ~= "dead" then
        error(debug.traceback(v0, "Attempted to yield inside Changed event!"), 2);
    end;
    return ...;
end;
return function(v3, ...) --[[ Line: 23 ]] --[[ Name: NoYield ]]
    -- upvalues: v2 (copy)
    local v4 = coroutine.create(v3);
    return v2(v4, coroutine.resume(v4, ...));
end;