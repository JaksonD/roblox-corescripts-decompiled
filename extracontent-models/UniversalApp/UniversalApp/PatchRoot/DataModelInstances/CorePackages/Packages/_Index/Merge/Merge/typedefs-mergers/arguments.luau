local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local _ = require(l_Parent_0.GraphQL);
local _ = require(script.Parent["merge-typedefs_types"]);
local v7 = require(l_Parent_0.Utils);
local l_compareNodes_0 = v7.compareNodes;
local l_isSome_0 = v7.isSome;
local v10 = nil;
v4.mergeArguments = function(v11, v12, v13) --[[ Line: 30 ]] --[[ Name: mergeArguments ]]
    -- upvalues: v10 (ref), l_Array_0 (copy), l_isSome_0 (copy), l_compareNodes_0 (copy)
    local v14 = v10(l_Array_0.filter(l_Array_0.concat({}, v12, v11), l_isSome_0));
    if v13 and v13.sort then
        l_Array_0.sort(v14, l_compareNodes_0);
    end;
    return v14;
end;
v10 = function(v15) --[[ Line: 52 ]] --[[ Name: deduplicateArguments ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy)
    return l_Array_0.reduce(v15, function(v16, v17) --[[ Line: 56 ]]
        -- upvalues: l_Array_0 (ref), l_Boolean_0 (ref)
        local v19 = l_Array_0.find(v16, function(v18) --[[ Line: 57 ]]
            -- upvalues: v17 (copy)
            return v18.name.value == v17.name.value;
        end);
        if not l_Boolean_0.toJSBoolean(v19) then
            return l_Array_0.concat(v16, {
                v17
            });
        else
            return v16;
        end;
    end, {});
end;
return v4;