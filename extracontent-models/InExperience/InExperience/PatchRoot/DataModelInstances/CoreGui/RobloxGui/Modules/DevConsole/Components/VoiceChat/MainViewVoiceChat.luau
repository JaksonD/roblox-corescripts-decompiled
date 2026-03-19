local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local _ = script.Parent.Parent.Parent.Actions;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.DataConsumer);
local v5 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v5.GeneralFormatting.MainRowPadding;
local v7 = require(l_Components_0.UtilAndTab);
local v8 = v1.PureComponent:extend("MainViewVoiceChat");
v8.init = function(v9) --[[ Line: 14 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v9.onUtilTabHeightChanged = function(v10) --[[ Line: 15 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            utilTabHeight = v10
        });
    end;
    v9.onStatsUpdated = function(v11) --[[ Line: 21 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            stats = v11
        });
    end;
    v9._statsUpdatedConnection = v9.props.VoiceChatData:Signal():Connect(v9.onStatsUpdated);
    v9.utilRef = v1.createRef();
    v9.state = {
        utilTabHeight = 0, 
        stats = {}
    };
end;
v8.didMount = function(v12) --[[ Line: 38 ]] --[[ Name: didMount ]]
    v12:setState({
        utilTabHeight = v12.utilRef.current.Size.Y.Offset
    });
end;
v8.didUpdate = function(v13) --[[ Line: 45 ]] --[[ Name: didUpdate ]]
    local l_Size_0 = v13.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v13.state.utilTabHeight then
        v13:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v8.willUnmount = function(v15) --[[ Line: 54 ]] --[[ Name: willUnmount ]]
    if v15._statsUpdatedConnection then
        v15._statsUpdatedConnection:Disconnect();
        v15._statsUpdatedConnection = nil;
    end;
end;
v8.render = function(v16) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy), l_MainRowPadding_0 (copy), v7 (copy)
    local l_size_0 = v16.props.size;
    local l_formFactor_0 = v16.props.formFactor;
    local l_tabList_0 = v16.props.tabList;
    local v20 = {
        {
            key = "rttMs", 
            format = "Round-trip time: %f", 
            defaultValue = 0
        }, 
        {
            key = "incomingPackets", 
            format = "Incoming Packets: %d", 
            defaultValue = 0
        }, 
        {
            key = "outgoingPackets", 
            format = "Outgoing Packets: %d", 
            defaultValue = 0
        }, 
        {
            key = "incomingPacketsLost", 
            format = "Incoming Packets Lost: %d", 
            defaultValue = 0
        }, 
        {
            key = "outgoingPacketsLost", 
            format = "Outgoing Packets Lost: %d", 
            defaultValue = 0
        }
    };
    local function v24() --[[ Line: 74 ]] --[[ Name: renderStatLabels ]]
        -- upvalues: v20 (copy), v1 (ref), v16 (copy), v5 (ref)
        local v21 = {};
        for v22, v23 in ipairs(v20) do
            v21[v22] = v1.createElement("TextLabel", {
                LayoutOrder = v22, 
                Size = UDim2.fromOffset(200, 20), 
                Text = string.format(v23.format, v16.state.stats[v23.key] or v23.defaultValue), 
                TextColor3 = v5.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1
            });
        end;
        return v1.createFragment(v21);
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, l_MainRowPadding_0)
        }), 
        FramePadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 16)
        }), 
        UtilAndTab = v1.createElement(v7, {
            windowWidth = l_size_0.X.Offset, 
            formFactor = l_formFactor_0, 
            tabList = l_tabList_0, 
            layoutOrder = 1, 
            refForParent = v16.utilRef
        }), 
        StatsContainer = v1.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Labels = v24()
        })
    });
end;
return v4(v8, "VoiceChatData");