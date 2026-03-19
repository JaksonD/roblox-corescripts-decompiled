local v0 = require(script.Parent.NavigationSymbol);
local v1 = v0("BACK");
local v2 = v0("INIT");
local v3 = v0("NAVIGATE");
local v4 = v0("SET_PARAMS");
local v5 = {
    Back = v1, 
    Init = v2, 
    Navigate = v3, 
    SetParams = v4
};
setmetatable(v5, {
    __index = function(_, v7) --[[ Line: 24 ]] --[[ Name: __index ]]
        error(("%q is not a valid member of NavigationActions"):format((tostring(v7))), 2);
    end
});
v5.back = function(v8) --[[ Line: 30 ]] --[[ Name: back ]]
    -- upvalues: v1 (copy)
    local v9 = v8 or {};
    return {
        type = v1, 
        key = v9.key, 
        immediate = v9.immediate
    };
end;
v5.init = function(v10) --[[ Line: 40 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local v11 = v10 or {};
    return {
        type = v2, 
        params = v11.params
    };
end;
v5.navigate = function(v12) --[[ Line: 49 ]] --[[ Name: navigate ]]
    -- upvalues: v3 (copy)
    local v13 = v12 or {};
    return {
        type = v3, 
        routeName = v13.routeName, 
        params = v13.params, 
        action = v13.action, 
        key = v13.key
    };
end;
v5.setParams = function(v14) --[[ Line: 61 ]] --[[ Name: setParams ]]
    -- upvalues: v4 (copy)
    local v15 = v14 or {};
    return {
        type = v4, 
        preserveFocus = true, 
        key = v15.key, 
        params = v15.params
    };
end;
return v5;