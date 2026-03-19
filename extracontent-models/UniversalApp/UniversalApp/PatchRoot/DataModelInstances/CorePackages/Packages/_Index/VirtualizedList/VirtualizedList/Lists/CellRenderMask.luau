local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = {};
local v6 = require(l_Parent_0.jsUtils.invariant);
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v6 (copy)
    local v9 = setmetatable({}, v7);
    v6(v8 >= 0, "CellRenderMask must contain a non-negative number os cells");
    v9._numCells = v8;
    if v8 == 0 then
        v9._regions = {};
        return v9;
    else
        v9._regions = {
            {
                first = 0, 
                last = v8 - 1, 
                isSpacer = true
            }
        };
        return v9;
    end;
end;
v7.enumerateRegions = function(v10) --[[ Line: 47 ]] --[[ Name: enumerateRegions ]]
    return v10._regions;
end;
v7.addCells = function(v11, v12) --[[ Line: 50 ]] --[[ Name: addCells ]]
    -- upvalues: v6 (copy), l_Object_0 (copy), l_Array_0 (copy)
    local l_v6_0 = v6;
    local v14 = false;
    if v12.first >= 0 then
        v14 = false;
        if v12.first < v11._numCells then
            v14 = false;
            if v12.last >= 0 then
                v14 = false;
                if v12.last < v11._numCells then
                    v14 = v12.last >= v12.first;
                end;
            end;
        end;
    end;
    l_v6_0(v14, "CellRenderMask.addCells called with invalid cell range");
    l_v6_0, v14 = v11:_findRegion(v12.first);
    local v15, v16 = v11:_findRegion(v12.last);
    if v14 == v16 and not l_v6_0.isSpacer then
        return;
    else
        local v17 = {};
        local v18 = {};
        local v19 = l_Object_0.assign({}, v12, {
            isSpacer = false
        });
        if l_v6_0.first < v19.first then
            if l_v6_0.isSpacer then
                table.insert(v17, {
                    first = l_v6_0.first, 
                    last = v19.first - 1, 
                    isSpacer = true
                });
            else
                v19.first = l_v6_0.first;
            end;
        end;
        if v15.last > v19.last then
            if v15.isSpacer then
                table.insert(v18, {
                    first = v19.last + 1, 
                    last = v15.last, 
                    isSpacer = true
                });
            else
                v19.last = v15.last;
            end;
        end;
        local v20 = l_Array_0.concat(v17, {
            v19
        }, v18);
        local v21 = v16 - v14 + 1;
        l_Array_0.splice(v11._regions, v14, v21, table.unpack(v20));
        return;
    end;
end;
v7.equals = function(v22, v23) --[[ Line: 95 ]] --[[ Name: equals ]]
    -- upvalues: l_Array_0 (copy)
    local v24 = false;
    if v22._numCells == v23._numCells then
        v24 = false;
        if #v22._regions == #v23._regions then
            v24 = l_Array_0.every(v22._regions, function(v25, v26) --[[ Line: 98 ]]
                -- upvalues: v23 (copy)
                local v27 = false;
                if v25.first == v23._regions[v26].first then
                    v27 = false;
                    if v25.last == v23._regions[v26].last then
                        v27 = v25.isSpacer == v23._regions[v26].isSpacer;
                    end;
                end;
                return v27;
            end);
        end;
    end;
    return v24;
end;
v7._findRegion = function(v28, v29) --[[ Line: 105 ]] --[[ Name: _findRegion ]]
    -- upvalues: v6 (copy)
    local v30 = 1;
    local v31 = #v28._regions;
    while true do
        if v30 <= v31 then
            local v32 = math.floor((v30 + v31) / 2);
            local v33 = v28._regions[v32];
            if v33.first <= v29 and v29 <= v33.last then
                return v33, v32;
            elseif v29 < v33.first then
                v31 = v32 - 1;
            elseif v33.last < v29 then
                v30 = v32 + 1;
            end;
        else
            v6(false, string.format("A region was not found containing cellIdx %s", (tostring(v29))));
            return nil, nil;
        end;
    end;
end;
v5.CellRenderMask = v7;
return v5;