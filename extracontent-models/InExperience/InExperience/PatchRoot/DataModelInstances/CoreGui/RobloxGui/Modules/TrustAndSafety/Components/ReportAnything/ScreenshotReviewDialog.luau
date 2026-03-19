local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local _ = v1.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local l_IconButton_0 = v1.App.Button.IconButton;
local l_IconSize_0 = v1.App.ImageSet.Enum.IconSize;
local l_ImageSetButton_0 = v1.Core.ImageSet.ImageSetButton;
local l_Images_0 = v1.App.ImageSet.Images;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_Button_0 = v1.App.Button.Button;
local l_ButtonType_1 = v1.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v1.App.Button.Enum.StandardButtonSize;
local l_Parent_0 = script.Parent.Parent.Parent;
local v15 = require(l_Parent_0.Resources.Assets);
local v16 = require(l_Parent_0.Dependencies);
local v17 = require(l_Parent_0.Components.ReportAnything.RestartScreenshotDialog);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local v19 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v20 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
local v21 = require(v16.Divider);
local function v28(v22) --[[ Line: 45 ]] --[[ Name: ScreenshotReviewDialogSmallPortraitModeHeaderRight ]]
    -- upvalues: v2 (copy), v19 (copy), l_Button_0 (copy), l_ButtonType_1 (copy), l_StandardButtonSize_0 (copy)
    local v23, v24 = v2.useState(0);
    local v26 = v2.useCallback(function(v25) --[[ Line: 47 ]]
        -- upvalues: v24 (copy)
        v24(v25.AbsoluteSize.X);
    end, {
        v24
    });
    local v27 = v2.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v22 (copy)
        v22.setShowRestartDialog(true);
    end, {
        v22.setShowRestartDialog
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Text = v2.createElement("TextLabel", {
            LayoutOrder = -1, 
            Text = v19:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"), 
            Font = v22.font.Header2.Font, 
            TextColor3 = v22.theme.TextEmphasis.Color, 
            TextTransparency = v22.theme.TextEmphasis.Transparency, 
            TextSize = 20, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Size = UDim2.new(0, v22.viewportWidth - v23 - 50, 1, 0), 
            BackgroundTransparency = 1
        }), 
        RetakeButton = v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_1.Secondary, 
            text = v19:FormatByKey("Feature.ReportAbuse.Action.Retake"), 
            fitContent = true, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            onActivated = v27, 
            [v2.Change.AbsoluteSize] = v26
        })
    });
end;
return function(v29) --[[ Line: 91 ]] --[[ Name: ScreenshotReviewDialog ]]
    -- upvalues: v2 (copy), v20 (copy), l_useStyle_0 (copy), v17 (copy), l_ImageSetButton_0 (copy), v15 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v28 (copy), l_Button_0 (copy), l_ButtonType_1 (copy), v19 (copy), l_StandardButtonSize_0 (copy), v21 (copy), l_ButtonStack_0 (copy)
    v2.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v29 (copy)
        if v29.reportAnythingAnalytics then
            v29.reportAnythingAnalytics.incrementAnnotationOptionSeen();
        end;
    end, {});
    local v30 = 60;
    if v20() and v29.isSmallPortraitMode then
        v30 = 104;
    end;
    local v31, v32 = v2.useState(false);
    local v33 = l_useStyle_0();
    local l_Theme_0 = v33.Theme;
    local l_Font_0 = v33.Font;
    local v36 = if v29.viewportHeight >= 800 then UDim2.new(0, 800, 0, 800) else UDim2.new(1, 0, 1, 0);
    return v2.createElement("TextButton", {
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 10, 
        Text = "", 
        [v2.Event.Activated] = v29.onBack
    }, {
        Container = v2.createElement("Frame", {
            Size = if v29.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else v36, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = 0, 
            ZIndex = 10
        }, {
            RestartDialog = v31 and v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                DialogBody = v2.createElement(v17, {
                    ZIndex = 3, 
                    isSmallPortraitMode = v29.isSmallPortraitMode, 
                    onCancel = function() --[[ Line: 135 ]] --[[ Name: onCancel ]]
                        -- upvalues: v32 (copy)
                        v32(false);
                    end, 
                    onRestart = v29.onRestart
                })
            }), 
            RestartDialogMask = v31 and v2.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 0.2, 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                Active = true, 
                AutoButtonColor = false, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = v15.Images.RoundedRect.Image, 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = 1, 
                ScaleType = v15.Images.RoundedRect.ScaleType, 
                SliceCenter = v15.Images.RoundedRect.SliceCenter
            }, {}), 
            ScreenshotDialog = v2.createElement(l_ImageSetButton_0, {
                Active = true, 
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v15.Images.RoundedRect.Image, 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                ScaleType = v15.Images.RoundedRect.ScaleType, 
                SliceCenter = v15.Images.RoundedRect.SliceCenter
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HeaderAndContent = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -v30), 
                    BackgroundTransparency = 1
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Header = v2.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = Color3.fromHex("#4F545F"), 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 48)
                    }, {
                        Bar = v2.createElement(l_HeaderBar_0, {
                            backgroundTransparency = 1, 
                            barHeight = 48, 
                            margin = 12, 
                            renderLeft = function() --[[ Line: 193 ]] --[[ Name: renderLeft ]]
                                -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v29 (copy)
                                return v2.createElement(l_IconButton_0, {
                                    iconSize = l_IconSize_0.Medium, 
                                    icon = l_Images_0["icons/navigation/pushBack"], 
                                    onActivated = function() --[[ Line: 197 ]] --[[ Name: onActivated ]]
                                        -- upvalues: v29 (ref)
                                        v29.onBack();
                                    end
                                });
                            end, 
                            renderRight = function() --[[ Line: 203 ]] --[[ Name: renderRight ]]
                                -- upvalues: v20 (ref), v29 (copy), v2 (ref), v28 (ref), v32 (copy), l_Font_0 (copy), l_Theme_0 (copy), l_Button_0 (ref), l_ButtonType_1 (ref), v19 (ref), l_StandardButtonSize_0 (ref)
                                if v20() and v29.isSmallPortraitMode then
                                    return v2.createElement(v28, {
                                        setShowRestartDialog = v32, 
                                        font = l_Font_0, 
                                        theme = l_Theme_0, 
                                        viewportWidth = v29.viewportWidth
                                    });
                                else
                                    local v37 = v29.isSmallPortraitMode and 72 or 120;
                                    local v38 = v29.isSmallPortraitMode and 28 or 36;
                                    return v2.createElement(l_Button_0, {
                                        buttonType = l_ButtonType_1.Secondary, 
                                        size = if v20() then nil else UDim2.new(0, v37, 0, v38), 
                                        text = if v20() then v19:FormatByKey("Feature.ReportAbuse.Action.Retake") else "Retake", 
                                        fitContent = v20(), 
                                        standardSize = if v20() then l_StandardButtonSize_0.XSmall else nil, 
                                        onActivated = function() --[[ Line: 227 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v32 (ref)
                                            v32(true);
                                        end
                                    });
                                end;
                            end, 
                            title = if v20() then if v29.isSmallPortraitMode then nil else v19:FormatByKey("Feature.SettingsHub.Label.SceneCaptured") else "Scene Captured", 
                            isSecondary = v29.isSmallPortraitMode
                        })
                    }), 
                    Divider = v2.createElement(v21, {
                        LayoutOrder = 2
                    }), 
                    ScreenshotBody = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 1, -60), 
                        ZIndex = 10
                    }, {
                        Padding = v2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 16)
                        }), 
                        Layout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        ScreenshotContainer = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, -32), 
                            BackgroundTransparency = 2, 
                            LayoutOrder = 1
                        }, {
                            Padding = v2.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 12), 
                                PaddingBottom = UDim.new(0, 12), 
                                PaddingLeft = UDim.new(0, 16), 
                                PaddingRight = UDim.new(0, 16)
                            }), 
                            Screenshot = v2.createElement("Frame", {
                                Size = UDim2.new(1, 0, 1, 0), 
                                Position = UDim2.fromScale(0.5, 0.5), 
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                BorderSizePixel = 2, 
                                BorderMode = Enum.BorderMode.Inset, 
                                BorderColor3 = Color3.fromRGB(255, 255, 255), 
                                LayoutOrder = 1
                            }, {
                                UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                                    AspectRatio = v29.imageAspectRatio
                                }), 
                                ScreenshotImage = v2.createElement(l_ImageSetButton_0, {
                                    Active = true, 
                                    Size = UDim2.fromScale(1, 1), 
                                    Image = v29.screenshot, 
                                    ZIndex = 1, 
                                    AnchorPoint = Vector2.new(0.5, 0.5), 
                                    Position = UDim2.fromScale(0.5, 0.5), 
                                    BackgroundTransparency = 1, 
                                    ScaleType = Enum.ScaleType.Fit, 
                                    SliceCenter = v15.Images.RoundedRect.SliceCenter, 
                                    [v2.Event.Activated] = function() --[[ Line: 290 ]]
                                        -- upvalues: v29 (copy)
                                        v29.onNextPage();
                                    end
                                })
                            })
                        }), 
                        Description = v2.createElement("TextLabel", {
                            Text = if v20() then v19:FormatByKey("Feature.ReportAbuse.Message.ProblemNotInScene") else "If the problem is not in this scene, you can \226\128\156Retake\226\128\157\nthe screenshot.", 
                            Font = l_Font_0.Header1.Font, 
                            LayoutOrder = 2, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            TextSize = v29.isSmallPortraitMode and 12 or 20, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextWrapped = v20(), 
                            Size = if v20() then UDim2.new(1, -24, 0, v29.isSmallPortraitMode and 24 or 40) else UDim2.new(1, 0, 0, 20), 
                            BackgroundTransparency = 1
                        })
                    })
                }), 
                Footer = v2.createElement("Frame", {
                    BackgroundTransparency = 0, 
                    Size = UDim2.new(1, 0, 0, v30), 
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
                        Size = if v20() and v29.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else UDim2.new(0, v29.isSmallPortraitMode and 400 or 612, 1, 0), 
                        BackgroundTransparency = 1
                    }, {
                        Padding = v2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 12), 
                            PaddingBottom = UDim.new(0, 12), 
                            PaddingLeft = UDim.new(0, 16), 
                            PaddingRight = UDim.new(0, 16)
                        }), 
                        ActionButtons = v2.createElement(l_ButtonStack_0, {
                            forcedFillDirection = if v20() and v29.isSmallPortraitMode then Enum.FillDirection.Vertical else nil, 
                            marginBetween = 8, 
                            buttons = {
                                {
                                    buttonType = l_ButtonType_1.Secondary, 
                                    props = {
                                        onActivated = v29.onSkip, 
                                        text = if v20() then v19:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot") else "Attach Screenshot"
                                    }
                                }, 
                                {
                                    buttonType = l_ButtonType_1.PrimarySystem, 
                                    props = {
                                        onActivated = function() --[[ Line: 360 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v29 (copy)
                                            v29.onNextPage();
                                        end, 
                                        text = if v20() then v19:FormatByKey("Feature.ReportAbuse.Action.HighlightScene") else "Highlight Scene"
                                    }
                                }
                            }
                        })
                    })
                })
            })
        })
    });
end;