local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_Modules_0.Common.Signal);
local v5 = v3.Component:extend("TopBarSearchSignalProvider");
local v6 = v3.createContext(nil);
local l_FFlagAXMigrateCatalogPageInputBindings_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogPageInputBindings;
v5.init = function(v8) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v8.signal = v4.new();
end;
v5.render = function(v9) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v6 (copy)
    return v3.createElement(v6.Provider, {
        value = v9.signal
    }, v9.props[v3.Children]);
end;
return {
    Provider = v5, 
    Consumer = v6.Consumer, 
    Context = if l_FFlagAXMigrateCatalogPageInputBindings_0 then v6 else nil
};