local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.inspect);
local v4 = require(l_Parent_0.Array.isArray);
local v5 = require(l_Parent_0.Array.forEach);
local v6 = require(l_Parent_0.Array.from.fromString);
local _ = require(l_Parent_1.ES7Types);
local v11 = {
    __iter = function(v8) --[[ Line: 39 ]] --[[ Name: __iter ]]
        return next, v8._array;
    end, 
    __tostring = function(v9) --[[ Line: 42 ]] --[[ Name: __tostring ]]
        -- upvalues: v3 (copy)
        local v10 = "Set ";
        if #v9._array > 0 then
            v10 = v10 .. "(" .. tostring(#v9._array) .. ") ";
        end;
        return v10 .. v3(v9._array);
    end
};
v11.__index = v11;
v11.new = function(v12) --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l___DEV___0 (copy), v6 (copy), v11 (copy)
    local v13 = nil;
    local v14 = {};
    if v12 ~= nil then
        local v15 = nil;
        if typeof(v12) == "table" then
            if v4(v12) then
                v15 = table.clone(v12);
            else
                local v16 = getmetatable(v12);
                if v16 and rawget(v16, "__iter") then
                    v15 = v12;
                elseif l___DEV___0 then
                    error("cannot create array from an object-like table");
                end;
            end;
        elseif typeof(v12) == "string" then
            v15 = v6(v12);
        else
            error(("cannot create array from value of type `%s`"):format((typeof(v12))));
        end;
        if v15 then
            v13 = table.create(#v15);
            for _, v18 in v15 do
                if not v14[v18] then
                    v14[v18] = true;
                    table.insert(v13, v18);
                end;
            end;
        else
            v13 = {};
        end;
    else
        v13 = {};
    end;
    return (setmetatable({
        size = #v13, 
        _map = v14, 
        _array = v13
    }, v11));
end;
v11.add = function(v19, v20) --[[ Line: 100 ]] --[[ Name: add ]]
    if not v19._map[v20] then
        v19.size = v19.size + 1;
        v19._map[v20] = true;
        table.insert(v19._array, v20);
    end;
    return v19;
end;
v11.clear = function(v21) --[[ Line: 110 ]] --[[ Name: clear ]]
    v21.size = 0;
    table.clear(v21._map);
    table.clear(v21._array);
end;
v11.delete = function(v22, v23) --[[ Line: 116 ]] --[[ Name: delete ]]
    if not v22._map[v23] then
        return false;
    else
        v22.size = v22.size - 1;
        v22._map[v23] = nil;
        local v24 = table.find(v22._array, v23);
        if v24 then
            table.remove(v22._array, v24);
        end;
        return true;
    end;
end;
v11.forEach = function(v25, v26, v27) --[[ Line: 132 ]] --[[ Name: forEach ]]
    -- upvalues: v5 (copy)
    if typeof(v26) ~= "function" then
        error("callback is not a function");
    end;
    v5(v25._array, function(v28) --[[ Line: 138 ]]
        -- upvalues: v27 (copy), v26 (copy), v25 (copy)
        if v27 ~= nil then
            v26(v27, v28, v28, v25);
            return;
        else
            v26(v28, v28, v25);
            return;
        end;
    end);
end;
v11.has = function(v29, v30) --[[ Line: 147 ]] --[[ Name: has ]]
    return v29._map[v30] ~= nil;
end;
v11.ipairs = function(v31) --[[ Line: 151 ]] --[[ Name: ipairs ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        warn(debug.traceback("`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n", 2));
    end;
    return ipairs(v31._array);
end;
return v11;