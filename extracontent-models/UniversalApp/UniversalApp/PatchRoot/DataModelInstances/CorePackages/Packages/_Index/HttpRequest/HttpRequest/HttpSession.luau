local v0 = {};
local v1 = 0;
v0.currentSession = function() --[[ Line: 5 ]] --[[ Name: currentSession ]]
    -- upvalues: v1 (ref)
    return v1;
end;
v0.startNewSession = function() --[[ Line: 9 ]] --[[ Name: startNewSession ]]
    -- upvalues: v1 (ref)
    v1 = v1 + 1;
end;
return v0;