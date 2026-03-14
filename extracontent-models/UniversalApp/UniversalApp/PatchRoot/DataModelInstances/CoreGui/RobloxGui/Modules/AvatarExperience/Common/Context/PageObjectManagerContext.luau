local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = v1.Component:extend("PageObjectManagerProvider");
local v3 = v1.createContext(nil);
v2.render = function(v4) --[[ Line: 8 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.createElement(v3.Provider, {
        value = v4.props.pageObjectManager
    }, v4.props[v1.Children]);
end;
return {
    Provider = v2, 
    Consumer = v3.Consumer
};