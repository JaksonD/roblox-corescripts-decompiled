local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(l_Components_0.DataConsumer);
local v4 = require(l_Components_0.Memory.MemoryView);
local v5 = v1.Component:extend("ClientMemory");
v5.render = function(v6) --[[ Line: 10 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy)
    return v1.createElement(v4, {
        layoutOrder = v6.props.layoutOrder, 
        size = v6.props.size, 
        searchTerm = v6.props.searchTerm, 
        targetMemoryData = v6.props.ClientMemoryData
    });
end;
return v3(v5, "ClientMemoryData");