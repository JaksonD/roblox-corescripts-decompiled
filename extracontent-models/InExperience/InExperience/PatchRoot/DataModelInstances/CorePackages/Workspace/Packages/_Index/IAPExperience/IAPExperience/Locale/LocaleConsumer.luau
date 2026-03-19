local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.LocaleRoactContext);
local v5 = v2.Component:extend("LocaleConsumer");
v5.validateProps = v3.strictInterface({
    render = v3.callback
});
v5.render = function(v6) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy)
    return v2.createElement(v4.Consumer, {
        render = function(v7) --[[ Line: 18 ]] --[[ Name: render ]]
            -- upvalues: v6 (copy)
            return v6.props.render(v7);
        end
    });
end;
return v5;