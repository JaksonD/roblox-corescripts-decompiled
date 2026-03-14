local v0 = require(script.Parent.Parent.GlobalConfig);
return function(...) --[[ Line: 4 ]] --[[ Name: maybeAssert ]]
    -- upvalues: v0 (copy)
    if v0.actionValidation then
        return assert(...);
    else
        return;
    end;
end;