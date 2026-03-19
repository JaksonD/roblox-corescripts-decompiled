local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(script.Parent.Parent.Components.DataConsumer);
local l_Actions_0 = script.Parent.Parent.Actions;
local v6 = require(l_Actions_0.SetActiveTab);
local v7 = require(script.Parent.Parent.Constants);
local l_MsgTypeNamesOrdered_0 = v7.MsgTypeNamesOrdered;
local l_TopBar_0 = v7.DefaultFontSize.TopBar;
local l_Text_0 = v7.Color.Text;
local l_TopBar_1 = v7.Font.TopBar;
local v12 = UDim2.new(0, l_TopBar_0, 0, l_TopBar_0);
local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize("Client Mem:", l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize("Client Memory Usage:", l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
local l_l_TextService_0_TextSize_2 = l_TextService_0:GetTextSize("Avg. Data Ping:", l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
local v16 = v2.PureComponent:extend("LiveUpdateElement");
v16.didMount = function(v17) --[[ Line: 35 ]] --[[ Name: didMount ]]
    v17.totalMemConnector = v17.props.ClientMemoryData:totalMemSignal():Connect(function(v18) --[[ Line: 37 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            totalClientMemory = v18
        });
    end);
    v17.avgPingConnector = v17.props.ServerStatsData:avgPing():Connect(function(v19) --[[ Line: 41 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            averagePing = v19
        });
    end);
    v17.logWarningErrorConnector = v17.props.ClientLogData:errorWarningSignal():Connect(function(v20, v21) --[[ Line: 45 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            numErrors = v20, 
            numWarnings = v21
        });
    end);
    v17:doSizeCheck();
end;
v16.didUpdate = function(v22) --[[ Line: 55 ]] --[[ Name: didUpdate ]]
    v22:doSizeCheck();
end;
v16.doSizeCheck = function(v23) --[[ Line: 59 ]] --[[ Name: doSizeCheck ]]
    if v23.ref.current then
        local v24 = v23.state.formFactorThreshold > v23.ref.current.AbsoluteSize.X;
        if v24 ~= v23.state.isSmallerThanFormFactorThreshold then
            v23:setState({
                isSmallerThanFormFactorThreshold = v24
            });
        end;
    end;
end;
v16.willUnmount = function(v25) --[[ Line: 72 ]] --[[ Name: willUnmount ]]
    v25.totalMemConnector:Disconnect();
    v25.totalMemConnector = nil;
    v25.avgPingConnector:Disconnect();
    v25.avgPingConnector = nil;
    v25.logWarningErrorConnector:Disconnect();
    v25.logWarningErrorConnector = nil;
end;
v16.init = function(v26) --[[ Line: 83 ]] --[[ Name: init ]]
    -- upvalues: l_MsgTypeNamesOrdered_0 (copy), v2 (copy)
    local v27, v28 = v26.props.ClientLogData:getErrorWarningCount();
    v26.onLogWarningButton = function() --[[ Line: 85 ]]
        -- upvalues: l_MsgTypeNamesOrdered_0 (ref), v26 (copy)
        local v29 = {};
        for _, v31 in pairs(l_MsgTypeNamesOrdered_0) do
            v29[v31] = false;
        end;
        v29.Warning = true;
        v26.props.ClientLogData:setFilters(v29);
        v26.props.dispatchChangeTabClientLog();
    end;
    v26.onLogErrorButton = function() --[[ Line: 96 ]]
        -- upvalues: l_MsgTypeNamesOrdered_0 (ref), v26 (copy)
        local v32 = {};
        for _, v34 in pairs(l_MsgTypeNamesOrdered_0) do
            v32[v34] = false;
        end;
        v32.Error = true;
        v26.props.ClientLogData:setFilters(v32);
        v26.props.dispatchChangeTabClientLog();
    end;
    v26.ref = v2.createRef();
    v26.state = {
        numErrors = v27, 
        numWarnings = v28, 
        totalClientMemory = 0, 
        averagePing = 0, 
        formFactorThreshold = 380, 
        isSmallerThanFormFactorThreshold = false
    };
end;
v16.render = function(v35) --[[ Line: 119 ]] --[[ Name: render ]]
    -- upvalues: l_l_TextService_0_TextSize_1 (copy), v7 (copy), l_l_TextService_0_TextSize_0 (copy), l_TextService_0 (copy), l_TopBar_0 (copy), l_TopBar_1 (copy), l_l_TextService_0_TextSize_2 (copy), v2 (copy), v12 (copy), l_Text_0 (copy)
    local l_size_0 = v35.props.size;
    local l_position_0 = v35.props.position;
    local l_formFactor_0 = v35.props.formFactor;
    local l_numErrors_0 = v35.state.numErrors;
    local l_numWarnings_0 = v35.state.numWarnings;
    local l_totalClientMemory_0 = v35.state.totalClientMemory;
    local l_averagePing_0 = v35.state.averagePing;
    local l_isSmallerThanFormFactorThreshold_0 = v35.state.isSmallerThanFormFactorThreshold;
    local v44 = false;
    local l_X_0 = l_l_TextService_0_TextSize_1.X;
    local l_Center_0 = Enum.HorizontalAlignment.Center;
    if l_formFactor_0 == v7.FormFactor.Small or l_isSmallerThanFormFactorThreshold_0 then
        l_position_0 = l_position_0 + UDim2.new(0, 12, 0, 0);
        l_X_0 = l_l_TextService_0_TextSize_0.X;
        v44 = true;
        l_Center_0 = Enum.HorizontalAlignment.Left;
    end;
    local v47 = string.format("%d", l_numErrors_0);
    local l_l_TextService_0_TextSize_3 = l_TextService_0:GetTextSize(v47, l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
    local v49 = string.format("%d", l_numWarnings_0);
    local l_l_TextService_0_TextSize_4 = l_TextService_0:GetTextSize(v49, l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
    local v51 = string.format("%d MB", l_totalClientMemory_0);
    local l_l_TextService_0_TextSize_5 = l_TextService_0:GetTextSize(v51, l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
    local v53 = string.format("%d ms", l_averagePing_0);
    local l_l_TextService_0_TextSize_6 = l_TextService_0:GetTextSize(v53, l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
    if l_formFactor_0 == v7.FormFactor.Small or l_isSmallerThanFormFactorThreshold_0 then
        l_position_0 = l_position_0 + UDim2.new(0, 12, 0, 0);
        l_X_0 = l_l_TextService_0_TextSize_0.X;
        v44 = true;
        l_Center_0 = Enum.HorizontalAlignment.Left;
    end;
    local v55 = l_averagePing_0 > 0;
    local l_l_l_TextService_0_TextSize_2_0 = l_l_TextService_0_TextSize_2;
    return v2.createElement("Frame", {
        Position = l_position_0, 
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        [v2.Ref] = v35.ref
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 6), 
            HorizontalAlignment = l_Center_0, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        LogErrorIcon = v2.createElement("ImageButton", {
            Image = v7.Image.Error, 
            Size = v12, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            [v2.Event.Activated] = v35.onLogErrorButton
        }), 
        LogErrorCount = v2.createElement("TextButton", {
            Text = v47, 
            TextSize = l_TopBar_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_3.X, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            [v2.Event.Activated] = v35.onLogErrorButton
        }), 
        ErrorWarningPad = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        LogWarningIcon = v2.createElement("ImageButton", {
            Image = v7.Image.Warning, 
            Size = v12, 
            BackgroundTransparency = 1, 
            LayoutOrder = 4, 
            [v2.Event.Activated] = v35.onLogWarningButton
        }), 
        LogWarningCount = v2.createElement("TextButton", {
            Text = v49, 
            TextSize = l_TopBar_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_4.X, 1, 0), 
            BackgroundTransparency = 9, 
            LayoutOrder = 5, 
            [v2.Event.Activated] = v35.onLogWarningButton
        }), 
        WarningMemoryPad = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 6
        }), 
        MemoryUsage = v2.createElement("TextButton", {
            Text = v44 and "Client Mem:" or "Client Memory Usage:", 
            TextSize = l_TopBar_0, 
            TextColor3 = v7.Color.WarningYellow, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_X_0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 7, 
            [v2.Event.Activated] = v35.props.dispatchChangeTabClientMemory
        }), 
        MemoryUsage_MB = v2.createElement("TextButton", {
            Text = v51, 
            TextSize = l_TopBar_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_5.X, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 8, 
            [v2.Event.Activated] = v35.props.dispatchChangeTabClientMemory
        }), 
        MemoryPingPad = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 9
        }), 
        AvgPing = not v44 and v55 and v2.createElement("TextButton", {
            Text = "Avg. Data Ping:", 
            TextSize = l_TopBar_0, 
            TextColor3 = v7.Color.WarningYellow, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_l_l_TextService_0_TextSize_2_0.X, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 10, 
            [v2.Event.Activated] = v35.props.dispatchChangeTabNetworkPing
        }), 
        AvgPing_ms = not v44 and v55 and v2.createElement("TextButton", {
            Text = v53, 
            TextSize = l_TopBar_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_6.X, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 11, 
            [v2.Event.Activated] = v35.props.dispatchChangeTabNetworkPing
        })
    });
end;
return v3.UNSTABLE_connect2(nil, function(v57) --[[ Line: 286 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy)
    return {
        dispatchChangeTabClientLog = function() --[[ Line: 288 ]] --[[ Name: dispatchChangeTabClientLog ]]
            -- upvalues: v57 (copy), v6 (ref)
            v57(v6("Log", true));
        end, 
        dispatchChangeTabClientMemory = function() --[[ Line: 291 ]] --[[ Name: dispatchChangeTabClientMemory ]]
            -- upvalues: v57 (copy), v6 (ref)
            v57(v6("Memory", true));
        end, 
        dispatchChangeTabNetworkPing = function() --[[ Line: 294 ]] --[[ Name: dispatchChangeTabNetworkPing ]]
            -- upvalues: v57 (copy), v6 (ref)
            v57(v6("ServerStats", true));
        end
    };
end)(v4(v16, "ServerStatsData", "ClientMemoryData", "ClientLogData"));