local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.ActionBindings.ActionBindingsChart);
local v5 = require(l_Components_0.UtilAndTab);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v7 = require(l_Actions_0.ActionBindingsUpdateSearchFilter);
local v8 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v8.GeneralFormatting.MainRowPadding;
local v10 = v1.Component:extend("MainViewActionBindings");
v10.init = function(v11) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v11.onUtilTabHeightChanged = function(v12) --[[ Line: 18 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            utilTabHeight = v12
        });
    end;
    v11.onSearchTermChanged = function(v13) --[[ Line: 24 ]]
        -- upvalues: v11 (copy)
        v11.props.dispatchActionBindingsUpdateSearchFilter(v13, {});
    end;
    v11.utilRef = v1.createRef();
    v11.state = {
        utilTabHeight = 0
    };
end;
v10.didMount = function(v14) --[[ Line: 35 ]] --[[ Name: didMount ]]
    v14:setState({
        utilTabHeight = v14.utilRef.current.Size.Y.Offset
    });
end;
v10.didUpdate = function(v15) --[[ Line: 42 ]] --[[ Name: didUpdate ]]
    local l_Size_0 = v15.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v15.state.utilTabHeight then
        v15:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v10.render = function(v17) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v8 (copy), l_MainRowPadding_0 (copy), v5 (copy), v4 (copy)
    local l_size_0 = v17.props.size;
    local l_formFactor_0 = v17.props.formFactor;
    local l_tabList_0 = v17.props.tabList;
    local l_bindingsSearchTerm_0 = v17.props.bindingsSearchTerm;
    local l_utilTabHeight_0 = v17.state.utilTabHeight;
    local l_createElement_0 = v1.createElement;
    local v24 = "Frame";
    local v25 = {
        Size = l_size_0, 
        BackgroundColor3 = v8.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    };
    local v26 = {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v1.createElement(v5, {
            windowWidth = l_size_0.X.Offset, 
            formFactor = l_formFactor_0, 
            tabList = l_tabList_0, 
            searchTerm = l_bindingsSearchTerm_0, 
            layoutOrder = 1, 
            refForParent = v17.utilRef, 
            onHeightChanged = v17.onUtilTabHeightChanged, 
            onSearchTermChanged = v17.onSearchTermChanged
        })
    };
    local v27 = false;
    if l_utilTabHeight_0 > 0 then
        v27 = v1.createElement(v4, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            searchTerm = l_bindingsSearchTerm_0, 
            layoutOrder = 2
        });
    end;
    v26.ActionBindings = v27;
    return l_createElement_0(v24, v25, v26);
end;
return v2.UNSTABLE_connect2(function(v28, _) --[[ Line: 91 ]] --[[ Name: mapStateToProps ]]
    return {
        bindingsSearchTerm = v28.ActionBindingsData.bindingsSearchTerm
    };
end, function(v30) --[[ Line: 97 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy)
    return {
        dispatchActionBindingsUpdateSearchFilter = function(v31, v32) --[[ Line: 99 ]] --[[ Name: dispatchActionBindingsUpdateSearchFilter ]]
            -- upvalues: v30 (copy), v7 (ref)
            v30(v7(v31, v32));
        end
    };
end)(v10);