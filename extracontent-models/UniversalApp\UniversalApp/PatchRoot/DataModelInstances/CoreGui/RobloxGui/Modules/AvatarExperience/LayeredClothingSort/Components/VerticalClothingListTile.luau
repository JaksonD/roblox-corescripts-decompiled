local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_SpringAnimatedItem_0 = v7.Utility.SpringAnimatedItem;
local l_withSelectionCursorProvider_0 = v7.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v7.App.SelectionImage.CursorKind;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v13 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local v14 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.DraggableTile);
local v15 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LCSortMoreButton);
local v16 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LCSortArrowNav);
local v17 = l_SpringAnimatedItem_0.wrap(v4.Focusable.Frame);
local v18 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v18.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v18.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v23 = UDim.new(0, 10);
local v24 = {
    dampingRatio = 1, 
    frequency = 10
};
local v25 = v3.PureComponent:extend("VerticalClothingListTile");
v25.validateProps = v5.strictInterface({
    asset = v5.table, 
    selectedAssetId = v5.optional(v5.string), 
    positionYOffset = v5.number, 
    dragging = v5.boolean, 
    positionBinding = v5.union(v5.UDim2, v5.table), 
    isTileSelected = v5.boolean, 
    tileIndex = v5.number, 
    contextualOptionsVisible = v5.union(v5.boolean, v5.table), 
    updateContextualOptionsVisible = v5.callback, 
    resetSelectedTile = v5.callback, 
    initializeDrag = v5.callback, 
    onEndClick = v5.callback, 
    tileRef = v5.optional(v5.table), 
    lastInputIsGamepad = v5.boolean, 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    wrapperRef = v5.optional(v5.table)
});
v25.defaultProps = {
    lastInputIsGamepad = false
};
v25.init = function(v26) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v26.tileRef = v26.props.tileRef or v3.createRef();
    v26.timeOfInputBegan = 0;
    v26.clickAndHoldConn = nil;
    v26:setState({
        dragAfterShortPress = false
    });
end;
v25.disconnectConn = function(v27) --[[ Line: 87 ]] --[[ Name: disconnectConn ]]
    if v27.clickAndHoldConn then
        v27.clickAndHoldConn:Disconnect();
        v27.clickAndHoldConn = nil;
    end;
end;
v25.renderSelectedTile = function(v28, _, v30) --[[ Line: 94 ]] --[[ Name: renderSelectedTile ]]
    -- upvalues: l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v13 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v4 (copy), v23 (copy), v14 (copy), l_IsVRAppBuild_0 (copy), v15 (copy), v16 (copy)
    local l_Theme_0 = v30.Theme;
    local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
    local v33 = l_getRbxthumbWithTypeSizeAndOptions_0(v28.props.asset.id, l_Asset_0, 150);
    local v34 = UDim2.fromOffset(v13.Tile.Padding + v13.Tile.Size / 2, v28.props.positionYOffset + v13.Tile.Size / 2);
    local v35 = (not not v28.props.dragging or v28.state.dragAfterShortPress) and v28.props.positionBinding or v34;
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or v4.Focusable.Frame, {
        Active = true, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(v13.Tile.SelectedSize, v13.Tile.SelectedSize), 
        Position = v35, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v3.Event.InputBegan] = function(v36, v37) --[[ Line: 114 ]]
            -- upvalues: v28 (copy), v13 (ref)
            local l_UserInputType_0 = v37.UserInputType;
            if v28.props.dragging or l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_0 ~= Enum.UserInputType.Touch then
                return;
            else
                v28:setState({
                    dragAfterShortPress = true
                });
                v28.props.updateContextualOptionsVisible(false);
                v28.props.initializeDrag(v36, v37, v28.props.asset, v28.props.tileIndex, v13.Tile.Size / 2);
                return;
            end;
        end
    }, {
        SelectionBackground = not v28.props.lastInputIsGamepad and v3.createElement("Frame", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Theme_0.IconEmphasis.Color, 
            ZIndex = 3, 
            Size = UDim2.fromScale(1, 1)
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = v23
            })
        }), 
        ItemTile = v3.createElement(v14, {
            thumbnail = v33, 
            isSelectedByTap = true, 
            ZIndex = 4, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, -4, 1, -4), 
            assetTypeId = v28.props.asset.typeId
        }), 
        LCSortMoreButton = if l_IsVRAppBuild_0() then nil else v3.createElement(v15, {
            ZIndex = 2, 
            Visible = v28.props.contextualOptionsVisible, 
            asset = v28.props.asset, 
            onUnequip = v28.props.resetSelectedTile
        }), 
        LCSortArrowNav = v3.createElement(v16, {
            Visible = v28.props.contextualOptionsVisible, 
            index = v28.props.tileIndex, 
            asset = v28.props.asset
        })
    });
end;
v25.renderUnselectedTile = function(v39, _) --[[ Line: 168 ]] --[[ Name: renderUnselectedTile ]]
    -- upvalues: l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v3 (copy), v17 (copy), v13 (copy), l_RunService_0 (copy), v24 (copy), v14 (copy)
    local l_Asset_1 = l_Constants_0.RbxthumbTypes.Asset;
    local v42 = l_getRbxthumbWithTypeSizeAndOptions_0(v39.props.asset.id, l_Asset_1, 150);
    local l_positionYOffset_0 = v39.props.positionYOffset;
    return v3.createElement(v17, {
        animatedValues = {
            positionY = l_positionYOffset_0
        }, 
        mapValuesToProps = function(v44) --[[ Line: 178 ]] --[[ Name: mapValuesToProps ]]
            -- upvalues: v13 (ref)
            return {
                Position = UDim2.fromOffset(v13.Tile.Padding, v44.positionY)
            };
        end, 
        regularProps = {
            Active = true, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v13.Tile.Size, v13.Tile.Size), 
            AnchorPoint = Vector2.new(0, 0), 
            [v3.Event.InputBegan] = function(v45, v46) --[[ Line: 188 ]]
                -- upvalues: v39 (copy), l_RunService_0 (ref), v13 (ref)
                if v39.props.dragging then
                    return;
                else
                    local l_UserInputType_1 = v46.UserInputType;
                    if l_UserInputType_1 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                        return;
                    elseif v46.UserInputState ~= Enum.UserInputState.Begin then
                        return;
                    else
                        v39:disconnectConn();
                        v39.timeOfInputBegan = tick();
                        v39.clickAndHoldConn = l_RunService_0.RenderStepped:connect(function(_) --[[ Line: 208 ]]
                            -- upvalues: v39 (ref), v13 (ref), v45 (copy), v46 (copy)
                            if tick() - v39.timeOfInputBegan >= v13.LongPressSeconds then
                                if not v39.props.dragging then
                                    v39.props.initializeDrag(v45, v46, v39.props.asset, v39.props.tileIndex);
                                end;
                                v39:disconnectConn();
                            end;
                        end);
                        return;
                    end;
                end;
            end, 
            [v3.Event.InputEnded] = function(v49, v50) --[[ Line: 221 ]]
                -- upvalues: v39 (copy)
                if v39.props.dragging or not v39.clickAndHoldConn then
                    return;
                else
                    local l_UserInputType_2 = v50.UserInputType;
                    if l_UserInputType_2 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_2 ~= Enum.UserInputType.Touch then
                        return;
                    elseif v50.UserInputState == Enum.UserInputState.Change then
                        v39.props.initializeDrag(v49, v50, v39.props.asset, v39.props.tileIndex);
                        v39:disconnectConn();
                        return;
                    else
                        v39:disconnectConn();
                        v39.props.updateContextualOptionsVisible(true);
                        v39.props.onEndClick(v39.props.asset);
                        return;
                    end;
                end;
            end
        }, 
        springOptions = v24
    }, {
        ItemTile = v3.createElement(v14, {
            thumbnail = v42, 
            imageTransparency = v39.props.selectedAssetId == nil and 0 or 0.5, 
            assetTypeId = v39.props.asset.typeId
        })
    });
end;
v25.renderWithProviders = function(v52, v53, v54) --[[ Line: 256 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v4 (copy), l_CursorKind_0 (copy)
    local v55 = v52.props.isTileSelected and v52:renderSelectedTile(v53, v54) or v52:renderUnselectedTile(v53);
    local v56 = v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or v4.Focusable.Frame, {
        [v3.Ref] = v52.tileRef, 
        SelectionImageObject = v53(l_CursorKind_0.RoundedRectNoInset)
    }, v55);
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ZIndex = v52.props.isTileSelected and 6 or 4, 
        SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
        SelectionBehaviorUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 and v52.props.isTileSelected then Enum.SelectionBehavior.Stop else nil, 
        SelectionBehaviorDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 and v52.props.isTileSelected then Enum.SelectionBehavior.Stop else nil, 
        [v3.Ref] = v52.props.wrapperRef, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v52.props.NextSelectionUp, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v52.props.NextSelectionDown, 
        NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v52.props.NextSelectionRight, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v52.props.NextSelectionLeft
    }, v56);
end;
v25.render = function(v57) --[[ Line: 291 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy), l_withStyle_0 (copy)
    return l_withSelectionCursorProvider_0(function(v58) --[[ Line: 292 ]]
        -- upvalues: l_withStyle_0 (ref), v57 (copy)
        return l_withStyle_0(function(v59) --[[ Line: 293 ]]
            -- upvalues: v57 (ref), v58 (copy)
            return v57:renderWithProviders(v58, v59);
        end);
    end);
end;
v25.didUpdate = function(v60, v61) --[[ Line: 299 ]] --[[ Name: didUpdate ]]
    if v60.state.dragAfterShortPress and not v60.props.isTileSelected and v61.isTileSelected then
        v60:setState({
            dragAfterShortPress = false
        });
    end;
end;
v25.willUnmount = function(v62) --[[ Line: 307 ]] --[[ Name: willUnmount ]]
    v62:disconnectConn();
end;
return v3.forwardRef(function(v63, v64) --[[ Line: 311 ]]
    -- upvalues: v3 (copy), v25 (copy), v6 (copy)
    return v3.createElement(v25, v6.Dictionary.join(v63, {
        wrapperRef = v64
    }));
end);