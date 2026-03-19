local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.DataConsumer);
local v3 = require(script.Parent.LogOutput);
local v4 = v1.Component:extend("ClientLog");
v4.init = function(v5) --[[ Line: 9 ]] --[[ Name: init ]]
    v5.initClientLogData = function() --[[ Line: 10 ]]
        -- upvalues: v5 (copy)
        return v5.props.ClientLogData:getLogData();
    end;
end;
v4.render = function(v6) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.createElement(v3, {
        layoutOrder = v6.props.layoutOrder, 
        size = v6.props.size, 
        initLogOutput = v6.initClientLogData, 
        targetSignal = v6.props.ClientLogData:Signal()
    });
end;
return v2(v4, "ClientLogData");