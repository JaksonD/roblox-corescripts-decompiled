local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineLayout");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utils.InlineElementType);
local v4 = {};
v4.__index = v4;
v4.__type = v3;
v4.new = function(v5, v6) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v7 = setmetatable({}, v4);
    v7.width = v5;
    v7.canForceSplit = v6;
    return v7;
end;
v4.getWidth = function(v8) --[[ Line: 19 ]] --[[ Name: getWidth ]]
    return v8.width;
end;
v4.split = function(v9, _, _) --[[ Line: 23 ]] --[[ Name: split ]]
    -- upvalues: v4 (copy)
    return v4.new(v9.width, v9.canForceSplit);
end;
v4.render = function(v12, v13, v14) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    return v2.createElement("TextLabel", {
        key = tostring(v14), 
        LayoutOrder = v14, 
        Size = UDim2.new(0, v12.width, 0, 20), 
        Text = ("%*"):format(v13)
    });
end;
local v15 = {};
v15.__index = v15;
v15.__type = v3;
v15.new = function(v16, v17) --[[ Line: 42 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    local v18 = setmetatable({}, v15);
    v18.width = v16;
    v18.canForceSplit = v17;
    return v18;
end;
v15.getWidth = function(v19) --[[ Line: 49 ]] --[[ Name: getWidth ]]
    return v19.width;
end;
v15.split = function(v20, v21, v22) --[[ Line: 53 ]] --[[ Name: split ]]
    -- upvalues: v15 (copy)
    local v23 = math.floor(v20.width / 2);
    local l_v23_0 = v23;
    local v25 = v20.width - v23;
    if v22 and v21 < v23 then
        l_v23_0 = v21;
        v25 = v20.width - v21;
    end;
    return v15.new(l_v23_0, v20.canForceSplit), (v15.new(v25, v20.canForceSplit));
end;
v15.render = function(v26, v27, v28) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    return v2.createElement("TextLabel", {
        key = tostring(v28), 
        LayoutOrder = v28, 
        Size = UDim2.new(0, v26.width, 0, 20), 
        Text = ("%*"):format(v27)
    });
end;
return {
    MockInlineElement = v4, 
    SplittableMockInlineElement = v15
};