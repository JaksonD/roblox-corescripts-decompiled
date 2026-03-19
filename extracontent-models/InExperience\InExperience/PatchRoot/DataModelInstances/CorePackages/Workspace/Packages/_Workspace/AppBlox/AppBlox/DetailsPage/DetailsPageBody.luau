local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(script.Parent.ContentPosition);
local v2 = require(script.Parent.validateDetailsPageComponentList);
local v3 = require(script.Parent.getPlatformConfig);
local v4 = require(script.Parent.DetailsPageTitleContent);
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.t);
local v7 = v5.PureComponent:extend("DetailsPageBody");
v7.validateProps = v6.strictInterface({
    titleText = v6.optional(v6.string), 
    subTitleText = v6.optional(v6.string), 
    renderInfoContent = v6.optional(v6.callback), 
    componentList = v6.optional(v2), 
    dualPanelBreakpoint = v6.optional(v6.number), 
    sideMargin = v6.optional(v6.number), 
    bodyClipsDescendants = v6.optional(v6.boolean), 
    maxContentWidth = v6.optional(v6.number), 
    showPageDetails = v6.optional(v6.boolean), 
    deviceType = v6.optional(v6.string), 
    bottomPadding = v6.optional(v6.number)
});
v7.defaultProps = {
    bodyClipsDescendants = true, 
    showPageDetails = false
};
v7.init = function(v8) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v8.state = {
        containerWidth = nil
    };
    v8.containerFrameRef = v5.createRef();
    v8.mounted = false;
    v8.onContainerSizeChange = function(v9) --[[ Line: 54 ]]
        -- upvalues: v8 (copy)
        if not v8.mounted then
            return;
        else
            v8:setState(function(v10, _) --[[ Line: 59 ]]
                -- upvalues: v9 (copy)
                if v10.containerWidth ~= v9.AbsoluteSize.x then
                    return {
                        containerWidth = v9.AbsoluteSize.x
                    };
                else
                    return nil;
                end;
            end);
            return;
        end;
    end;
end;
v7.renderSinglePanel = function(v12) --[[ Line: 70 ]] --[[ Name: renderSinglePanel ]]
    -- upvalues: v5 (copy)
    local v13 = {
        Layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 24)
        }), 
        UISizeConstraint = if v12.props.maxContentWidth then v5.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v12.props.maxContentWidth, 1e999)
        }) else nil
    };
    for v14, v15 in pairs(v12.props.componentList) do
        v13[v14 .. "Container"] = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v15.portraitLayoutOrder
        }, {
            [v14] = v15.renderComponent()
        });
    end;
    return {
        Panel = v5.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.fromScale(1, 0), 
            ClipsDescendants = false, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, v13)
    };
end;
v7.renderDualPanel = function(v16) --[[ Line: 109 ]] --[[ Name: renderDualPanel ]]
    -- upvalues: v5 (copy), v1 (copy)
    local v17 = v16.state.containerWidth < 1920 and 48 or 96;
    local v18 = {
        Layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 24)
        })
    };
    local v19 = {
        Layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 24)
        })
    };
    for v20, v21 in pairs(v16.props.componentList) do
        local l_v18_0 = v18;
        if v21.landscapePosition == v1.Right then
            l_v18_0 = v19;
        end;
        l_v18_0[v20 .. "Container"] = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v21.landscapeLayoutOrder
        }, {
            [v20] = v21.renderComponent()
        });
    end;
    local v23 = v5.createElement("Frame", {
        Size = UDim2.new(0.5, -v17 / 2, 0, 0), 
        ClipsDescendants = true, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1
    }, v18);
    local v24 = v5.createElement("Frame", {
        Size = UDim2.new(0.5, -v17 / 2, 0, 0), 
        ClipsDescendants = false, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 2
    }, v19);
    return {
        Layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v17)
        }), 
        LeftPanel = v23, 
        RightPanel = v24
    };
end;
v7.renderBodyContent = function(v25) --[[ Line: 176 ]] --[[ Name: renderBodyContent ]]
    local v26 = v25.props.dualPanelBreakpoint or 1280;
    if v25.state.containerWidth and v25.props.componentList then
        if v25.state.containerWidth < v26 then
            return v25:renderSinglePanel();
        else
            return v25:renderDualPanel();
        end;
    else
        return {};
    end;
end;
v7.render = function(v27) --[[ Line: 189 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy)
    local v28 = v3(v27.props.deviceType);
    local v29 = if v27.props.sideMargin then v27.props.sideMargin else v28.sideMargin;
    return v5.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = v27.props.bodyClipsDescendants, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v5.Ref] = v27.containerFrameRef, 
        [v5.Change.AbsoluteSize] = v27.onContainerSizeChange
    }, {
        Layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        UIPadding = v5.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v29), 
            PaddingRight = UDim.new(0, v29)
        }), 
        TitleInfo = v27.props.showPageDetails and v5.createElement(v4, {
            titleText = v27.props.titleText, 
            subTitleText = v27.props.subTitleText, 
            renderInfoContent = v27.props.renderInfoContent, 
            verticalAlignment = Enum.VerticalAlignment.Top, 
            layoutOrder = 1
        } or nil), 
        Padding = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, not v27.props.showPageDetails and 24 or v29), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }), 
        ContentFrame = v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 3
        }, v27:renderBodyContent()), 
        BottomPadding = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v27.props.bottomPadding or 3 * v29), 
            BackgroundTransparency = 1, 
            LayoutOrder = 4
        })
    });
end;
v7.didMount = function(v30) --[[ Line: 239 ]] --[[ Name: didMount ]]
    v30.mounted = true;
    if v30.containerFrameRef.current then
        v30.onContainerSizeChange(v30.containerFrameRef.current);
    end;
end;
v7.willUnmount = function(v31) --[[ Line: 247 ]] --[[ Name: willUnmount ]]
    v31.mounted = false;
end;
return v7;