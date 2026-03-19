local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = v1.Component:extend("App");
v2.init = function(v3) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v3.ref = v1.createRef();
end;
v2.render = function(v4) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        Size = UDim2.new(0, 123, 0, 123), 
        [v1.Ref] = v4.ref
    });
end;
v2.didMount = function(v5) --[[ Line: 33 ]] --[[ Name: didMount ]]
    print("Roblox Instance:", v5.ref.current);
    print("Roblox Instance Size:", v5.ref.current.Size);
end;
return function() --[[ Line: 38 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = v1.createElement(v2);
    v1.mount(v6, nil, "SomeName");
end;