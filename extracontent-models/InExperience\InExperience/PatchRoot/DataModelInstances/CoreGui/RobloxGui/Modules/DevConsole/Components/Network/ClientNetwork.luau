local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(l_Components_0.DataConsumer);
local v4 = require(script.Parent.NetworkView);
local v5 = v1.Component:extend("ClientNetwork");
v5.init = function(v6, _) --[[ Line: 10 ]] --[[ Name: init ]]
    v6.state = {
        targetNetworkData = v6.props.ClientNetworkData
    };
end;
v5.render = function(v8) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy)
    local l_layoutOrder_0 = v8.props.layoutOrder;
    local l_searchTerm_0 = v8.props.searchTerm;
    local l_size_0 = v8.props.size;
    return v1.createElement(v4, {
        size = l_size_0, 
        searchTerm = l_searchTerm_0, 
        layoutOrder = l_layoutOrder_0, 
        targetNetworkData = v8.state.targetNetworkData
    });
end;
return v3(v5, "ClientNetworkData");