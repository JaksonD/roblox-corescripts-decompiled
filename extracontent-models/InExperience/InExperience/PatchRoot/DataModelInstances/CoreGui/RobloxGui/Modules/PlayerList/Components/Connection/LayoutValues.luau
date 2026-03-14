local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.LayoutValuesContext);
return {
    Provider = function(v3) --[[ Line: 7 ]] --[[ Name: layoutValuesProvider ]]
        -- upvalues: v1 (copy), v2 (copy)
        return v1.createElement(v2.Provider, {
            value = v3.layoutValues
        }, v1.oneChild(v3[v1.Children]));
    end, 
    Consumer = v2.Consumer, 
    WithLayoutValues = function(v4) --[[ Line: 13 ]] --[[ Name: withLayoutValues ]]
        -- upvalues: v1 (copy), v2 (copy)
        assert(type(v4) == "function", "Expect withLayoutValues callback to be a function.");
        return v1.createElement(v2.Consumer, {
            render = v4
        });
    end
};