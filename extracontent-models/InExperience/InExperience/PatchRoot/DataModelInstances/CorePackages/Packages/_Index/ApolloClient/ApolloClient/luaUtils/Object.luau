local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
return (v1.Object.assign({}, v1.Object, {
    getPrototypeOf = function(v2) --[[ Line: 12 ]] --[[ Name: getPrototypeOf ]]
        local v3 = getmetatable(v2);
        return v3 ~= false and v3 or nil;
    end, 
    create = function(v4, v5) --[[ Line: 16 ]] --[[ Name: create ]]
        if v5 == nil then
            v5 = {};
        end;
        return (setmetatable(v5, v4));
    end
}));