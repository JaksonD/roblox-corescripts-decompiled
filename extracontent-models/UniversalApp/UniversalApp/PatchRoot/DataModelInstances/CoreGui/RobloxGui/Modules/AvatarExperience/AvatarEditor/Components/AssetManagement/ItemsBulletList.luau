local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = v4.Focusable;
local l_VerticalScrollViewWithMargin_0 = v6.App.Container.VerticalScrollViewWithMargin;
local l_withStyle_0 = v6.Style.withStyle;
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.BulletListEntry);
local v11 = v3.PureComponent:extend("ItemsBulletList");
v11.validateProps = v5.strictInterface({
    items = v5.array(v5.string), 
    maxHeight = v5.number, 
    onScrollableUpdated = v5.callback, 
    forwardRef = v5.table
});
v11.init = function(v12) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v12:setState({
        canvasSizeY = 0
    });
    v12.scrollViewRef = v3.createRef();
    local v13, v14 = v3.createBinding(false);
    v12.topGradientVisibleBinding = v13;
    v12.updateTopGradientVisibleBinding = v14;
    v13, v14 = v3.createBinding(false);
    v12.bottomGradientVisibleBinding = v13;
    v12.updateBottomGradientVisibleBinding = v14;
    v12.checkIsScrollable = function() --[[ Line: 44 ]]
        -- upvalues: v12 (copy)
        local v15 = v12.state.canvasSizeY > v12.props.maxHeight;
        v12.props.onScrollableUpdated(v15);
    end;
    v12.onContentSizeChanged = function(v16) --[[ Line: 50 ]]
        -- upvalues: v12 (copy)
        if v12.state.canvasSizeY ~= v16.AbsoluteContentSize.Y then
            v12:setState({
                canvasSizeY = v16.AbsoluteContentSize.Y
            });
        end;
    end;
    v13 = v12.props.forwardRef;
    v12.firstEntryPositionChanged = function(v17) --[[ Line: 60 ]]
        -- upvalues: v13 (copy), v12 (copy)
        local v18 = v13:getValue();
        if not v18 then
            return;
        elseif v17.AbsolutePosition.Y + 5 < v18.AbsolutePosition.Y then
            v12.updateTopGradientVisibleBinding(true);
            return;
        else
            v12.updateTopGradientVisibleBinding(false);
            return;
        end;
    end;
    v12.lastEntryPositionChanged = function(v19) --[[ Line: 73 ]]
        -- upvalues: v13 (copy), v12 (copy)
        local v20 = v13:getValue();
        if not v20 then
            return;
        else
            local v21 = v19.AbsolutePosition.Y + v19.AbsoluteSize.Y;
            if v20.AbsolutePosition.Y + v20.AbsoluteSize.Y < v21 - 5 then
                v12.updateBottomGradientVisibleBinding(true);
                return;
            else
                v12.updateBottomGradientVisibleBinding(false);
                return;
            end;
        end;
    end;
end;
v11.createBulletList = function(v22) --[[ Line: 89 ]] --[[ Name: createBulletList ]]
    -- upvalues: v3 (copy), v10 (copy)
    local v23 = {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 10), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v3.Change.AbsoluteContentSize] = v22.onContentSizeChanged
        })
    };
    for v24, v25 in v22.props.items do
        local v26 = nil;
        if v24 == 1 then
            v26 = v22.firstEntryPositionChanged;
        elseif v24 == #v22.props.items then
            v26 = v22.lastEntryPositionChanged;
        end;
        v23[v24] = v3.createElement(v10, {
            text = v25, 
            layoutOrder = v24, 
            positionChangedCallback = v26
        });
    end;
    return v23;
end;
v11.renderWithProviders = function(v27, v28) --[[ Line: 120 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v3 (copy), l_Focusable_0 (copy), l_VerticalScrollViewWithMargin_0 (copy)
    local l_Theme_0 = v28.Theme;
    local v30 = v27:createBulletList();
    local v31 = math.min(v27.state.canvasSizeY, v27.props.maxHeight);
    local l_forwardRef_0 = v27.props.forwardRef;
    return v3.createElement(l_Focusable_0.Frame, {
        defaultChild = v27.scrollViewRef, 
        restorePreviousChildFocus = true, 
        Size = UDim2.new(1, 0, 0, v31), 
        BackgroundTransparency = 1, 
        [v3.Ref] = l_forwardRef_0
    }, {
        TopGradient = v3.createElement("Frame", {
            Visible = v27.topGradientVisibleBinding, 
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        ScrollView = v3.createElement(l_VerticalScrollViewWithMargin_0, {
            size = UDim2.fromScale(1, 1), 
            canvasSizeY = UDim.new(0, v27.state.canvasSizeY), 
            isGamepadFocusable = true, 
            [v3.Ref] = v27.scrollViewRef
        }, v30), 
        BottomGradient = v3.createElement("Frame", {
            Visible = v27.bottomGradientVisibleBinding, 
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        })
    });
end;
v11.render = function(v33) --[[ Line: 185 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v34) --[[ Line: 186 ]]
        -- upvalues: v33 (copy)
        return v33:renderWithProviders(v34);
    end);
end;
v11.didMount = function(v35) --[[ Line: 191 ]] --[[ Name: didMount ]]
    v35.checkIsScrollable();
end;
v11.didUpdate = function(v36, v37, v38) --[[ Line: 195 ]] --[[ Name: didUpdate ]]
    local v39 = v36.props.maxHeight ~= v37.maxHeight;
    local v40 = v36.state.canvasSizeY ~= v38.canvasSizeY;
    if v39 or v40 then
        v36.checkIsScrollable();
    end;
end;
return v3.forwardRef(function(v41, v42) --[[ Line: 204 ]]
    -- upvalues: v3 (copy), v11 (copy), v2 (copy)
    return v3.createElement(v11, v2.Dictionary.join(v41, {
        forwardRef = v42
    }));
end);