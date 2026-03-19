local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.LuauPolyfill);
local l_devAssert_0 = require(l_Parent_0.jsutils.devAssert).devAssert;
local _ = require(l_Parent_0.language.location);
local _ = require(script.Parent.GraphQLError);
return {
    formatError = function(v6) --[[ Line: 25 ]]
        -- upvalues: l_devAssert_0 (copy)
        l_devAssert_0(v6, "Received nil error.");
        local v7 = if v6.message and string.len(v6.message) > 0 then v6.message else "An unknown error occurred.";
        local l_locations_0 = v6.locations;
        local l_path_0 = v6.path;
        local l_extensions_0 = v6.extensions;
        return l_extensions_0 and {
            message = v7, 
            locations = l_locations_0, 
            path = l_path_0, 
            extensions = l_extensions_0
        } or {
            message = v7, 
            locations = l_locations_0, 
            path = l_path_0
        };
    end
};