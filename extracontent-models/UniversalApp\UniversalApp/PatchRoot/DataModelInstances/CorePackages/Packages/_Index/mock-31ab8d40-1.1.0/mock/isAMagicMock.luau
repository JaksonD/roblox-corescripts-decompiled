local v0 = require(script.Parent.symbols);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v2 = getmetatable(v1);
    if v2 then
        return v2[v0.isMagicMock] ~= nil;
    else
        return false;
    end;
end;