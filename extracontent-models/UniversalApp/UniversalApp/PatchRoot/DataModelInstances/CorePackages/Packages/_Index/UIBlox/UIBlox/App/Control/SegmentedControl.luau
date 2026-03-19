local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Cryo);
local v6 = require(l_Parent_0.Core.Style.withStyle);
local v7 = require(l_Parent_1.Otter);
local v8 = require(l_Parent_0.App.ImageSet.Images);
local v9 = require(l_Parent_1.RoactGamepad);
local v10 = require(l_Core_0.Control.Enum.ControlState);
local v11 = require(script.Parent.SegmentedControlTabName);
local v12 = require(l_Core_0.ImageSet.ImageSetComponent);
local v13 = require(l_Core_0.Button.getContentStyle);
local v14 = require(l_Parent_0.App.ImageSet.getIconSize);
local v15 = require(l_Parent_0.App.ImageSet.Enum.IconSize);
local v16 = require(l_Parent_0.Core.Text.GetTextSize);
local v17 = v14(v15.Medium);
local v18 = {
    frequency = 10, 
    dampingRatio = 1
};
local v19 = v8["component_assets/circle_17"];
local v20 = {
    [v10.Default] = "BackgroundUIDefault"
};
local v21 = {
    [v10.Default] = "Divider"
};
local v22 = {
    [v10.Default] = "UIEmphasis"
};
local v23 = {
    [v10.Default] = "SecondaryDefault", 
    [v10.Hover] = "SecondaryOnHover"
};
local function v31(v24) --[[ Line: 49 ]]
    -- upvalues: v4 (copy)
    local v25, v26 = v4.array(v4.strictInterface({
        tabName = v4.string, 
        isDisabled = v4.optional(v4.boolean), 
        icon = v4.optional(v4.table)
    }))(v24);
    if not v25 then
        return v25, v26;
    else
        local v27, v28 = v4.numberMin(2)(#v24);
        if not v27 then
            return v27, v28;
        else
            local v29, v30 = v4.numberMax(4)(#v24);
            if not v29 then
                return v29, v30;
            else
                return true;
            end;
        end;
    end;
end;
local v32 = v3.Component:extend("SegmentedControl");
v32.validateProps = v4.strictInterface({
    tabs = v31, 
    width = v4.UDim, 
    height = v4.optional(v4.number), 
    maxWidth = v4.optional(v4.number), 
    selectedTabIndex = v4.number, 
    onTabActivated = v4.callback, 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    layoutOrder = v4.optional(v4.number)
});
v32.defaultProps = {
    height = 44
};
v32.init = function(v33) --[[ Line: 112 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v9 (copy), v7 (copy), v18 (copy)
    v33.rootRef = v3.createRef();
    v33.tabRefs = v9.createRefCache();
    local v34, v35 = v3.createBinding(0);
    v33.selectedBackgroundPositionX = v34;
    v33.setSelectedBackgroundPositionX = v35;
    v33.selectedBackgroundMotor = v7.createSingleMotor(4);
    v33.selectedBackgroundMotor:onStep(function(v36) --[[ Line: 118 ]]
        -- upvalues: v33 (copy)
        v33.setSelectedBackgroundPositionX(v36);
    end);
    v33:setState({
        tabWidth = 0, 
        computedMinFrameWidth = 0
    });
    v33.onTabActivated = function(v37) --[[ Line: 127 ]]
        -- upvalues: v33 (copy)
        v33.props.onTabActivated(v37);
    end;
    v33.setSize = function(v38) --[[ Line: 131 ]]
        -- upvalues: v33 (copy), v7 (ref), v18 (ref)
        local v39 = math.floor((math.max(v38.AbsoluteSize.X, v33.state.computedMinFrameWidth) - 8) / #v33.props.tabs);
        v33.selectedBackgroundMotor:setGoal(v7.spring(4 + v39 * (v33.props.selectedTabIndex - 1), v18));
        v33:setState({
            tabWidth = v39
        });
    end;
end;
v32.render = function(v40) --[[ Line: 144 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v10 (copy), v13 (copy), v20 (copy), v21 (copy), v22 (copy), v17 (copy), v16 (copy), v3 (copy), v9 (copy), v5 (copy), v11 (copy), v23 (copy), v12 (copy), v19 (copy)
    return v6(function(v41) --[[ Line: 145 ]]
        -- upvalues: v40 (copy), v10 (ref), v13 (ref), v20 (ref), v21 (ref), v22 (ref), v17 (ref), v16 (ref), v3 (ref), v9 (ref), v5 (ref), v11 (ref), v23 (ref), v12 (ref), v19 (ref)
        local l_controlState_0 = v40.state.controlState;
        local v43 = #v40.props.tabs;
        local v44 = v40.props.tabs[v40.props.selectedTabIndex].isDisabled and v10.Disabled or l_controlState_0;
        local v45 = v13(v20, l_controlState_0, v41);
        local v46 = v13(v21, l_controlState_0, v41);
        local v47 = v13(v22, v44, v41);
        local l_tabWidth_0 = v40.state.tabWidth;
        local v49 = if v40.props.icon then v17 else 0;
        local l_height_0 = v40.props.height;
        local v51 = v40.props.height - 12;
        local v52 = v40.props.height - 16;
        local v53 = v41.Font.Header2.RelativeSize * v41.Font.BaseSize;
        if v40.state.computedMinFrameWidth == 0 then
            local v54 = 0;
            for v55 = 1, v43 do
                local l_tabName_0 = v40.props.tabs[v55].tabName;
                v54 = math.max(v54, v16(l_tabName_0, v53, Enum.Font.BuilderSans, Vector2.new(1e999, 1e999)).X);
            end;
            local v57 = v54 + 8;
            local v58 = (v49 + 80) * v43 + 8;
            local v59 = (v49 + v57) * v43 + 8;
            v40:setState({
                computedMinFrameWidth = if v40.props.maxWidth then math.min(v59, v40.props.maxWidth) else math.max(v59, v58)
            });
        end;
        local v60 = {};
        for v61 = 1, v43 - 1 do
            if v61 ~= v40.props.selectedTabIndex and v61 ~= v40.props.selectedTabIndex - 1 then
                table.insert(v60, v61, v3.createElement("Frame", {
                    Size = UDim2.fromOffset(1, v52), 
                    BackgroundTransparency = v46.Transparency, 
                    BackgroundColor3 = v46.Color, 
                    Position = UDim2.fromOffset(4 + l_tabWidth_0 * v61, (l_height_0 - v52) / 2)
                }));
            end;
        end;
        return v9.withFocusController(function(v62) --[[ Line: 204 ]]
            -- upvalues: v40 (ref), v43 (copy), v5 (ref), v3 (ref), v9 (ref), l_tabWidth_0 (copy), l_height_0 (copy), v11 (ref), v23 (ref), v12 (ref), v51 (copy), v19 (ref), v45 (copy), v60 (copy), v52 (copy), v47 (copy)
            local function _(v63) --[[ Line: 205 ]]
                -- upvalues: v62 (copy), v40 (ref)
                if v63 > 1 then
                    v62.moveFocusTo(v40.tabRefs[v63 - 1]);
                end;
            end;
            local function _(v65) --[[ Line: 210 ]]
                -- upvalues: v43 (ref), v62 (copy), v40 (ref)
                if v65 < v43 then
                    v62.moveFocusTo(v40.tabRefs[v65 + 1]);
                end;
            end;
            local function v67() --[[ Line: 215 ]]
                -- upvalues: v62 (copy), v40 (ref)
                v62.moveFocusTo(v40.rootRef);
            end;
            local v76 = v5.List.map(v40.props.tabs, function(v68, v69) --[[ Line: 220 ]]
                -- upvalues: v3 (ref), v9 (ref), l_tabWidth_0 (ref), l_height_0 (ref), v40 (ref), v43 (ref), v67 (copy), v62 (copy), v11 (ref), v23 (ref)
                return v3.createElement(v9.Focusable.Frame, {
                    key = v68.tabName, 
                    LayoutOrder = v69, 
                    Size = UDim2.fromOffset(l_tabWidth_0, l_height_0), 
                    BackgroundTransparency = 1, 
                    [v3.Ref] = v40.tabRefs[v69], 
                    NextSelectionLeft = v69 > 1 and v40.tabRefs[v69 - 1] or nil, 
                    NextSelectionRight = v69 < v43 and v40.tabRefs[v69 + 1] or nil, 
                    inputBindings = {
                        LeaveA = v9.Input.onBegin(Enum.KeyCode.ButtonA, v67), 
                        LeaveB = v9.Input.onBegin(Enum.KeyCode.ButtonB, v67), 
                        SelectNext1 = v9.Input.onBegin(Enum.KeyCode.ButtonR1, function() --[[ Line: 232 ]]
                            -- upvalues: v69 (copy), v43 (ref), v62 (ref), v40 (ref)
                            local l_v69_0 = v69;
                            if l_v69_0 < v43 then
                                v62.moveFocusTo(v40.tabRefs[l_v69_0 + 1]);
                            end;
                        end), 
                        SelectPre1 = v9.Input.onBegin(Enum.KeyCode.ButtonL1, function() --[[ Line: 235 ]]
                            -- upvalues: v69 (copy), v62 (ref), v40 (ref)
                            local l_v69_1 = v69;
                            if l_v69_1 > 1 then
                                v62.moveFocusTo(v40.tabRefs[l_v69_1 - 1]);
                            end;
                        end), 
                        SelectNext2 = v9.Input.onBegin(Enum.KeyCode.ButtonR2, function() --[[ Line: 238 ]]
                            -- upvalues: v69 (copy), v43 (ref), v62 (ref), v40 (ref)
                            local l_v69_2 = v69;
                            if l_v69_2 < v43 then
                                v62.moveFocusTo(v40.tabRefs[l_v69_2 + 1]);
                            end;
                        end), 
                        SelectPre2 = v9.Input.onBegin(Enum.KeyCode.ButtonL2, function() --[[ Line: 241 ]]
                            -- upvalues: v69 (copy), v62 (ref), v40 (ref)
                            local l_v69_3 = v69;
                            if l_v69_3 > 1 then
                                v62.moveFocusTo(v40.tabRefs[l_v69_3 - 1]);
                            end;
                        end), 
                        SelectNext3 = v9.Input.onBegin(Enum.KeyCode.ButtonR3, function() --[[ Line: 244 ]]
                            -- upvalues: v69 (copy), v43 (ref), v62 (ref), v40 (ref)
                            local l_v69_4 = v69;
                            if l_v69_4 < v43 then
                                v62.moveFocusTo(v40.tabRefs[l_v69_4 + 1]);
                            end;
                        end), 
                        SelectPre3 = v9.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 247 ]]
                            -- upvalues: v69 (copy), v62 (ref), v40 (ref)
                            local l_v69_5 = v69;
                            if l_v69_5 > 1 then
                                v62.moveFocusTo(v40.tabRefs[l_v69_5 - 1]);
                            end;
                        end)
                    }
                }, {
                    Tab = v3.createElement(v11, {
                        text = v68.tabName, 
                        onActivated = function() --[[ Line: 254 ]] --[[ Name: onActivated ]]
                            -- upvalues: v40 (ref), v69 (copy)
                            v40.onTabActivated(v69);
                        end, 
                        Size = UDim2.fromScale(1, 1), 
                        isDisabled = v68.isDisabled, 
                        isSelectedStyle = v40.props.selectedTabIndex == v69, 
                        icon = v68.icon, 
                        iconStateColorMap = v23
                    })
                });
            end);
            return v3.createElement("Frame", {
                Size = UDim2.new(v40.props.width.Scale, v40.props.width.Offset, 0, l_height_0), 
                BackgroundTransparency = 1, 
                [v3.Change.AbsoluteSize] = v40.setSize, 
                LayoutOrder = v40.props.layoutOrder
            }, {
                SizeConstraint = v3.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(v40.state.computedMinFrameWidth, l_height_0), 
                    MaxSize = Vector2.new(640, l_height_0)
                }), 
                Background = v3.createElement(v12.Label, {
                    Size = UDim2.new(1, 0, 0, v51), 
                    Position = UDim2.fromOffset(0, (l_height_0 - v51) / 2), 
                    BackgroundTransparency = 1, 
                    Image = v19, 
                    ImageColor3 = v45.Color, 
                    ImageTransparency = v45.Transparency, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    ZIndex = 1
                }), 
                Dividers = v3.createElement(v9.Focusable.Frame, {
                    Size = UDim2.new(1, 0, 0, l_height_0), 
                    Position = UDim2.fromOffset(0, 0), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2, 
                    NextSelectionLeft = v40.props.NextSelectionLeft, 
                    NextSelectionRight = v40.props.NextSelectionRight, 
                    NextSelectionUp = v40.props.NextSelectionUp, 
                    NextSelectionDown = v40.props.NextSelectionDown, 
                    [v3.Ref] = v40.rootRef, 
                    inputBindings = {
                        Enter = v9.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 301 ]]
                            -- upvalues: v62 (copy), v40 (ref)
                            v62.moveFocusTo(v40.tabRefs[v40.props.selectedTabIndex]);
                        end)
                    }
                }, v60), 
                SelectedBackground = v3.createElement(v12.Label, {
                    Size = UDim2.fromOffset(l_tabWidth_0, v52), 
                    Position = v40.selectedBackgroundPositionX:map(function(v77) --[[ Line: 309 ]]
                        -- upvalues: l_height_0 (ref), v52 (ref)
                        return UDim2.fromOffset(v77, (l_height_0 - v52) / 2);
                    end), 
                    BackgroundTransparency = 1, 
                    Image = v19, 
                    ImageColor3 = v47.Color, 
                    ImageTransparency = v47.Transparency, 
                    LayoutOrder = 2, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    ZIndex = 4
                }), 
                TabContainer = v3.createElement(v9.Focusable.Frame, {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.fromScale(0, 0), 
                    ZIndex = 5, 
                    defaultChild = v40.tabRefs[v40.props.selectedTabIndex]
                }, {
                    TabLayout = v3.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }); 
                    v3.createFragment(v76)
                })
            });
        end);
    end);
end;
v32.didUpdate = function(v78, v79) --[[ Line: 342 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy), v18 (copy)
    if v79.selectedTabIndex ~= v78.props.selectedTabIndex then
        v78.selectedBackgroundMotor:setGoal(v7.spring(4 + v78.state.tabWidth * (v78.props.selectedTabIndex - 1), v18));
    end;
end;
return v32;