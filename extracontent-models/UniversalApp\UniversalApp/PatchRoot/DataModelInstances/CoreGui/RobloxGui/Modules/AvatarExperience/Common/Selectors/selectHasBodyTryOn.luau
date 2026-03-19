local v0 = require(script.Parent.selectTryOnBodyIds);
return function(v1) --[[ Line: 3 ]] --[[ Name: selectHasBodyTryOn ]]
    -- upvalues: v0 (copy)
    return #v0(v1) > 0;
end;