local v0 = require(script.Parent.Parent.Stores.GetDrawerVisibleStore);
return function() --[[ Line: 3 ]] --[[ Name: useDrawerVisible ]]
    -- upvalues: v0 (copy)
    return v0(false).useDrawerVisible();
end;