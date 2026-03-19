local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local function v3() --[[ Line: 24 ]] --[[ Name: defaultMakeData ]]
    return {};
end;
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 67 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v4 (copy)
    local l_v5_0 = v5;
    local l_v6_0 = v6;
    if l_v5_0 == nil then
        l_v5_0 = true;
    end;
    if l_v6_0 == nil then
        l_v6_0 = v3;
    end;
    local v9 = setmetatable({}, v4);
    v9.weakness = l_v5_0;
    v9.makeData = l_v6_0;
    return v9;
end;
v4.lookup = function(v10, ...) --[[ Line: 88 ]] --[[ Name: lookup ]]
    return v10:lookupArray({
        ...
    });
end;
v4.lookupArray = function(v11, v12) --[[ Line: 97 ]] --[[ Name: lookupArray ]]
    local l_v11_0 = v11;
    for _, v15 in v12 do
        l_v11_0 = l_v11_0:getChildTrie(v15);
    end;
    if not l_v11_0.data then
        l_v11_0.data = v11.makeData(table.clone(v12));
    end;
    return l_v11_0.data;
end;
v4.getChildTrie = function(v16, v17) --[[ Line: 114 ]] --[[ Name: getChildTrie ]]
    -- upvalues: v4 (copy)
    local v18 = nil;
    if v16.weakness then
        if v16.weak == nil then
            v16.weak = setmetatable({}, {
                __mode = "k"
            });
        end;
        v18 = v16.weak;
    else
        if v16.strong == nil then
            v16.strong = {};
        end;
        v18 = v16.strong;
    end;
    local v19 = v18[v17];
    if not v19 then
        v19 = v4.new(v16.weakness, v16.makeData);
        v18[v17] = v19;
    end;
    return v19;
end;
v2.Trie = v4;
return v2;