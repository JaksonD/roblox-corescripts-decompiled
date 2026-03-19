local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Parent.Roact);
local v3 = require(l_Parent_0.StyleConsumer);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v3 (copy)
    assert(type(v4) == "function", "Expect renderCallback to be a function.");
    return v2.createElement(v3, {
        render = function(v5) --[[ Line: 12 ]] --[[ Name: render ]]
            -- upvalues: v4 (copy)
            return v4(v5.style);
        end
    });
end;