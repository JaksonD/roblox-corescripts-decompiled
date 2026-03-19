local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_VerticalScrollViewWithMargin_0 = v6.App.Container.VerticalScrollViewWithMargin;
local l_withStyle_0 = v6.Style.withStyle;
local l_EmptyState_0 = v6.App.Indicator.EmptyState;
local v11 = require(script.ListSection);
local l_Parent_0 = script.Parent.Parent;
local v13 = require(l_Parent_0.GetAssetsDifference);
local v14 = require(l_Parent_0.Actions.AddAnalyticsInfo);
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v16 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v17 = v2.PureComponent:extend("ItemsList");
v17.validateProps = v5.strictInterface({
    humanoidDescription = v5.optional(v5.instanceOf("HumanoidDescription")), 
    loadingFailed = v5.boolean, 
    retryLoadDescription = v5.callback, 
    itemListScrollableUpdated = v5.optional(v5.callback), 
    addAnalyticsInfo = v5.callback
});
v17.init = function(v18) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v13 (copy)
    v18:setState({
        canvasSizeY = 0, 
        loading = true, 
        addedAssetNames = nil, 
        removedAssetNames = nil
    });
    v18.mounted = false;
    v18.frameRef = v2.createRef();
    local v19, v20 = v2.createBinding(false);
    v18.topGradientVisibleBinding = v19;
    v18.updateTopGradientVisibleBinding = v20;
    v19, v20 = v2.createBinding(false);
    v18.bottomGradientVisibleBinding = v19;
    v18.updateBottomGradientVisibleBinding = v20;
    v18.addedSectionRef = v2.createRef();
    v18.removedSectionRef = v2.createRef();
    v18.noChangedAssetsRef = v2.createRef();
    v18.lastWasScrollable = nil;
    v18.checkIsScrollable = function() --[[ Line: 61 ]]
        -- upvalues: v18 (copy)
        local v21 = v18.frameRef:getValue();
        if not v21 then
            return;
        elseif not v18.props.itemListScrollableUpdated then
            return;
        else
            local v22 = v18.state.canvasSizeY > v21.AbsoluteSize.Y;
            if v22 ~= v18.lastWasScrollable then
                v18.lastWasScrollable = v22;
                v18.props.itemListScrollableUpdated(v22, v21.AbsoluteSize.Y);
            end;
            return;
        end;
    end;
    v18.onContentSizeChanged = function(v23) --[[ Line: 79 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            canvasSizeY = v23.AbsoluteContentSize.Y
        });
    end;
    v18.firstEntryPositionChanged = function(v24) --[[ Line: 85 ]]
        -- upvalues: v18 (copy)
        local v25 = v18.frameRef:getValue();
        if not v25 then
            return;
        elseif v24.AbsolutePosition.Y < v25.AbsolutePosition.Y then
            v18.updateTopGradientVisibleBinding(true);
            return;
        else
            v18.updateTopGradientVisibleBinding(false);
            return;
        end;
    end;
    v18.lastEntryPositionChanged = function(v26) --[[ Line: 98 ]]
        -- upvalues: v18 (copy)
        local v27 = v18.frameRef:getValue();
        if not v27 then
            return;
        elseif v26.AbsolutePosition.Y + v26.AbsoluteSize.Y > v27.AbsolutePosition.Y + v27.AbsoluteSize.Y then
            v18.updateBottomGradientVisibleBinding(true);
            return;
        else
            v18.updateBottomGradientVisibleBinding(false);
            return;
        end;
    end;
    v18.loadAssetNames = function() --[[ Line: 113 ]]
        -- upvalues: v13 (ref), v18 (copy)
        coroutine.wrap(function() --[[ Line: 114 ]]
            -- upvalues: v13 (ref), v18 (ref)
            v13(v18.props.humanoidDescription):andThen(function(v28) --[[ Line: 115 ]]
                -- upvalues: v18 (ref)
                if v18.mounted then
                    v18.props.addAnalyticsInfo(v28.addedAssetIds, v28.removedAssetIds);
                    v18:setState({
                        loading = false, 
                        addedAssetNames = v28.addedNames, 
                        removedAssetNames = v28.removedNames
                    });
                end;
            end, function(_) --[[ Line: 125 ]]
                -- upvalues: v18 (ref)
                if v18.mounted then
                    v18:setState({
                        loading = false
                    });
                end;
            end);
        end)();
    end;
    v18.onRetryLoading = function() --[[ Line: 135 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            loading = true
        });
        if v18.props.humanoidDescription then
            v18.loadAssetNames();
            return;
        else
            v18.props.retryLoadDescription();
            return;
        end;
    end;
end;
v17.createEntriesList = function(v30) --[[ Line: 148 ]] --[[ Name: createEntriesList ]]
    -- upvalues: v16 (copy), v2 (copy), v3 (copy), v11 (copy)
    local v31 = {};
    if #v30.state.addedAssetNames > 0 then
        local v32 = v16:FormatByKey("CoreScripts.AvatarEditorPrompts.Adding");
        table.insert(v31, v2.createElement(v3.Focusable[v11], {
            headerText = v32, 
            items = v30.state.addedAssetNames, 
            layoutOrder = 1, 
            isFirstSection = true, 
            isLastSection = #v30.state.removedAssetNames == 0, 
            NextSelectionDown = v30.removedSectionRef, 
            [v2.Ref] = v30.addedSectionRef
        }));
        if #v30.state.removedAssetNames > 0 then
            table.insert(v31, v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 20), 
                LayoutOrder = 2
            }));
        end;
    end;
    if #v30.state.removedAssetNames > 0 then
        local v33 = v16:FormatByKey("CoreScripts.AvatarEditorPrompts.Removing");
        table.insert(v31, v2.createElement(v3.Focusable[v11], {
            headerText = v33, 
            items = v30.state.removedAssetNames, 
            layoutOrder = 3, 
            isFirstSection = #v30.state.addedAssetNames == 0, 
            isLastSection = true, 
            NextSelectionUp = v30.addedSectionRef, 
            [v2.Ref] = v30.removedSectionRef
        }));
    end;
    local v34 = false;
    if #v30.state.addedAssetNames == 0 then
        v34 = #v30.state.removedAssetNames == 0;
    end;
    if v34 then
        local v35 = v16:FormatByKey("CoreScripts.AvatarEditorPrompts.NoChangedAssets");
        table.insert(v31, v2.createElement(v3.Focusable[v11], {
            headerText = v35, 
            items = {}, 
            layoutOrder = 1, 
            isFirstSection = true, 
            isLastSection = true, 
            [v2.Ref] = v30.noChangedAssetsRef
        }));
    end;
    return v31;
end;
v17.renderItemsList = function(v36) --[[ Line: 217 ]] --[[ Name: renderItemsList ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), v3 (copy), l_VerticalScrollViewWithMargin_0 (copy)
    return l_withStyle_0(function(v37) --[[ Line: 218 ]]
        -- upvalues: v36 (copy), v2 (ref), v3 (ref), l_VerticalScrollViewWithMargin_0 (ref)
        local l_Theme_0 = v37.Theme;
        local v39 = v36:createEntriesList();
        v39.Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 10), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Change.AbsoluteContentSize] = v36.onContentSizeChanged
        });
        return v2.createElement(v3.Focusable.Frame, {
            defaultChild = v36.addedSectionRef, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            [v2.Ref] = v36.frameRef
        }, {
            TopGradient = v2.createElement("Frame", {
                Visible = v36.topGradientVisibleBinding, 
                Size = UDim2.new(1, 0, 0, 30), 
                Position = UDim2.fromScale(0, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                UIGradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundUIDefault.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            }), 
            ScrollView = v2.createElement(l_VerticalScrollViewWithMargin_0, {
                size = UDim2.fromScale(1, 1), 
                canvasSizeY = UDim.new(0, v36.state.canvasSizeY)
            }, v39), 
            BottomGradient = v2.createElement("Frame", {
                Visible = v36.bottomGradientVisibleBinding, 
                Size = UDim2.new(1, 0, 0, 30), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                UIGradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundUIDefault.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(1, 0)
                    })
                })
            })
        });
    end);
end;
v17.renderLoading = function(_) --[[ Line: 294 ]] --[[ Name: renderLoading ]]
    -- upvalues: v2 (copy), l_Skeleton_0 (copy)
    return v2.createElement(l_Skeleton_0, {
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    });
end;
v17.renderFailed = function(v41) --[[ Line: 302 ]] --[[ Name: renderFailed ]]
    -- upvalues: v2 (copy), l_EmptyState_0 (copy), v16 (copy)
    return v2.createElement(l_EmptyState_0, {
        text = v16:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"), 
        size = UDim2.fromScale(1, 1), 
        onActivated = v41.onRetryLoading
    });
end;
v17.render = function(v42) --[[ Line: 310 ]] --[[ Name: render ]]
    if v42.state.loading and not v42.props.loadingFailed then
        return v42:renderLoading();
    elseif v42.state.addedAssetNames then
        return v42:renderItemsList();
    else
        return v42:renderFailed();
    end;
end;
v17.didMount = function(v43) --[[ Line: 322 ]] --[[ Name: didMount ]]
    v43.mounted = true;
    if v43.props.humanoidDescription then
        v43.loadAssetNames();
    end;
    v43.checkIsScrollable();
end;
v17.didUpdate = function(v44, v45, _) --[[ Line: 331 ]] --[[ Name: didUpdate ]]
    -- upvalues: v2 (copy)
    v44.checkIsScrollable();
    if v45.humanoidDescription ~= v44.props.humanoidDescription then
        v44:setState({
            loading = true, 
            addedAssetNames = v2.None, 
            removedAssetNames = v2.None
        });
        v44.loadAssetNames();
    end;
end;
v17.willUnmount = function(v47) --[[ Line: 345 ]] --[[ Name: willUnmount ]]
    v47.mounted = false;
end;
return v4.connect(nil, function(v48) --[[ Line: 349 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy)
    return {
        addAnalyticsInfo = function(v49) --[[ Line: 351 ]] --[[ Name: addAnalyticsInfo ]]
            -- upvalues: v48 (copy), v14 (ref)
            return v48(v14(v49));
        end
    };
end)(v17);