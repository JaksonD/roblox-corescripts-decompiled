local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.DataConsumer);
local l_CommandLineHeight_0 = require(script.Parent.Parent.Parent.Constants).LogFormatting.CommandLineHeight;
local v4 = require(script.Parent.DevConsoleCommandLine);
local v5 = require(script.Parent.LogOutput);
local v6 = v1.Component:extend("ServerLog");
v6.init = function(v7) --[[ Line: 15 ]] --[[ Name: init ]]
    v7.initServerLogData = function() --[[ Line: 16 ]]
        -- upvalues: v7 (copy)
        return v7.props.ServerLogData:getLogData();
    end;
end;
v6.render = function(v8) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy), l_CommandLineHeight_0 (copy), v4 (copy)
    return v1.createElement("Frame", {
        Size = v8.props.size, 
        BackgroundTransparency = 1, 
        LayoutOrder = v8.props.layoutOrder
    }, {
        Scroll = v1.createElement(v5, {
            size = UDim2.new(1, 0, 1, -(l_CommandLineHeight_0 + 4)), 
            targetSignal = v8.props.ServerLogData:Signal(), 
            initLogOutput = v8.initServerLogData
        }), 
        CommandLine = v1.createElement(v4, {
            pos = UDim2.new(0, 0, 1, -l_CommandLineHeight_0), 
            height = l_CommandLineHeight_0
        })
    });
end;
return v2(v6, "ServerLogData");