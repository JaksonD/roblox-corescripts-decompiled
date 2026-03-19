local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_TextService_0 = game:GetService("TextService");
local v4 = require(script.Parent.Parent.Actions.SetActiveTab);
local v5 = require(script.Parent.TabRowButton);
local v6 = require(script.Parent.DropDown);
local v7 = require(script.Parent.FullScreenDropDownButton);
local v8 = require(script.Parent.Parent.Constants);
local l_TabDropDownWidth_0 = v8.TabRowFormatting.TabDropDownWidth;
local l_TabOverlapThreshold_0 = v8.TabRowFormatting.TabOverlapThreshold;
local v11 = v1.Component:extend("TabRowContainer");
local function v19(v12) --[[ Line: 19 ]] --[[ Name: initTabList ]]
    -- upvalues: l_TextService_0 (copy), v8 (copy)
    local v13 = {};
    local v14 = 0;
    local v15 = 0;
    for v16, _ in pairs(v12) do
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v16, v8.DefaultFontSize.TabBar, v8.Font.TabBar, Vector2.new(0, 0));
        v13[v16] = l_l_TextService_0_TextSize_0.X;
        v14 = v14 + l_l_TextService_0_TextSize_0.X;
        v15 = v15 + 1;
    end;
    return v13, v14, v15;
end;
v11.init = function(v20) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy)
    local l_tabList_0 = v20.props.tabList;
    local v22, v23, v24 = v19(l_tabList_0);
    v20.state = {
        textWidths = v22, 
        totalTextLength = v23, 
        totalTabCount = v24, 
        currContainerWidth = 0
    };
    v20.onTabButtonClicked = function(v25) --[[ Line: 45 ]]
        -- upvalues: v20 (copy)
        for v26, v27 in pairs(v20.props.tabList) do
            if v27.layoutOrder == v25 then
                v20.props.dispatchSetActiveTab(v26, v27.hasClientServer);
                return;
            end;
        end;
    end;
end;
v11.didUpdate = function(v28, v29, _) --[[ Line: 55 ]] --[[ Name: didUpdate ]]
    -- upvalues: v19 (copy)
    if v29.tabList ~= v28.props.tabList then
        local v31, v32, v33 = v19(v28.props.tabList);
        v28:setState({
            textWidths = v31, 
            totalTextLength = v32, 
            totalTabCount = v33
        });
    end;
end;
v11.render = function(v34) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: l_TabOverlapThreshold_0 (copy), v8 (copy), v1 (copy), v7 (copy), l_TabDropDownWidth_0 (copy), v6 (copy), v5 (copy)
    local l_tabList_1 = v34.props.tabList;
    local l_currTabIndex_0 = v34.props.currTabIndex;
    local l_formFactor_0 = v34.props.formFactor;
    local l_windowWidth_0 = v34.props.windowWidth;
    local l_frameHeight_0 = v34.props.frameHeight;
    local l_layoutOrder_0 = v34.props.layoutOrder;
    local l_textWidths_0 = v34.state.textWidths;
    local l_totalTextLength_0 = v34.state.totalTextLength;
    local l_totalTabCount_0 = v34.state.totalTabCount;
    local v44 = {};
    local v45 = (l_windowWidth_0 - l_totalTextLength_0) / l_totalTabCount_0;
    local v46 = v45 % 1 * l_totalTabCount_0 / 2;
    local v47 = false;
    if v45 < l_TabOverlapThreshold_0 then
        v47 = l_windowWidth_0 > 0;
    end;
    local v48 = l_formFactor_0 == v8.FormFactor.Small;
    if l_tabList_1 then
        if v47 or v48 then
            local v49 = {};
            local l_layoutOrder_1 = l_tabList_1[l_currTabIndex_0].layoutOrder;
            for v51, v52 in pairs(l_tabList_1) do
                v49[v52.layoutOrder] = v51;
            end;
            if v48 then
                return v1.createElement(v7, {
                    buttonSize = UDim2.new(0, l_TabDropDownWidth_0, 0, l_frameHeight_0), 
                    dropDownList = v49, 
                    selectedIndex = l_layoutOrder_1, 
                    onSelection = v34.onTabButtonClicked, 
                    layoutOrder = l_layoutOrder_0
                });
            elseif v47 then
                return v1.createElement(v6, {
                    buttonSize = UDim2.new(0, l_TabDropDownWidth_0, 0, l_frameHeight_0), 
                    dropDownList = v49, 
                    selectedIndex = l_layoutOrder_1, 
                    onSelection = v34.onTabButtonClicked
                });
            end;
        else
            for v53, v54 in pairs(l_tabList_1) do
                if l_textWidths_0[v53] then
                    v44[v53] = v1.createElement(v5, {
                        index = v54.layoutOrder, 
                        name = v53, 
                        padding = v45, 
                        textWidth = v47 and l_TabDropDownWidth_0 or l_textWidths_0[v53], 
                        isSelected = v53 == l_currTabIndex_0, 
                        layoutOrder = v54.layoutOrder, 
                        onTabButtonClicked = v34.onTabButtonClicked
                    });
                end;
            end;
        end;
        v44.UIListLayout = v1.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Horizontal
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_frameHeight_0), 
        Position = UDim2.new(0, v46, 0, 0), 
        Transparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, v44);
end;
return v2.UNSTABLE_connect2(function(v55, _) --[[ Line: 146 ]] --[[ Name: mapStateToProps ]]
    return {
        tabList = v55.MainView.tabList, 
        currTabIndex = v55.MainView.currTabIndex
    };
end, function(v57) --[[ Line: 153 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v4 (copy)
    return {
        dispatchSetActiveTab = function(v58, v59) --[[ Line: 155 ]] --[[ Name: dispatchSetActiveTab ]]
            -- upvalues: v57 (copy), v4 (ref)
            v57(v4(v58, v59));
        end
    };
end)(v11);