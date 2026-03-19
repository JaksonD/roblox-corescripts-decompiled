local l_Parent_0 = script:FindFirstAncestor("Components").Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_0.Utils.InlineElementType);
local l_join_0 = v3.join;
local v6 = {};
v6.__index = v6;
v6.__type = v4;
v6.new = function(v7, v8, v9) --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v3 (copy)
    local v10 = setmetatable({}, v6);
    v10.props = v8;
    v10.mapProps = v9 or v3.identity;
    v10.Element = v7;
    return v10;
end;
v6.getWidth = function(v11) --[[ Line: 52 ]] --[[ Name: getWidth ]]
    return v11.props.Size.Width.Offset;
end;
v6.split = function(v12) --[[ Line: 56 ]] --[[ Name: split ]]
    -- upvalues: v6 (copy), l_join_0 (copy)
    return v6.new(v12.Element, l_join_0(v12.props));
end;
v6.render = function(v13, v14, v15) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v13.Element, v13.mapProps(v3.assign(v13.props, {
        id = v14, 
        key = tostring(v15), 
        LayoutOrder = v15
    })));
end;
return v6;