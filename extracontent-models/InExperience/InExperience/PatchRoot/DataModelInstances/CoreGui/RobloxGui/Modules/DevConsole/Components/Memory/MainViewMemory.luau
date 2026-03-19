local l_CorePackages_0 = game:GetService("CorePackages");
local l_Stats_0 = game:GetService("Stats");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v5 = require(l_Components_0.Memory.ClientMemory);
local v6 = require(l_Components_0.Memory.ServerMemory);
local v7 = require(l_Components_0.UtilAndTab);
local v8 = require(l_Components_0.DataConsumer);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v10 = require(l_Actions_0.ClientMemoryUpdateSearchFilter);
local v11 = require(l_Actions_0.ServerMemoryUpdateSearchFilter);
local v12 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v12.GeneralFormatting.MainRowPadding;
local v14 = game:DefineFastFlag("DevConsoleMemoryTrackingAlert", false);
local v15 = v2.Component:extend("LogButton");
v15.init = function(v16) --[[ Line: 25 ]] --[[ Name: init ]]
    v16.onAction = function() --[[ Line: 26 ]]
        -- upvalues: v16 (copy)
        local v17 = v16.props.isClientView and v16.props.ClientMemoryData or v16.props.ServerMemoryData;
        local v18 = "\n";
        local function _(v19) --[[ Line: 29 ]] --[[ Name: line ]]
            -- upvalues: v18 (ref)
            v18 = v18 .. v19 .. "\n";
        end;
        v18 = v18 .. "Name                                       Min   Max" .. "\n";
        v18 = v18 .. "----------------------------------------   ---   ---" .. "\n";
        local function v21(v22, v23, v24) --[[ Line: 36 ]] --[[ Name: recurseMemoryTree ]]
            -- upvalues: v18 (ref), v21 (copy)
            local v25 = string.format("%s %s %s %3d   %3d", string.rep(" ", v24), v22, string.rep(" ", 40 - v24 - #v22), v23.min, v23.max);
            v18 = v18 .. v25 .. "\n";
            if v23.children then
                for v26, v27 in pairs(v23.children) do
                    v21(v26, v27, v24 + 2);
                end;
            end;
        end;
        v21("Memory", v17._memoryData.Memory, 0);
        print(v18);
    end;
end;
v15.render = function(v28) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v12 (copy)
    return v2.createElement("TextButton", {
        Text = "Log", 
        Visible = true, 
        BorderSizePixel = 1, 
        BackgroundColor3 = v12.Color.UnselectedGray, 
        TextColor3 = v12.Color.Text, 
        [v2.Event.Activated] = v28.onAction
    });
end;
v15 = v8(v15, "ClientMemoryData", "ServerMemoryData");
local v29 = v2.Component:extend("MainViewMemory");
v29.init = function(v30) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v30.onUtilTabHeightChanged = function(v31) --[[ Line: 72 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            utilTabHeight = v31
        });
    end;
    v30.onClientButton = function() --[[ Line: 78 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            isClientView = true
        });
    end;
    v30.onServerButton = function() --[[ Line: 82 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            isClientView = false
        });
    end;
    v30.onSearchTermChanged = function(v32) --[[ Line: 86 ]]
        -- upvalues: v30 (copy)
        if v30.state.isClientView then
            v30.props.dispatchClientMemoryUpdateSearchFilter(v32, {});
            return;
        else
            v30.props.dispatchServerMemoryUpdateSearchFilter(v32, {});
            return;
        end;
    end;
    v30.utilRef = v2.createRef();
    v30.state = {
        utilTabHeight = 0, 
        isClientView = true
    };
end;
v29.didMount = function(v33) --[[ Line: 102 ]] --[[ Name: didMount ]]
    v33:setState({
        utilTabHeight = v33.utilRef.current.Size.Y.Offset
    });
end;
v29.didUpdate = function(v34) --[[ Line: 109 ]] --[[ Name: didUpdate ]]
    local l_Offset_0 = v34.utilRef.current.Size.Y.Offset;
    if l_Offset_0 ~= v34.state.utilTabHeight then
        v34:setState({
            utilTabHeight = l_Offset_0
        });
    end;
end;
local function _() --[[ Line: 120 ]] --[[ Name: shouldDisplayMemoryWarning ]]
    -- upvalues: l_Stats_0 (copy)
    return not l_Stats_0.MemoryTrackingEnabled;
end;
v29.render = function(v37) --[[ Line: 124 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), l_Stats_0 (copy), v2 (copy), l_MainRowPadding_0 (copy), v7 (copy), v15 (ref), v12 (copy), v5 (copy), v6 (copy)
    local v38 = {};
    local l_size_0 = v37.props.size;
    local l_isDeveloperView_0 = v37.props.isDeveloperView;
    local l_formFactor_0 = v37.props.formFactor;
    local l_tabList_0 = v37.props.tabList;
    local l_utilTabHeight_0 = v37.state.utilTabHeight;
    local l_isClientView_0 = v37.state.isClientView;
    local v45 = l_isClientView_0 and v37.props.clientSearchTerm or v37.props.serverSearchTerm;
    local v46 = false;
    if v14 then
        v46 = not l_Stats_0.MemoryTrackingEnabled;
    end;
    v38.UIListLayout = v2.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, l_MainRowPadding_0)
    });
    v38.UtilAndTab = v2.createElement(v7, {
        windowWidth = l_size_0.X.Offset, 
        formFactor = l_formFactor_0, 
        tabList = l_tabList_0, 
        isClientView = l_isClientView_0, 
        searchTerm = v45, 
        layoutOrder = 1, 
        refForParent = v37.utilRef, 
        onHeightChanged = v37.onUtilTabHeightChanged, 
        onClientButton = l_isDeveloperView_0 and v37.onClientButton, 
        onServerButton = l_isDeveloperView_0 and v37.onServerButton, 
        onSearchTermChanged = v37.onSearchTermChanged
    }, {
        v15 and v2.createElement(v15, {
            isClientView = l_isClientView_0
        })
    });
    if v46 then
        v38.MemoryHeader = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 20), 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Memory category counters are disabled. Restart the client with the MicroProfiler on to guarantee counters are enabled.", 
            TextColor3 = v12.Color.Text, 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            LayoutOrder = 2
        });
    end;
    if l_utilTabHeight_0 > 0 then
        if l_isClientView_0 then
            v38.ClientMemory = v2.createElement(v5, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                searchTerm = v45, 
                layoutOrder = 3
            });
        else
            v38.ServerMemory = v2.createElement(v6, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                searchTerm = v45, 
                layoutOrder = 3
            });
        end;
    end;
    return v2.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v12.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 4
    }, v38);
end;
return v3.UNSTABLE_connect2(function(v47, _) --[[ Line: 198 ]] --[[ Name: mapStateToProps ]]
    return {
        clientSearchTerm = v47.MemoryData.clientSearchTerm, 
        clientTypeFilters = v47.MemoryData.clientTypeFilters, 
        serverSearchTerm = v47.MemoryData.serverSearchTerm, 
        serverTypeFilters = v47.MemoryData.serverTypeFilters
    };
end, function(v49) --[[ Line: 207 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy), v11 (copy)
    return {
        dispatchClientMemoryUpdateSearchFilter = function(v50, v51) --[[ Line: 209 ]] --[[ Name: dispatchClientMemoryUpdateSearchFilter ]]
            -- upvalues: v49 (copy), v10 (ref)
            v49(v10(v50, v51));
        end, 
        dispatchServerMemoryUpdateSearchFilter = function(v52, v53) --[[ Line: 213 ]] --[[ Name: dispatchServerMemoryUpdateSearchFilter ]]
            -- upvalues: v49 (copy), v11 (ref)
            v49(v11(v52, v53));
        end
    };
end)(v29);