local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_HttpService_0 = game:GetService("HttpService");
sortedEncode = function(v5) --[[ Line: 14 ]] --[[ Name: sortedEncode ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_HttpService_0 (copy)
    if not l_Array_0.isArray(v5) and typeof(v5) == "table" then
        local v7 = l_Array_0.map(l_Array_0.sort(l_Object_0.keys(v5)), function(v6) --[[ Line: 16 ]]
            -- upvalues: l_HttpService_0 (ref), v5 (copy)
            return l_HttpService_0:JSONEncode(v6) .. ":" .. sortedEncode(v5[v6]);
        end);
        return "{" .. l_Array_0.join(v7, ",") .. "}";
    else
        return l_HttpService_0:JSONEncode(v5);
    end;
end;
return {
    sortedEncode = sortedEncode
};