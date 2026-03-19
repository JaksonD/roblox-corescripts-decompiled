local _ = require(script.Parent.ReactInternalTypes);
local v1 = require(script.Parent["ReactFiberStack.new"]);
local l_createCursor_0 = v1.createCursor;
local l_push_0 = v1.push;
local l_pop_0 = v1.pop;
local v5 = {
    InvisibleParentSuspenseContext = 1, 
    ForceSuspenseFallback = 2
};
local v6 = l_createCursor_0(0);
v5.suspenseStackCursor = v6;
v5.hasSuspenseContext = function(v7, v8) --[[ Line: 59 ]] --[[ Name: hasSuspenseContext ]]
    return bit32.band(v7, v8) ~= 0;
end;
v5.setDefaultShallowSuspenseContext = function(v9) --[[ Line: 66 ]] --[[ Name: setDefaultShallowSuspenseContext ]]
    return (bit32.band(v9, 1));
end;
v5.setShallowSuspenseContext = function(v10, v11) --[[ Line: 72 ]] --[[ Name: setShallowSuspenseContext ]]
    return (bit32.bor(bit32.band(v10, 1), v11));
end;
v5.addSubtreeSuspenseContext = function(v12, v13) --[[ Line: 82 ]] --[[ Name: addSubtreeSuspenseContext ]]
    return (bit32.bor(v12, v13));
end;
v5.pushSuspenseContext = function(v14, v15) --[[ Line: 89 ]] --[[ Name: pushSuspenseContext ]]
    -- upvalues: l_push_0 (copy), v6 (copy)
    l_push_0(v6, v15, v14);
end;
v5.popSuspenseContext = function(v16) --[[ Line: 93 ]] --[[ Name: popSuspenseContext ]]
    -- upvalues: l_pop_0 (copy), v6 (copy)
    l_pop_0(v6, v16);
end;
return v5;