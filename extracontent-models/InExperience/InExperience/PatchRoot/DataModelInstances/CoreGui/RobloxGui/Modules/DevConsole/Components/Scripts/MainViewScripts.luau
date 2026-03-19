local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.Scripts.ServerScripts);
local v5 = require(l_Components_0.UtilAndTab);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v7 = require(l_Actions_0.ServerScriptsUpdateSearchFilter);
local v8 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v8.GeneralFormatting.MainRowPadding;
local v10 = {
    "Active", 
    "Inactive"
};
local v11 = v1.PureComponent:extend("MainViewScripts");
v11.init = function(v12) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v12.onUtilTabHeightChanged = function(v13) --[[ Line: 23 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            utilTabHeight = v13
        });
    end;
    v12.onCheckboxChanged = function(v14, v15) --[[ Line: 29 ]]
        -- upvalues: v12 (copy)
        local v16 = {
            [v14] = v15
        };
        v12.props.dispatchServerScriptsUpdateSearchFilter(nil, v16);
    end;
    v12.onSearchTermChanged = function(v17) --[[ Line: 36 ]]
        -- upvalues: v12 (copy)
        v12.props.dispatchServerScriptsUpdateSearchFilter(v17, {});
    end;
    v12.utilRef = v1.createRef();
    v12.state = {
        utilTabHeight = 0, 
        isClientView = true
    };
end;
v11.didMount = function(v18) --[[ Line: 48 ]] --[[ Name: didMount ]]
    v18:setState({
        utilTabHeight = v18.utilRef.current.Size.Y.Offset
    });
end;
v11.didUpdate = function(v19) --[[ Line: 55 ]] --[[ Name: didUpdate ]]
    local l_Size_0 = v19.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v19.state.utilTabHeight then
        v19:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v11.render = function(v21) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v1 (copy), v8 (copy), l_MainRowPadding_0 (copy), v5 (copy), v4 (copy)
    local l_size_0 = v21.props.size;
    local l_formFactor_0 = v21.props.formFactor;
    local l_tabList_0 = v21.props.tabList;
    local l_serverTypeFilters_0 = v21.props.serverTypeFilters;
    local l_utilTabHeight_0 = v21.state.utilTabHeight;
    local l_serverSearchTerm_0 = v21.props.serverSearchTerm;
    local v28 = {};
    for v29, v30 in ipairs(v10) do
        local v31 = l_serverTypeFilters_0[v30];
        if v31 == nil then
            v31 = true;
        end;
        v28[v29] = {
            name = v30, 
            state = v31
        };
    end;
    local l_createElement_0 = v1.createElement;
    local v33 = "Frame";
    local v34 = {
        Size = l_size_0, 
        BackgroundColor3 = v8.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    };
    local v35 = {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v1.createElement(v5, {
            windowWidth = l_size_0.X.Offset, 
            formFactor = l_formFactor_0, 
            tabList = l_tabList_0, 
            orderedCheckboxState = v28, 
            searchTerm = l_serverSearchTerm_0, 
            layoutOrder = 1, 
            refForParent = v21.utilRef, 
            onHeightChanged = v21.onUtilTabHeightChanged, 
            onCheckboxChanged = v21.onCheckboxChanged, 
            onSearchTermChanged = v21.onSearchTermChanged
        })
    };
    local v36 = false;
    if l_utilTabHeight_0 > 0 then
        v36 = v1.createElement(v4, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            searchTerm = l_serverSearchTerm_0, 
            scriptFilters = l_serverTypeFilters_0, 
            layoutOrder = 2
        });
    end;
    v35.ServerScripts = v36;
    return l_createElement_0(v33, v34, v35);
end;
return v2.UNSTABLE_connect2(function(v37, _) --[[ Line: 121 ]] --[[ Name: mapStateToProps ]]
    return {
        serverSearchTerm = v37.ScriptsData.serverSearchTerm, 
        serverTypeFilters = v37.ScriptsData.serverTypeFilters
    };
end, function(v39) --[[ Line: 128 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy)
    return {
        dispatchServerScriptsUpdateSearchFilter = function(v40, v41) --[[ Line: 130 ]] --[[ Name: dispatchServerScriptsUpdateSearchFilter ]]
            -- upvalues: v39 (copy), v7 (ref)
            v39(v7(v40, v41));
        end
    };
end)(v11);