local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_CallbackInputBox_0 = v2.SocialLibraries.config({}).Components.CallbackInputBox;
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagDescriptionModalThrottleError);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v15 = require(l_script_FirstAncestor_0.Utils.FocusNavigatorWrapper);
return function(v16) --[[ Line: 48 ]]
    -- upvalues: v3 (copy), l_useLocalization_0 (copy), v14 (copy), l_useStyle_0 (copy), v12 (copy), v15 (copy), l_InteractiveAlert_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_CallbackInputBox_0 (copy), v11 (copy), l_ButtonType_0 (copy)
    local v17 = v3.useRef(nil);
    local v18, v19 = v3.useState(v16.initialText);
    local v20 = string.len(v18);
    local v21 = l_useLocalization_0({
        cancelButtonText = v14.CancelButtonText, 
        saveButtonText = v14.SaveButtonText, 
        saySomething = v14.SaySomething, 
        pinLocked = v14.PinLocked
    });
    local v22 = l_useStyle_0();
    local l_Font_0 = v22.Font;
    local l_Theme_0 = v22.Theme;
    local v25 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local function v28(v26) --[[ Line: 65 ]] --[[ Name: textChanged ]]
        -- upvalues: v17 (copy), v19 (copy)
        if string.len(v26) > 1000 then
            v26 = string.sub(v26, 1, 1000);
            local _ = 1000;
            if v17 and v17.current then
                v17.current.Text = v26;
            end;
        end;
        v19(v26);
    end;
    local function v29() --[[ Line: 78 ]] --[[ Name: onSave ]]
        -- upvalues: v16 (copy), v18 (copy)
        v16.saveOnActivated(v18);
    end;
    if v12 then
        return v15({
            onClose = v16.cancelOnActivated
        }, {
            v3.createElement(l_InteractiveAlert_0, {
                title = v16.title, 
                screenSize = v16.screenSize, 
                anchorPoint = Vector2.new(0.5, 0), 
                position = UDim2.new(0.5, 0, 0, 44), 
                middleContent = function() --[[ Line: 90 ]] --[[ Name: middleContent ]]
                    -- upvalues: v3 (ref), l_Font_0 (copy), v16 (copy), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_CallbackInputBox_0 (ref), v25 (copy), v21 (copy), v28 (copy), v17 (copy), v11 (ref), v20 (copy)
                    return v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, {
                        InputGroup = v3.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.fromScale(1, 1), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 1
                        }, {
                            UIListLayout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Description = v3.createElement("TextLabel", {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                TextWrapped = true, 
                                Font = l_Font_0.Body.Font, 
                                Text = v16.description, 
                                TextSize = 14, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                RichText = true
                            }), 
                            Padding = v3.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, 0, 0, 24), 
                                LayoutOrder = 2
                            }), 
                            InputBackground = v3.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.new(1, 0, 0, 144), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 3, 
                                Image = l_Images_0["component_assets/circle_21"], 
                                ImageColor3 = l_Theme_0.UIMuted.Color, 
                                ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                                ScaleType = Enum.ScaleType.Slice, 
                                SliceCenter = Rect.new(8, 8, 9, 9)
                            }, {
                                InputBorder = v3.createElement(l_ImageSetLabel_0, {
                                    Size = UDim2.new(1, 0, 0, 144), 
                                    BackgroundTransparency = 1, 
                                    LayoutOrder = 1, 
                                    Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                                    ImageColor3 = l_Theme_0.Divider.Color, 
                                    ScaleType = Enum.ScaleType.Slice, 
                                    SliceCenter = Rect.new(8, 8, 9, 9)
                                }, {
                                    Padding = v3.createElement("UIPadding", {
                                        PaddingLeft = UDim.new(0, 12), 
                                        PaddingRight = UDim.new(0, 12), 
                                        PaddingTop = UDim.new(0, 7)
                                    }), 
                                    Textbox = v3.createElement(l_CallbackInputBox_0, {
                                        inputTextXAlignment = Enum.TextXAlignment.Left, 
                                        inputTextYAlignment = Enum.TextYAlignment.Top, 
                                        inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                        inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                        inputTextSize = v25, 
                                        initialInputText = v16.initialText, 
                                        placeholderText = v21.saySomething, 
                                        placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                        captureFocusOnMount = true, 
                                        textChangedCallback = v28, 
                                        inputBoxRef = v17, 
                                        multiLine = true, 
                                        textWrapped = true, 
                                        clearButtonDisabled = true, 
                                        clearButtonSize = 0
                                    })
                                })
                            }), 
                            Counter = v3.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, 0, 0, 22), 
                                LayoutOrder = 4
                            }, {
                                ThrottleError = if v11 and v16.throttleError then v3.createElement("TextLabel", {
                                    Position = UDim2.fromScale(0, 0.4), 
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    BackgroundTransparency = 1, 
                                    Font = l_Font_0.CaptionBody.Font, 
                                    Text = v16.throttleErrorText, 
                                    TextXAlignment = 0, 
                                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize * 0.9, 
                                    TextColor3 = l_Theme_0.Alert.Color, 
                                    TextTransparency = l_Theme_0.Alert.Transparency
                                }) else nil; 
                                v3.createElement("TextLabel", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    BackgroundTransparency = 1, 
                                    Font = l_Font_0.CaptionBody.Font, 
                                    Text = if v16.textError then v21.pinLocked else string.format("%d/%d", v20, 1000), 
                                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                                    TextColor3 = if not (v20 ~= 1000) or v16.textError then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                                    TextTransparency = if not (v20 ~= 1000) or v16.textError then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                                    AnchorPoint = if v16.textError then Vector2.new(0, 1) else Vector2.new(1, 1), 
                                    Position = if v16.textError then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
                                    TextWrapped = true
                                }, {
                                    UISizeConstraint = v3.createElement("UISizeConstraint", {
                                        MaxSize = Vector2.new(1e999, l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize * 2)
                                    })
                                })
                            })
                        })
                    });
                end, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = v16.cancelOnActivated, 
                                text = v21.cancelButtonText
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v29, 
                                text = v21.saveButtonText
                            }
                        }
                    }, 
                    buttonHeight = 48, 
                    marginBetween = 6, 
                    forcedFillDirection = Enum.FillDirection.Horizontal
                }
            })
        });
    else
        return v3.createElement(l_InteractiveAlert_0, {
            title = v16.title, 
            screenSize = v16.screenSize, 
            anchorPoint = Vector2.new(0.5, 0), 
            position = UDim2.new(0.5, 0, 0, 44), 
            middleContent = function() --[[ Line: 247 ]] --[[ Name: middleContent ]]
                -- upvalues: v3 (ref), l_Font_0 (copy), v16 (copy), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_CallbackInputBox_0 (ref), v25 (copy), v21 (copy), v28 (copy), v17 (copy), v11 (ref), v20 (copy)
                return v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    InputGroup = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 1), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 1
                    }, {
                        UIListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Description = v3.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextWrapped = true, 
                            Font = l_Font_0.Body.Font, 
                            Text = v16.description, 
                            TextSize = 14, 
                            TextColor3 = l_Theme_0.TextDefault.Color, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            RichText = true
                        }), 
                        Padding = v3.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 24), 
                            LayoutOrder = 2
                        }), 
                        InputBackground = v3.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 0, 144), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3, 
                            Image = l_Images_0["component_assets/circle_21"], 
                            ImageColor3 = l_Theme_0.UIMuted.Color, 
                            ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(8, 8, 9, 9)
                        }, {
                            InputBorder = v3.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.new(1, 0, 0, 144), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1, 
                                Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                                ImageColor3 = l_Theme_0.Divider.Color, 
                                ScaleType = Enum.ScaleType.Slice, 
                                SliceCenter = Rect.new(8, 8, 9, 9)
                            }, {
                                Padding = v3.createElement("UIPadding", {
                                    PaddingLeft = UDim.new(0, 12), 
                                    PaddingRight = UDim.new(0, 12), 
                                    PaddingTop = UDim.new(0, 7)
                                }), 
                                Textbox = v3.createElement(l_CallbackInputBox_0, {
                                    inputTextXAlignment = Enum.TextXAlignment.Left, 
                                    inputTextYAlignment = Enum.TextYAlignment.Top, 
                                    inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                    inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                    inputTextSize = v25, 
                                    initialInputText = v16.initialText, 
                                    placeholderText = v21.saySomething, 
                                    placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                    captureFocusOnMount = true, 
                                    textChangedCallback = v28, 
                                    inputBoxRef = v17, 
                                    multiLine = true, 
                                    textWrapped = true, 
                                    clearButtonDisabled = true, 
                                    clearButtonSize = 0
                                })
                            })
                        }), 
                        Counter = v3.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 22), 
                            LayoutOrder = 4
                        }, {
                            ThrottleError = if v11 and v16.throttleError then v3.createElement("TextLabel", {
                                Position = UDim2.fromScale(0, 0.4), 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                BackgroundTransparency = 1, 
                                Font = l_Font_0.CaptionBody.Font, 
                                Text = v16.throttleErrorText, 
                                TextXAlignment = 0, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize * 0.9, 
                                TextColor3 = l_Theme_0.Alert.Color, 
                                TextTransparency = l_Theme_0.Alert.Transparency
                            }) else nil; 
                            v3.createElement("TextLabel", {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                BackgroundTransparency = 1, 
                                Font = l_Font_0.CaptionBody.Font, 
                                Text = if v16.textError then v21.pinLocked else string.format("%d/%d", v20, 1000), 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                                TextColor3 = if not (v20 ~= 1000) or v16.textError then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                                TextTransparency = if not (v20 ~= 1000) or v16.textError then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                                AnchorPoint = if v16.textError then Vector2.new(0, 1) else Vector2.new(1, 1), 
                                Position = if v16.textError then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
                                TextWrapped = true
                            }, {
                                UISizeConstraint = v3.createElement("UISizeConstraint", {
                                    MaxSize = Vector2.new(1e999, l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize * 2)
                                })
                            })
                        })
                    })
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v16.cancelOnActivated, 
                            text = v21.cancelButtonText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v29, 
                            text = v21.saveButtonText
                        }
                    }
                }, 
                buttonHeight = 48, 
                marginBetween = 6, 
                forcedFillDirection = Enum.FillDirection.Horizontal
            }
        });
    end;
end;