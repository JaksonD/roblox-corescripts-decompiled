local v0 = require(script.Parent.useEventConnection);
return function(v1) --[[ Line: 20 ]] --[[ Name: EventConnection ]]
    -- upvalues: v0 (copy)
    v0(v1.event, v1.callback, {
        v1.event, 
        v1.callback
    });
end;