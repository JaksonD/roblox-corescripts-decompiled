local function v3(v0, v1, ...) --[[ Line: 28 ]] --[[ Name: resultHandler ]]
    if not v1 then
        local v2 = ...;
        if typeof(v2) == "string" then
            error(debug.traceback(v0, v2), 3);
        else
            error(v2, 3);
        end;
    end;
    if coroutine.status(v0) ~= "dead" then
        error(debug.traceback(v0, "\nYielding is not allowed inside components or hooks.\n\nYielding in a component stalls React's scheduler, freezing the entire application until the yield completes.\nCheck the stack trace below to find the exact location of the yield.\n\nFor more details and how to fix this, see: go/react-yield-error\n"), 3);
    end;
    return ...;
end;
return function(v4, ...) --[[ Line: 52 ]] --[[ Name: NoYield ]]
    -- upvalues: v3 (copy)
    local v5 = coroutine.create(v4);
    return v3(v5, coroutine.resume(v5, ...));
end;