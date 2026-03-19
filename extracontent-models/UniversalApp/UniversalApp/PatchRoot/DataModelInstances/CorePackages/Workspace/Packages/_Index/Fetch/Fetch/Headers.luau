local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: l_Array_0 (copy), v2 (copy)
    local v4 = {};
    local v5 = nil;
    if l_Array_0.isArray(v3) then
        v5 = {};
        for _, v7 in v3 do
            v5[v7[1]] = v7[2];
        end;
    else
        v5 = v3 or {};
    end;
    v4.headerList = v5;
    v4.guard = "none";
    setmetatable(v4, v2);
    return v4;
end;
v2.append = function(v8, v9, v10) --[[ Line: 56 ]] --[[ Name: append ]]
    if v8.guard == "immutable" then
        error("TypeError: tried to append header to immutable Headers object");
    end;
    v8.headerList[v9] = v10;
end;
v2.delete = function(v11, v12) --[[ Line: 64 ]] --[[ Name: delete ]]
    if v11.guard == "immutable" then
        error("TypeError: tried to delete key on immutable Headers object");
    end;
    if not v11:has(v12) then
        return;
    else
        v11.headerList[v12] = nil;
        return;
    end;
end;
v2.get = function(v13, v14) --[[ Line: 76 ]] --[[ Name: get ]]
    return v13.headerList[v14];
end;
v2.has = function(v15, v16) --[[ Line: 80 ]] --[[ Name: has ]]
    return v15.headerList[v16] ~= nil;
end;
v2.set = function(v17, v18, v19) --[[ Line: 84 ]] --[[ Name: set ]]
    if v17.guard == "immutable" then
        error("TypeError: tried to set key on immutable Headers object");
    end;
    v17.headerList[v18] = v19;
end;
v2.__iter = function(v20) --[[ Line: 91 ]] --[[ Name: __iter ]]
    return next, v20.headerList;
end;
return {
    Headers = v2
};