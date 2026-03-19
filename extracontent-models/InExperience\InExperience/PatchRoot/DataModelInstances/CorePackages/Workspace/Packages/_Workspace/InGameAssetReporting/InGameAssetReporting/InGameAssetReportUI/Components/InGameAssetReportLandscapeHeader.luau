local l_Parent_0 = script:FindFirstAncestor("InGameAssetReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_Images_0 = v2.App.ImageSet.Images;
local l_withStyle_0 = v2.Style.withStyle;
local function _(v10) --[[ Line: 30 ]] --[[ Name: renderHeaderBarCenter ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy)
    return function() --[[ Line: 31 ]]
        -- upvalues: l_withStyle_0 (ref), v1 (ref), v10 (copy)
        return l_withStyle_0(function(v11) --[[ Line: 32 ]]
            -- upvalues: v1 (ref), v10 (ref)
            local l_Theme_0 = v11.Theme;
            local l_Font_0 = v11.Font;
            return v1.createElement("TextLabel", {
                Text = v10, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
end;
local function _(v15, v16, v17, v18, v19) --[[ Line: 52 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    local v20 = v18 or v19;
    return function() --[[ Line: 54 ]]
        -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v15 (copy), v20 (copy), v19 (copy), v16 (copy), v18 (copy), v17 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = v15
            }), 
            UndoButton = v20 and v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not v19, 
                layoutOrder = 2, 
                onActivated = v16
            }), 
            RedoButton = v20 and v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v18, 
                layoutOrder = 3, 
                onActivated = v17
            })
        });
    end;
end;
local _ = function(v22, _, v24) --[[ Line: 89 ]] --[[ Name: renderHeaderBarRight ]]
    -- upvalues: v1 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    return function() --[[ Line: 90 ]]
        -- upvalues: v1 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), v22 (copy), v24 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v1.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v22, 
                            text = v24
                        }
                    }
                }
            })
        });
    end;
end;
return function(v26) --[[ Line: 115 ]] --[[ Name: LandscapeModeHeader ]]
    -- upvalues: v1 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), l_withStyle_0 (copy)
    local l_createElement_0 = v1.createElement;
    local v28 = "Frame";
    local v29 = {
        BorderSizePixel = 0, 
        BackgroundTransparency = 0.1, 
        BackgroundColor3 = Color3.fromHex("#000000"), 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 71), 
        ZIndex = 2
    };
    local v30 = {};
    local l_createElement_1 = v1.createElement;
    local l_l_HeaderBar_0_0 = l_HeaderBar_0;
    local v33 = {
        backgroundTransparency = 1, 
        barHeight = 72
    };
    local l_backAction_0 = v26.backAction;
    local l_undoAnnotationPoints_0 = v26.undoAnnotationPoints;
    local l_redoAnnotationPoints_0 = v26.redoAnnotationPoints;
    local l_isRedoEnabled_0 = v26.isRedoEnabled;
    local l_isUndoEnabled_0 = v26.isUndoEnabled;
    local v39 = l_isRedoEnabled_0 or l_isUndoEnabled_0;
    local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 9 -> 15 ]];
    local l_l_undoAnnotationPoints_0_0 = l_undoAnnotationPoints_0 --[[ copy: 10 -> 16 ]];
    local l_l_redoAnnotationPoints_0_0 = l_redoAnnotationPoints_0 --[[ copy: 11 -> 17 ]];
    v33.renderLeft = function() --[[ Line: 54 ]]
        -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_l_backAction_0_0 (copy), v39 (copy), l_isUndoEnabled_0 (copy), l_l_undoAnnotationPoints_0_0 (copy), l_isRedoEnabled_0 (copy), l_l_redoAnnotationPoints_0_0 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = l_l_backAction_0_0
            }), 
            UndoButton = v39 and v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not l_isUndoEnabled_0, 
                layoutOrder = 2, 
                onActivated = l_l_undoAnnotationPoints_0_0
            }), 
            RedoButton = v39 and v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not l_isRedoEnabled_0, 
                layoutOrder = 3, 
                onActivated = l_l_redoAnnotationPoints_0_0
            })
        });
    end;
    l_backAction_0 = v26.nextAction;
    l_undoAnnotationPoints_0 = v26.annotationPoints;
    l_redoAnnotationPoints_0 = v26.nextText;
    local l_l_backAction_0_1 = l_backAction_0 --[[ copy: 9 -> 18 ]];
    v33.renderRight = function() --[[ Line: 90 ]]
        -- upvalues: v1 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), l_l_backAction_0_1 (copy), l_redoAnnotationPoints_0 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v1.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_l_backAction_0_1, 
                            text = l_redoAnnotationPoints_0
                        }
                    }
                }
            })
        });
    end;
    l_backAction_0 = v26.titleText;
    v33.renderCenter = function() --[[ Line: 31 ]]
        -- upvalues: l_withStyle_0 (ref), v1 (ref), l_backAction_0 (copy)
        return l_withStyle_0(function(v44) --[[ Line: 32 ]]
            -- upvalues: v1 (ref), l_backAction_0 (ref)
            local l_Theme_1 = v44.Theme;
            local l_Font_1 = v44.Font;
            return v1.createElement("TextLabel", {
                Text = l_backAction_0, 
                Font = l_Font_1.Header2.Font, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
    v30.Bar = l_createElement_1(l_l_HeaderBar_0_0, v33);
    return l_createElement_0(v28, v29, v30);
end;