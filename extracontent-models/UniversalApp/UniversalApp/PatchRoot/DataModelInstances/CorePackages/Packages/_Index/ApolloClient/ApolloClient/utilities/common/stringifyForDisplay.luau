local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_String_0 = v2.String;
local l_HttpService_0 = game:GetService("HttpService");
local l_makeUniqueId_0 = require(script.Parent.makeUniqueId).makeUniqueId;
replaceUndefined = function(v7, v8) --[[ Line: 20 ]] --[[ Name: replaceUndefined ]]
    -- upvalues: l_Array_0 (copy)
    if not l_Array_0.isArray(v7) then
        return v7;
    else
        local v9 = {};
        for v10 = 1, #v7 do
            if v7[v10] == nil then
                table.insert(v9, v8);
            else
                table.insert(v9, v7[v10]);
            end;
        end;
        return v9;
    end;
end;
v0.stringifyForDisplay = function(v11) --[[ Line: 35 ]] --[[ Name: stringifyForDisplay ]]
    -- upvalues: l_makeUniqueId_0 (copy), l_Array_0 (copy), l_String_0 (copy), l_HttpService_0 (copy)
    local v12 = l_makeUniqueId_0("stringifyForDisplay");
    return l_Array_0.join(l_String_0.split(l_HttpService_0:JSONEncode(replaceUndefined(v11, v12)), l_HttpService_0:JSONEncode(v12)), "<undefined>");
end;
return v0;