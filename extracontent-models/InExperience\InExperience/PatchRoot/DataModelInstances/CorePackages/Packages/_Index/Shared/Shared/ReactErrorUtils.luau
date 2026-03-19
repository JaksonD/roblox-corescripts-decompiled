local v0 = require(script.Parent.invariant);
local v1 = require(script.Parent.invokeGuardedCallbackImpl);
local v2 = nil;
local v3 = false;
local v4 = nil;
local v5 = false;
local v6 = nil;
local v8 = {
    onError = function(v7) --[[ Line: 25 ]] --[[ Name: onError ]]
        -- upvalues: v3 (ref), v4 (ref)
        v3 = true;
        v4 = v7;
    end
};
local v9 = {
    invokeGuardedCallback = function(...) --[[ Line: 45 ]]
        -- upvalues: v3 (ref), v4 (ref), v1 (copy), v8 (copy)
        v3 = false;
        v4 = nil;
        v1(v8, ...);
    end
};
v9.invokeGuardedCallbackAndCatchFirstError = function(...) --[[ Line: 62 ]]
    -- upvalues: v9 (copy), v3 (ref), v2 (ref), v5 (ref), v6 (ref)
    v9.invokeGuardedCallback(...);
    if v3 then
        local v10 = v2();
        if not v5 then
            v5 = true;
            v6 = v10;
        end;
    end;
end;
v9.rethrowCaughtError = function() --[[ Line: 80 ]]
    -- upvalues: v5 (ref), v6 (ref)
    if v5 then
        local l_v6_0 = v6;
        v5 = false;
        v6 = nil;
        error(l_v6_0);
    end;
end;
v9.hasCaughtError = function() --[[ Line: 89 ]]
    -- upvalues: v3 (ref)
    return v3;
end;
v2 = function() --[[ Line: 93 ]]
    -- upvalues: v3 (ref), v4 (ref), v0 (copy)
    if v3 then
        local l_v4_0 = v4;
        v3 = false;
        v4 = nil;
        return l_v4_0;
    else
        v0(false, "clearCaughtError was called but no error was captured. This error is likely caused by a bug in React. Please file an issue.");
        return nil;
    end;
end;
v9.clearCaughtError = v2;
return v9;