local v0 = require(script.Parent.Parent.UnifiedEventLogConstants);
local v1 = {};
local function v3(v2) --[[ Line: 5 ]] --[[ Name: addToSelectionList ]]
    -- upvalues: v1 (ref)
    table.insert(v1, v2);
end;
local function v9(v4) --[[ Line: 9 ]] --[[ Name: removeFromSelectionList ]]
    -- upvalues: v0 (copy), v1 (ref)
    local v5 = v0.ATTRIBUTE_PREFIX .. "itemId";
    local v6 = v0.ATTRIBUTE_PREFIX .. "itemType";
    for v7, v8 in v1 do
        if v8[v5] == v4[v5] and v8[v6] == v4[v6] then
            table.remove(v1, v7);
            return;
        end;
    end;
end;
local function v10() --[[ Line: 21 ]] --[[ Name: getSelectionList ]]
    -- upvalues: v1 (ref)
    return v1;
end;
local function v11() --[[ Line: 25 ]] --[[ Name: clearSelectionList ]]
    -- upvalues: v1 (ref)
    v1 = {};
end;
return {
    addToSelectionList = v3, 
    removeFromSelectionList = v9, 
    getSelectionList = v10, 
    clearSelectionList = v11
};