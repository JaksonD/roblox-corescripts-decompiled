local v0 = {};
local function _(v1) --[[ Line: 2 ]] --[[ Name: setAllCommands ]]
    -- upvalues: v0 (ref)
    v0 = v1;
end;
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v0 (ref)
    if v3 then
        v0 = v3;
    end;
    return v0;
end;