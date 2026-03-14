local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_ImageSetButton_0 = v1.Core.ImageSet.ImageSetButton;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.Components.Divider);
local v11 = require(l_Parent_0.Components.ScreenshotHighlighter);
local v12 = require(l_Parent_0.Utility.VirtualKeyboardMonitor);
local v13 = require(l_Parent_0.Components.ScreenshotDialogPortraitModeHeader);
local v14 = require(l_Parent_0.Components.ScreenshotDialogLandscapeModeHeader);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local l_GetFFlagAvatarIdentificationSafeAreaFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarIdentificationSafeAreaFix;
local v17 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local function v19(v18) --[[ Line: 45 ]] --[[ Name: PortraitModeFooter ]]
    -- upvalues: v2 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v17 (copy)
    return v2.createElement("Frame", {
        BackgroundTransparency = 0, 
        Size = UDim2.new(1, 0, 0, 60), 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        LayoutOrder = 4
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        Container = v2.createElement("Frame", {
            Size = UDim2.new(0, 400, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 32), 
                PaddingRight = UDim.new(0, 32)
            }), 
            ActionButtons = v2.createElement(l_ButtonStack_0, {
                marginBetween = 8, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 76 ]] --[[ Name: onActivated ]]
                                -- upvalues: v18 (copy)
                                v18.finishAnnotationAction(v18.annotationPoints);
                            end, 
                            text = v17:FormatByKey("Feature.ReportAbuse.Action.Next")
                        }
                    }
                }
            })
        })
    });
end;
return function(v20) --[[ Line: 88 ]] --[[ Name: ScreenshotDialog ]]
    -- upvalues: l_useStyle_0 (copy), v12 (copy), v2 (copy), v3 (copy), l_ImageSetButton_0 (copy), v9 (copy), v13 (copy), v14 (copy), v10 (copy), l_GetFFlagAvatarIdentificationSafeAreaFix_0 (copy), v11 (copy), v19 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v22 = v12.getInstance();
    local function v23() --[[ Line: 94 ]]
        -- upvalues: v22 (copy), v20 (copy)
        warn("OverlayActivated");
        if v22:isKeyboardJustOff() then
            return;
        else
            if v20.dismissAction then
                warn("Menu dismissed");
                v20.dismissAction();
            end;
            return;
        end;
    end;
    local v24, v25 = v2.useState(v3.Dictionary.join({}, v20.initialAnnotationPoints or {}));
    local v26, v27 = v2.useState({});
    local v28 = v2.useCallback(function() --[[ Line: 111 ]]
        -- upvalues: v25 (copy), v24 (copy)
        v25(table.clone(v24));
    end, {
        v25, 
        v24
    });
    local v29 = v2.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v20 (copy)
        v20.reportAnythingAnalytics.incrementAnnotationBack();
        v20.backAction();
    end, {
        v20.backAction, 
        v20.reportAnythingAnalytics
    });
    local v31 = v2.useCallback(function(_) --[[ Line: 120 ]]
        -- upvalues: v20 (copy), v28 (copy), v27 (copy)
        v20.reportAnythingAnalytics.incrementAnnotationPlace();
        v28();
        v27({});
    end, {
        v27, 
        v28, 
        v20.reportAnythingAnalytics
    });
    local v32 = v2.useCallback(function() --[[ Line: 127 ]]
        -- upvalues: v24 (copy), v20 (copy), v26 (copy), v28 (copy)
        if #v24 > 0 then
            v20.reportAnythingAnalytics.incrementAnnotationUndo();
            table.insert(v26, 1, v24[#v24]);
            table.remove(v24, #v24);
            v28();
        end;
    end, {
        v28, 
        v24, 
        v26, 
        v20.reportAnythingAnalytics
    });
    local v33 = v2.useCallback(function() --[[ Line: 137 ]]
        -- upvalues: v26 (copy), v20 (copy), v24 (copy), v28 (copy)
        if #v26 > 0 then
            v20.reportAnythingAnalytics.incrementAnnotationRedo();
            table.insert(v24, v26[1]);
            table.remove(v26, 1);
            v28();
        end;
    end, {
        v28, 
        v24, 
        v26, 
        v20.reportAnythingAnalytics
    });
    local v35 = v2.useCallback(function(v34) --[[ Line: 147 ]]
        -- upvalues: v20 (copy)
        v20.reportAnythingAnalytics.setAnnotationNext();
        v20.finishAnnotationAction(v34);
    end, {
        v20.finishAnnotationAction, 
        v20.reportAnythingAnalytics
    });
    local v36 = #v24 > 0;
    local v37 = #v26 > 0;
    return v2.createElement("TextButton", {
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        ZIndex = 10, 
        Text = "", 
        [v2.Event.Activated] = v23
    }, {
        ScreenshotDialog = v2.createElement(l_ImageSetButton_0, {
            Active = true, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Image = v9.Images.RoundedRect.Image, 
            ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
            ScaleType = v9.Images.RoundedRect.ScaleType, 
            SliceCenter = v9.Images.RoundedRect.SliceCenter
        }, {
            HeaderAndContent = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, v20.isSmallPortraitMode and -60 or 0), 
                BackgroundTransparency = 1
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Header = if v20.isSmallPortraitMode then v2.createElement(v13, {
                    titleText = v20.titleText, 
                    backAction = v29, 
                    undoAnnotationPoints = v32, 
                    redoAnnotationPoints = v33, 
                    isRedoEnabled = v37, 
                    isUndoEnabled = v36, 
                    annotationPoints = v24
                }) else v2.createElement(v14, {
                    titleText = v20.titleText, 
                    backAction = v29, 
                    finishAnnotationAction = v35, 
                    undoAnnotationPoints = v32, 
                    redoAnnotationPoints = v33, 
                    isRedoEnabled = v37, 
                    isUndoEnabled = v36, 
                    annotationPoints = v24
                }), 
                Divider = v2.createElement(v10, {
                    LayoutOrder = 2
                }), 
                ScreenshotAnnotation = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 1, -49), 
                    ZIndex = 1
                }, {
                    Container = v2.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        BackgroundTransparency = 1
                    }, {
                        UIAspectRatioConstraint = if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then nil else v2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = v20.imageAspectRatio
                        }), 
                        Layout = if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }) else nil, 
                        Padding = v2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 16), 
                            PaddingBottom = UDim.new(0, 16), 
                            PaddingLeft = UDim.new(0, 16), 
                            PaddingRight = UDim.new(0, 16)
                        }), 
                        AnnotationLayer = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            BorderSizePixel = 2, 
                            BorderMode = if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then Enum.BorderMode.Outline else Enum.BorderMode.Inset, 
                            BorderColor3 = Color3.fromRGB(255, 255, 255)
                        }, {
                            UIAspectRatioConstraint = if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then v2.createElement("UIAspectRatioConstraint", {
                                AspectRatio = v20.imageAspectRatio
                            }) else nil, 
                            ScreenshotImage = v2.createElement("ImageLabel", {
                                Size = UDim2.fromScale(1, 1), 
                                Image = v20.screenshot, 
                                ScaleType = Enum.ScaleType.Fit, 
                                ZIndex = 1
                            }, {}), 
                            Highlighter = v2.createElement(v11, {
                                annotationPoints = v24, 
                                handleAnnotationPoints = v31, 
                                setAnnotationCircleRadius = v20.setAnnotationCircleRadius, 
                                setAnnotationAreaDimensions = v20.setAnnotationAreaDimensions, 
                                ZIndex = 3
                            }, {})
                        })
                    })
                })
            }), 
            Footer = if v20.isSmallPortraitMode then v2.createElement(v19, {
                finishAnnotationAction = v35, 
                annotationPoints = v24
            }) else nil
        })
    });
end;