local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v3 = {};
    setmetatable(v3, v0);
    v3._id = v1;
    v3._parent = v2;
    v3._children = {};
    return v3;
end;
v0.getValue = function(v4) --[[ Line: 29 ]] --[[ Name: getValue ]]
    return v4._value;
end;
v0.getLabel = function(v5) --[[ Line: 33 ]] --[[ Name: getLabel ]]
    return v5._label;
end;
v0.getChildren = function(v6) --[[ Line: 37 ]] --[[ Name: getChildren ]]
    return v6._children;
end;
v0.getId = function(v7) --[[ Line: 41 ]] --[[ Name: getId ]]
    return v7._id;
end;
v0.getStackDepth = function(v8) --[[ Line: 45 ]] --[[ Name: getStackDepth ]]
    if v8._parent == nil then
        return 0;
    else
        return 1 + v8._parent:getStackDepth();
    end;
end;
v0.setLabelAndValue = function(v9, v10, v11) --[[ Line: 53 ]] --[[ Name: setLabelAndValue ]]
    v9._label = v10;
    v9._value = v11;
end;
v0.getOrMakeChildById = function(v12, v13) --[[ Line: 58 ]] --[[ Name: getOrMakeChildById ]]
    -- upvalues: v0 (copy)
    for _, v15 in ipairs(v12._children) do
        if v15:getId() == v13 then
            return v15;
        end;
    end;
    local v16 = v0.new(v13, v12);
    table.insert(v12._children, v16);
    return v16;
end;
v0.removeChildren = function(v17) --[[ Line: 70 ]] --[[ Name: removeChildren ]]
    if not v17._children then
        return;
    else
        for _, v19 in ipairs(v17._children) do
            v19:removeChildren();
            v19 = nil;
        end;
        v17._id = nil;
        v17._parent = nil;
        v17._children = nil;
        return;
    end;
end;
v0.removeChild = function(v20, v21) --[[ Line: 82 ]] --[[ Name: removeChild ]]
    for _, v23 in ipairs(v20._children) do
        if v23:getId() == v21 then
            v23:removeChildren();
            return;
        end;
    end;
end;
return v0;