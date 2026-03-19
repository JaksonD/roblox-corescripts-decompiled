local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.LayerCollectorContext);
return function(v3) --[[ Line: 9 ]] --[[ Name: LayerCollectorConsumer ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Consumer, {
        render = v3
    });
end;