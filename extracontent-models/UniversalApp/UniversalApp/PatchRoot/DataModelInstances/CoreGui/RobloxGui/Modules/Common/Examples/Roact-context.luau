local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = v1.Component:extend("ContextProvider");
v2.init = function(v3) --[[ Line: 18 ]] --[[ Name: init ]]
    v3._context = {
        someValue = 5
    };
end;
v2.render = function(v4) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    return v1.oneChild(v4.props[v1.Children]);
end;
local v5 = v1.Component:extend("ContextReader");
v5.init = function(v6) --[[ Line: 32 ]] --[[ Name: init ]]
    print("Context value of", v6._context.someValue);
end;
v5.render = function(_) --[[ Line: 37 ]] --[[ Name: render ]]
    return nil;
end;
return function() --[[ Line: 41 ]]
    -- upvalues: v1 (copy), v2 (copy), v5 (copy)
    local v8 = v1.createElement(v2, {}, {
        SomeChild = v1.createElement(v5)
    });
    v1.mount(v8, nil, "SomeName");
end;