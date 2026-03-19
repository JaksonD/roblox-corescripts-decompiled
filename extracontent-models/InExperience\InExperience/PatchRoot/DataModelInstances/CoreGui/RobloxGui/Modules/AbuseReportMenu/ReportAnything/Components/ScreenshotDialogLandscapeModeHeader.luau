local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local l_IconButton_0 = v1.App.Button.IconButton;
local l_IconSize_0 = v1.App.ImageSet.Enum.IconSize;
local l_Images_0 = v1.App.ImageSet.Images;
local l_withStyle_0 = v1.Style.withStyle;
local function _(v11) --[[ Line: 30 ]] --[[ Name: renderWrappingCenter ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy)
    return function() --[[ Line: 31 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), v11 (copy)
        return l_withStyle_0(function(v12) --[[ Line: 32 ]]
            -- upvalues: v2 (ref), v11 (ref)
            local l_Theme_0 = v12.Theme;
            local l_Font_0 = v12.Font;
            return v2.createElement("TextLabel", {
                Text = v11, 
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
local function _(v16, v17, v18, v19, v20) --[[ Line: 52 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v2 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    local v21 = v19 or v20;
    return function() --[[ Line: 54 ]]
        -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v16 (copy), v21 (copy), v20 (copy), v17 (copy), v19 (copy), v18 (copy)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = v16
            }), 
            UndoButton = v21 and v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not v20, 
                layoutOrder = 2, 
                onActivated = v17
            }), 
            RedoButton = v21 and v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v19, 
                layoutOrder = 3, 
                onActivated = v18
            })
        });
    end;
end;
local function _(v23, v24) --[[ Line: 89 ]] --[[ Name: renderHeaderBarRight ]]
    -- upvalues: v2 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v3 (copy)
    return function() --[[ Line: 90 ]]
        -- upvalues: v2 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), v23 (copy), v24 (copy), v3 (ref)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v2.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 105 ]] --[[ Name: onActivated ]]
                                -- upvalues: v23 (ref), v24 (ref)
                                v23(v24);
                            end, 
                            text = v3:FormatByKey("Feature.ReportAbuse.Action.Next")
                        }
                    }
                }
            })
        });
    end;
end;
return function(v26) --[[ Line: 116 ]] --[[ Name: LandscapeModeHeader ]]
    -- upvalues: v2 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v3 (copy), l_withStyle_0 (copy)
    local l_createElement_0 = v2.createElement;
    local v28 = "Frame";
    local v29 = {
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 47), 
        ZIndex = 2
    };
    local v30 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_HeaderBar_0_0 = l_HeaderBar_0;
    local v33 = {
        backgroundTransparency = 1, 
        barHeight = 48
    };
    local l_backAction_0 = v26.backAction;
    local l_undoAnnotationPoints_0 = v26.undoAnnotationPoints;
    local l_redoAnnotationPoints_0 = v26.redoAnnotationPoints;
    local l_isRedoEnabled_0 = v26.isRedoEnabled;
    local l_isUndoEnabled_0 = v26.isUndoEnabled;
    local v39 = l_isRedoEnabled_0 or l_isUndoEnabled_0;
    local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 9 -> 15 ]];
    local l_l_undoAnnotationPoints_0_0 = l_undoAnnotationPoints_0 --[[ copy: 10 -> 16 ]];
    v33.renderLeft = function() --[[ Line: 54 ]]
        -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_l_backAction_0_0 (copy), v39 (copy), l_isUndoEnabled_0 (copy), l_l_undoAnnotationPoints_0_0 (copy), l_isRedoEnabled_0 (copy), l_redoAnnotationPoints_0 (copy)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = l_l_backAction_0_0
            }), 
            UndoButton = v39 and v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not l_isUndoEnabled_0, 
                layoutOrder = 2, 
                onActivated = l_l_undoAnnotationPoints_0_0
            }), 
            RedoButton = v39 and v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not l_isRedoEnabled_0, 
                layoutOrder = 3, 
                onActivated = l_redoAnnotationPoints_0
            })
        });
    end;
    l_backAction_0 = v26.finishAnnotationAction;
    l_undoAnnotationPoints_0 = v26.annotationPoints;
    local l_l_backAction_0_1 = l_backAction_0 --[[ copy: 9 -> 17 ]];
    v33.renderRight = function() --[[ Line: 90 ]]
        -- upvalues: v2 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), l_l_backAction_0_1 (copy), l_undoAnnotationPoints_0 (copy), v3 (ref)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v2.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 105 ]] --[[ Name: onActivated ]]
                                -- upvalues: l_l_backAction_0_1 (ref), l_undoAnnotationPoints_0 (ref)
                                l_l_backAction_0_1(l_undoAnnotationPoints_0);
                            end, 
                            text = v3:FormatByKey("Feature.ReportAbuse.Action.Next")
                        }
                    }
                }
            })
        });
    end;
    l_backAction_0 = v26.titleText;
    v33.renderCenter = function() --[[ Line: 31 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), l_backAction_0 (copy)
        return l_withStyle_0(function(v43) --[[ Line: 32 ]]
            -- upvalues: v2 (ref), l_backAction_0 (ref)
            local l_Theme_1 = v43.Theme;
            local l_Font_1 = v43.Font;
            return v2.createElement("TextLabel", {
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