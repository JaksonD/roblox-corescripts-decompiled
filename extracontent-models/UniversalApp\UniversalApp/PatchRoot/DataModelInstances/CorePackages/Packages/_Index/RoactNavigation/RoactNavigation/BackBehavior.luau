local v0 = require(script.Parent.NavigationSymbol);
local v1 = v0("NONE");
local v2 = v0("INITIAL_ROUTE");
local v3 = v0("ORDER");
local v4 = v0("HISTORY");
local v5 = {
    None = v1, 
    InitialRoute = v2, 
    Order = v3, 
    History = v4
};
setmetatable(v5, {
    __index = function(_, v7) --[[ Line: 24 ]] --[[ Name: __index ]]
        error(("%q is not a valid member of BackBehavior"):format((tostring(v7))), 2);
    end
});
return v5;