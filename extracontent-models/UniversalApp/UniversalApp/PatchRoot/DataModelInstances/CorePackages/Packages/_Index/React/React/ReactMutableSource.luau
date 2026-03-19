local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local _ = require(l_Parent_0.Shared);
return function(v3, v4) --[[ Line: 18 ]] --[[ Name: createMutableSource ]]
    -- upvalues: v1 (copy)
    local v5 = {
        _getVersion = v4, 
        _source = v3, 
        _workInProgressVersionPrimary = nil, 
        _workInProgressVersionSecondary = nil
    };
    if v1.__DEV__ then
        v5._currentPrimaryRenderer = nil;
        v5._currentSecondaryRenderer = nil;
    end;
    return v5;
end;