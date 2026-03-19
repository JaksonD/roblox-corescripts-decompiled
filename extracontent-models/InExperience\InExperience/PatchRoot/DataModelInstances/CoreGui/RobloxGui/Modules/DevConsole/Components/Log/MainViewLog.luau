local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.Log.ClientLog);
local v5 = require(l_Components_0.Log.ServerLog);
local v6 = require(l_Components_0.UtilAndTab);
local v7 = require(l_Components_0.DataConsumer);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v9 = require(l_Actions_0.SetActiveTab);
local v10 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v10.GeneralFormatting.MainRowPadding;
local l_MsgTypeNamesOrdered_0 = v10.MsgTypeNamesOrdered;
local v13 = v1.PureComponent:extend("MainViewLog");
v13.init = function(v14) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v14.onUtilTabHeightChanged = function(v15) --[[ Line: 22 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            utilTabHeight = v15
        });
    end;
    v14.onClientButton = function() --[[ Line: 28 ]]
        -- upvalues: v14 (copy)
        v14.props.dispatchSetActiveTab("Log", true);
    end;
    v14.onServerButton = function() --[[ Line: 32 ]]
        -- upvalues: v14 (copy)
        v14.props.dispatchSetActiveTab("Log", false);
    end;
    v14.onCheckboxChanged = function(v16, v17) --[[ Line: 36 ]]
        -- upvalues: v14 (copy)
        if v14.props.isClientView then
            v14.props.ClientLogData:setFilter(v16, v17);
            return;
        else
            v14.props.ServerLogData:setFilter(v16, v17);
            return;
        end;
    end;
    v14.filterUpdated = function() --[[ Line: 44 ]]
        -- upvalues: v14 (copy)
        if v14.forceUpdate then
            v14:forceUpdate();
            return;
        else
            v14:setState({});
            return;
        end;
    end;
    v14.onSearchTermChanged = function(v18) --[[ Line: 52 ]]
        -- upvalues: v14 (copy)
        if v14.props.isClientView then
            v14.props.ClientLogData:setSearchTerm(v18);
            return;
        else
            v14.props.ServerLogData:setSearchTerm(v18);
            return;
        end;
    end;
    v14.clientFilterConnection = v14.props.ClientLogData:filterUpdatedSignal():Connect(v14.filterUpdated);
    v14.serverFilterConnection = v14.props.ServerLogData:filterUpdatedSignal():Connect(v14.filterUpdated);
    v14.utilRef = v1.createRef();
    v14.state = {
        utilTabHeight = 0
    };
end;
v13.didMount = function(v19) --[[ Line: 73 ]] --[[ Name: didMount ]]
    v19:setState({
        utilTabHeight = v19.utilRef.current.Size.Y.Offset
    });
end;
v13.didUpdate = function(v20) --[[ Line: 80 ]] --[[ Name: didUpdate ]]
    local l_Size_0 = v20.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v20.state.utilTabHeight then
        v20:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v13.willUnmount = function(v22) --[[ Line: 89 ]] --[[ Name: willUnmount ]]
    if v22.clientFilterConnection then
        v22.clientFilterConnection:Disconnect();
        v22.clientFilterConnection = nil;
    end;
    if v22.serverFilterConnection then
        v22.serverFilterConnection:Disconnect();
        v22.serverFilterConnection = nil;
    end;
end;
v13.render = function(v23) --[[ Line: 100 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_MainRowPadding_0 (copy), l_MsgTypeNamesOrdered_0 (copy), v6 (copy), v4 (copy), v5 (copy), v10 (copy)
    local l_size_0 = v23.props.size;
    local l_formFactor_0 = v23.props.formFactor;
    local l_isDeveloperView_0 = v23.props.isDeveloperView;
    local l_tabList_0 = v23.props.tabList;
    local l_isClientView_0 = v23.props.isClientView;
    local l_utilTabHeight_0 = v23.state.utilTabHeight;
    local v30 = nil;
    v30 = if l_isClientView_0 then v23.props.ClientLogData:getSearchTerm() else v23.props.ServerLogData:getSearchTerm();
    local v31 = {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_MainRowPadding_0)
        })
    };
    local v32 = nil;
    v32 = if l_isClientView_0 then v23.props.ClientLogData:getFilters() else v23.props.ServerLogData:getFilters();
    local v33 = {};
    for v34, v35 in ipairs(l_MsgTypeNamesOrdered_0) do
        v33[v34] = {
            name = v35, 
            state = v32[v35]
        };
    end;
    v31.UtilAndTab = v1.createElement(v6, {
        windowWidth = l_size_0.X.Offset, 
        formFactor = l_formFactor_0, 
        tabList = l_tabList_0, 
        orderedCheckboxState = v33, 
        isClientView = l_isClientView_0, 
        searchTerm = v30, 
        layoutOrder = 1, 
        refForParent = v23.utilRef, 
        onClientButton = l_isDeveloperView_0 and v23.onClientButton, 
        onServerButton = l_isDeveloperView_0 and v23.onServerButton, 
        onCheckboxChanged = v23.onCheckboxChanged, 
        onSearchTermChanged = v23.onSearchTermChanged
    });
    if l_utilTabHeight_0 > 0 then
        if l_isClientView_0 then
            v31.ClientLog = v1.createElement(v4, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                layoutOrder = 2
            });
        else
            v31.ServerLog = v1.createElement(v5, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                layoutOrder = 2
            });
        end;
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v10.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, v31);
end;
return v2.UNSTABLE_connect2(function(v36, _) --[[ Line: 177 ]] --[[ Name: mapStateToProps ]]
    return {
        isClientView = v36.MainView.isClientView
    };
end, function(v38) --[[ Line: 183 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy)
    return {
        dispatchSetActiveTab = function(v39, v40) --[[ Line: 185 ]] --[[ Name: dispatchSetActiveTab ]]
            -- upvalues: v38 (copy), v9 (ref)
            v38(v9(v39, v40));
        end
    };
end)(v7(v13, "ClientLogData", "ServerLogData"));