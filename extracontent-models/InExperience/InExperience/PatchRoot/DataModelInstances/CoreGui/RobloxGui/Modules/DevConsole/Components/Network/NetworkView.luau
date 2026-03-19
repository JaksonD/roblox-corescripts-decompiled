local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Parent.Constants);
local l_HeaderFrameHeight_0 = v2.NetworkFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v2.NetworkFormatting.EntryFrameHeight;
local l_SummaryButtonHeight_0 = v2.NetworkFormatting.SummaryButtonHeight;
local l_MinFrameWidth_0 = v2.NetworkFormatting.MinFrameWidth;
local l_MainWindow_0 = v2.DefaultFontSize.MainWindow;
local l_MainWindowHeader_0 = v2.Font.MainWindowHeader;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v10 = require(l_Components_0.BannerButton);
local v11 = require(l_Components_0.Network.NetworkSummary);
local v12 = require(l_Components_0.Network.NetworkChart);
local v13 = v1.Component:extend("NetworkView");
v13.init = function(v14, v15) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    assert(v15.targetNetworkData, "Make sure the NetworkData is assigned for this NetworkView");
    local v16 = v15.targetNetworkData:getCurrentData();
    v14.onSortChanged = function(v17) --[[ Line: 27 ]]
        -- upvalues: v15 (copy), v14 (copy)
        if v17 == v15.targetNetworkData:getSortType() then
            v14:setState({
                reverseSort = not v14.state.reverseSort
            });
            return;
        else
            v15.targetNetworkData:setSortType(v17);
            v14:setState({
                reverseSort = false
            });
            return;
        end;
    end;
    v14.onSummaryButton = function(_, _) --[[ Line: 41 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            summaryExpanded = not v14.state.summaryExpanded
        });
    end;
    v14.onDetailButton = function(_, _) --[[ Line: 47 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            entriesExpanded = not v14.state.entriesExpanded
        });
    end;
    v14.ref = v1.createRef();
    v14.state = {
        httpSummaryTable = v16.summaryTable, 
        httpSummaryCount = v16.summaryCount, 
        httpEntryList = v16.entryList, 
        summaryExpanded = true, 
        entriesExpanded = true, 
        indexOfEntryExpanded = 0, 
        reverseSort = false, 
        absWidth = 0
    };
end;
v13.didUpdate = function(v22) --[[ Line: 67 ]] --[[ Name: didUpdate ]]
    if v22.ref.current and v22.state.absWidth ~= v22.ref.current.AbsoluteSize.X then
        v22:setState({
            absWidth = v22.ref.current.AbsoluteSize.X
        });
    end;
end;
v13.didMount = function(v23) --[[ Line: 77 ]] --[[ Name: didMount ]]
    v23.httpEntryAddedConnector = v23.props.targetNetworkData:Signal():Connect(function(v24, v25, v26) --[[ Line: 79 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            httpSummaryTable = v24, 
            httpSummaryCount = v25, 
            httpEntryList = v26
        });
    end);
    if v23.ref.current then
        v23:setState({
            absWidth = v23.ref.current.AbsoluteSize.X
        });
    end;
end;
v13.willUnmount = function(v27) --[[ Line: 94 ]] --[[ Name: willUnmount ]]
    v27.httpEntryAddedConnector:Disconnect();
    v27.httpEntryAddedConnector = nil;
end;
v13.render = function(v28) --[[ Line: 99 ]] --[[ Name: render ]]
    -- upvalues: l_MinFrameWidth_0 (copy), l_SummaryButtonHeight_0 (copy), l_EntryFrameHeight_0 (copy), l_HeaderFrameHeight_0 (copy), v1 (copy), v10 (copy), v2 (copy), l_MainWindow_0 (copy), l_MainWindowHeader_0 (copy), v11 (copy), v12 (copy)
    local l_layoutOrder_0 = v28.props.layoutOrder;
    local l_searchTerm_0 = v28.props.searchTerm;
    local l_size_0 = v28.props.size;
    local l_summaryExpanded_0 = v28.state.summaryExpanded;
    local l_entriesExpanded_0 = v28.state.entriesExpanded;
    local l_reverseSort_0 = v28.state.reverseSort;
    local l_httpSummaryTable_0 = v28.state.httpSummaryTable;
    local l_httpEntryList_0 = v28.state.httpEntryList;
    local l_httpSummaryCount_0 = v28.state.httpSummaryCount;
    local v38 = math.max(l_MinFrameWidth_0, v28.state.absWidth);
    local v39 = l_SummaryButtonHeight_0 * 2;
    if l_summaryExpanded_0 then
        v39 = v39 + l_httpSummaryCount_0 * l_EntryFrameHeight_0 + l_HeaderFrameHeight_0;
    end;
    local v40 = nil;
    v40 = math.max(0, if v28.ref.current then v28.ref.current.AbsoluteSize.Y - v39 else l_size_0.Y.Offset - v39);
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        LayoutOrder = l_layoutOrder_0, 
        [v1.Ref] = v28.ref
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        SummaryButton = v1.createElement(v10, {
            size = UDim2.new(1, 0, 0, l_SummaryButtonHeight_0), 
            pos = UDim2.new(), 
            isExpanded = l_summaryExpanded_0, 
            onButtonPress = v28.onSummaryButton, 
            layoutOrder = 1
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "Summary", 
                TextColor3 = v2.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextSize = l_MainWindow_0, 
                Font = l_MainWindowHeader_0, 
                Size = UDim2.new(1, -30, 0, l_SummaryButtonHeight_0), 
                Position = UDim2.new(0, 30, 0, 0), 
                BackgroundTransparency = 1
            })
        }), 
        Summary = l_summaryExpanded_0 and v1.createElement(v11, {
            width = v38, 
            httpSummaryTable = l_httpSummaryTable_0, 
            layoutOrder = 2
        }), 
        DetailsButton = v1.createElement(v10, {
            size = UDim2.new(1, 0, 0, l_SummaryButtonHeight_0), 
            pos = UDim2.new(), 
            isExpanded = l_entriesExpanded_0, 
            onButtonPress = v28.onDetailButton, 
            layoutOrder = 3
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "Details", 
                TextColor3 = v2.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextSize = l_MainWindow_0, 
                Font = l_MainWindowHeader_0, 
                Size = UDim2.new(1, -30, 0, l_SummaryButtonHeight_0), 
                Position = UDim2.new(0, 30, 0, 0), 
                BackgroundTransparency = 1
            })
        }), 
        Entries = l_entriesExpanded_0 and v1.createElement(v12, {
            httpEntryList = l_httpEntryList_0, 
            chartHeight = v40, 
            width = v38, 
            searchTerm = l_searchTerm_0, 
            reverseSort = l_reverseSort_0, 
            layoutOrder = 4, 
            onSortChanged = v28.onSortChanged
        })
    });
end;
return v13;