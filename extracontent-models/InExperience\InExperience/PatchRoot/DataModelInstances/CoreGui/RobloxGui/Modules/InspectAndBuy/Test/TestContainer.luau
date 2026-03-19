local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v6 = require(l_Parent_0.Reducers.InspectAndBuyReducer);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.CompactView);
local v9 = require(l_Parent_0.WideView);
local v10 = require(l_Parent_1.Common.renderWithCoreScriptsStyleProvider);
local v11 = require(l_Parent_0.Components.InspectAndBuyContext);
local v12 = v1.Component:extend("TestContainer");
v12.init = function(v13) --[[ Line: 23 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    v13.store = v13.props.overrideStore or v2.Store.new(v6, {}, {
        v2.thunkMiddleware
    });
    v13.views = {};
    v13.views[v7.View.Compact] = v8;
    v13.views[v7.View.Wide] = v9;
end;
v12.render = function(v14) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v11 (copy), v3 (copy), v10 (copy)
    local v15 = 0;
    for _, _ in v14.props[v1.Children] do
        v15 = v15 + 1;
    end;
    assert(v15 > 0, "TestContainer: no children provided, nothing will be tested");
    return v1.createElement(v11.Provider, {
        value = v14.views
    }, {
        v1.createElement(v3.StoreProvider, {
            store = v14.store
        }, {
            ThemeProvider = v10({
                InspectMenu = v1.createElement("ScreenGui", {}, v14.props[v1.Children])
            })
        })
    });
end;
return v12;