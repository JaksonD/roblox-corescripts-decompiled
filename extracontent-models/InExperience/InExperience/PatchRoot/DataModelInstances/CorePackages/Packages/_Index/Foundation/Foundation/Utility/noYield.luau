return function(v0) --[[ Line: 1 ]]
    local function v3(v1, v2, ...) --[[ Line: 2 ]]
        if not v2 then
            return nil;
        elseif coroutine.status(v1) ~= "dead" then
            return nil;
        else
            return ...;
        end;
    end;
    local v4 = coroutine.create(v0);
    return v3(v4, coroutine.resume(v4));
end;