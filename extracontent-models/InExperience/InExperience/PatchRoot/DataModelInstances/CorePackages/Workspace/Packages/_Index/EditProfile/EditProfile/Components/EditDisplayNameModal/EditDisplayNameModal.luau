local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_CallbackInputBox_0 = v3.SocialLibraries.config({}).Components.CallbackInputBox;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_script_FirstAncestor_0.Common.Constants);
local v15 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v16 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v16.clearTimeout;
local l_setTimeout_0 = v16.setTimeout;
local v19 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v20 = require(l_script_FirstAncestor_0.Flags.InternationalNamesIXP);
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
local v22 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v22.EventNames;
local l_useAnalytics_0 = v22.useAnalytics;
local v25 = game:DefineFastFlag("NameNotAvailableErrorEnabled", false);
local v26 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
local v27 = require(l_script_FirstAncestor_0.Utils.FocusNavigatorWrapper);
local v28 = game:DefineFastInt("EditProfileModalNetworkDelay", 500);
return function(v29) --[[ Line: 61 ]]
    -- upvalues: v4 (copy), v26 (copy), l_useLocalization_0 (copy), v15 (copy), v19 (copy), l_useAnalytics_0 (copy), l_useStyle_0 (copy), l_setTimeout_0 (copy), v28 (copy), v14 (copy), v25 (copy), v20 (copy), l_clearTimeout_0 (copy), l_EventNames_0 (copy), l_HttpService_0 (copy), v21 (copy), v27 (copy), l_InteractiveAlert_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_CallbackInputBox_0 (copy), l_IconSize_0 (copy), l_ButtonType_0 (copy)
    local v30 = v4.useRef(nil);
    local v31 = v26();
    local v32, v33 = v4.useState(v29.initialText);
    local v34 = utf8.len(v32) or 0;
    local v35 = l_useLocalization_0({
        cancelButtonText = v15.CancelButtonText, 
        saveButtonText = v15.SaveButtonText
    });
    local v36 = if v19.useIsExperimentEnabled() then l_useAnalytics_0() else nil;
    local v37 = l_useStyle_0();
    local l_Font_0 = v37.Font;
    local l_Theme_0 = v37.Theme;
    local v40 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v41, v42 = v4.useState(true);
    local v43, v44 = v4.useState(false);
    local v45, v46 = v4.useState(v31.displayNameChangeError);
    local v47 = v4.useRef(l_setTimeout_0(function() --[[ Line: 85 ]]

    end, v28));
    local v48 = v4.useRef(false);
    local function v50(v49) --[[ Line: 88 ]] --[[ Name: getErrorMessage ]]
        -- upvalues: v14 (ref), v31 (copy), v25 (ref)
        return ({
            [v14.DisplayNameValidationErrorCodes.TooShort] = v31.nameTooShortError, 
            [v14.DisplayNameValidationErrorCodes.TooLong] = v31.nameTooLongError, 
            [v14.DisplayNameValidationErrorCodes.InvalidCharacters] = v31.nameUnsupportedCharsError, 
            [v14.DisplayNameValidationErrorCodes.Moderated] = v31.nameInappropriateError, 
            [v14.DisplayNameValidationErrorCodes.Throttled] = v31.nameHasChangedError, 
            [v14.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination] = v31.displayNameChangeMixedCharactersError, 
            [v14.DisplayNameValidationErrorCodes.NameNotAvailable] = if v25 then v31.nameNotAvailableError else nil
        })[v49] or v31.displayNameChangeError;
    end;
    local function v59(v51) --[[ Line: 103 ]] --[[ Name: textChanged ]]
        -- upvalues: v20 (ref), v29 (copy), v48 (copy), l_clearTimeout_0 (ref), v47 (copy), v42 (copy), v36 (copy), l_EventNames_0 (ref), v46 (copy), v31 (copy), v44 (copy), v33 (copy), v34 (copy), v32 (copy), v30 (copy), l_setTimeout_0 (ref), l_HttpService_0 (ref), v50 (copy), v28 (ref)
        if v20.FFlagIsSetupEnabled() and v51 ~= v29.initialText and not v48.current then
            v48.current = true;
            v20.logExposure();
        end;
        l_clearTimeout_0(v47.current);
        v42(false);
        local v52 = utf8.len(v51);
        if v52 == nil then
            return;
        elseif v52 < 3 then
            if v36 then
                v36.fireAnalyticsEvent(l_EventNames_0.DisplayNameTooShort, {
                    displayName = v51
                });
            end;
            v46(v31.displayNameTooShortError);
            v44(true);
            v33(v51);
            return;
        elseif v52 > 20 then
            v51 = if v34 == 20 then v32 else string.sub(v51, 1, utf8.offset(v51, 21) - 1);
            v52 = 20;
            if v30 and v30.current then
                v30.current.Text = v51;
            end;
            v33(v51);
            return;
        else
            v33(v51);
            v47.current = l_setTimeout_0(function() --[[ Line: 153 ]]
                -- upvalues: v29 (ref), l_HttpService_0 (ref), v51 (ref), v44 (ref), v42 (ref), v20 (ref), v50 (ref), v36 (ref), l_EventNames_0 (ref), v46 (ref), v31 (ref)
                v29.validateDisplayName(l_HttpService_0:UrlEncode(v51)):andThen(function(_) --[[ Line: 156 ]]
                    -- upvalues: v44 (ref), v42 (ref)
                    v44(false);
                    v42(true);
                end):catch(function(v54) --[[ Line: 160 ]]
                    -- upvalues: v20 (ref), l_HttpService_0 (ref), v50 (ref), v36 (ref), l_EventNames_0 (ref), v51 (ref), v46 (ref), v31 (ref), v44 (ref)
                    local v55 = nil;
                    if v20.FFlagIsSetupEnabled() then
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 163 ]]
                            -- upvalues: l_HttpService_0 (ref), v54 (copy)
                            return l_HttpService_0:JSONDecode(v54.Body);
                        end);
                        local v58 = -1;
                        if l_status_0 then
                            v58 = l_result_0 and l_result_0.errors and l_result_0.errors[1] and l_result_0.errors[1].code or -1;
                        end;
                        v55 = v50(v58);
                    end;
                    if v36 then
                        v36.fireAnalyticsEvent(l_EventNames_0.FilteredDisplayName, {
                            displayName = v51
                        });
                    end;
                    v46(if v20.FFlagIsSetupEnabled() then v55 else v31.displayNameChangeError);
                    v44(true);
                end);
            end, v28);
            return;
        end;
    end;
    local function v60() --[[ Line: 188 ]] --[[ Name: onSave ]]
        -- upvalues: v32 (copy), v29 (copy)
        if v32 == v29.initialText then
            v29.cancelOnActivated();
            return;
        else
            v29.saveOnActivated(v32);
            return;
        end;
    end;
    if v21 then
        return v27({
            onClose = v29.cancelOnActivated
        }, {
            v4.createElement(l_InteractiveAlert_0, {
                title = v29.title, 
                screenSize = v29.screenSize, 
                anchorPoint = Vector2.new(0.5, 0), 
                position = UDim2.new(0.5, 0, 0, 117), 
                middleContent = function() --[[ Line: 205 ]] --[[ Name: middleContent ]]
                    -- upvalues: v4 (ref), l_Font_0 (copy), v29 (copy), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), v40 (copy), l_Images_0 (ref), v43 (copy), l_CallbackInputBox_0 (ref), l_IconSize_0 (ref), v59 (copy), v30 (copy), v45 (copy), v34 (copy)
                    return v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, {
                        InputGroup = v4.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.fromScale(1, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 1
                        }, {
                            UIListLayout = v4.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Description = v4.createElement("TextLabel", {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                TextWrapped = true, 
                                Font = l_Font_0.Body.Font, 
                                Text = v29.description, 
                                TextSize = 14, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                RichText = true
                            }), 
                            Padding = v4.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, 0, 0, 24), 
                                LayoutOrder = 2
                            }), 
                            InputBackground = v4.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.new(1, 0, 0, v40 + 20), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 3, 
                                Image = l_Images_0["component_assets/circle_21"], 
                                ImageColor3 = l_Theme_0.UIMuted.Color, 
                                ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                                ScaleType = Enum.ScaleType.Slice, 
                                SliceCenter = Rect.new(8, 8, 9, 9)
                            }, {
                                InputBorder = v4.createElement(l_ImageSetLabel_0, {
                                    Size = UDim2.new(1, 0, 0, v40 + 20), 
                                    BackgroundTransparency = 1, 
                                    LayoutOrder = 1, 
                                    Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                                    ImageColor3 = if v43 then l_Theme_0.Alert.Color else l_Theme_0.Divider.Color, 
                                    ScaleType = Enum.ScaleType.Slice, 
                                    SliceCenter = Rect.new(8, 8, 9, 9)
                                }, {
                                    Padding = v4.createElement("UIPadding", {
                                        PaddingLeft = UDim.new(0, 12), 
                                        PaddingRight = UDim.new(0, 12)
                                    }), 
                                    Textbox = v4.createElement(l_CallbackInputBox_0, {
                                        inputTextXAlignment = Enum.TextXAlignment.Left, 
                                        inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                        inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                        inputTextSize = v40, 
                                        initialInputText = v29.initialText, 
                                        placeholderText = v29.initialText, 
                                        placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                        captureFocusOnMount = true, 
                                        clearIcon = l_Images_0["icons/actions/edit/clear_small"], 
                                        clearIconColor3 = l_Theme_0.IconEmphasis.Color, 
                                        clearIconTransparency = l_Theme_0.IconEmphasis.Transparency, 
                                        clearButtonSize = l_IconSize_0.Small, 
                                        clearButtonDisabled = false, 
                                        textChangedCallback = v59, 
                                        inputBoxRef = v30
                                    })
                                })
                            }), 
                            AdditonalPadding = v4.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, 0, 0, 8), 
                                LayoutOrder = 4
                            }), 
                            Counter = v4.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.fromScale(1, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                LayoutOrder = 5
                            }, {
                                v4.createElement("TextLabel", {
                                    BackgroundTransparency = 1, 
                                    Font = l_Font_0.CaptionBody.Font, 
                                    Text = if v43 then v45 else string.format("%d/%d", v34, 20), 
                                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                                    TextColor3 = if not (v34 ~= 20) or v43 then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                                    TextTransparency = if not (v34 ~= 20) or v43 then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                                    AnchorPoint = if v43 then nil else Vector2.new(1, 0), 
                                    Position = if v43 then nil else UDim2.fromScale(1, 0), 
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    TextWrapped = true, 
                                    TextXAlignment = Enum.TextXAlignment.Left
                                }, {
                                    UISizeConstraint = v4.createElement("UISizeConstraint", {
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
                                onActivated = v29.cancelOnActivated, 
                                text = v35.cancelButtonText
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v60, 
                                text = v35.saveButtonText, 
                                isDisabled = not v41
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
        return v4.createElement(l_InteractiveAlert_0, {
            title = v29.title, 
            screenSize = v29.screenSize, 
            anchorPoint = Vector2.new(0.5, 0), 
            position = UDim2.new(0.5, 0, 0, 117), 
            middleContent = function() --[[ Line: 358 ]] --[[ Name: middleContent ]]
                -- upvalues: v4 (ref), l_Font_0 (copy), v29 (copy), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), v40 (copy), l_Images_0 (ref), v43 (copy), l_CallbackInputBox_0 (ref), l_IconSize_0 (ref), v59 (copy), v30 (copy), v45 (copy), v34 (copy)
                return v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    InputGroup = v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 1
                    }, {
                        UIListLayout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Description = v4.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            TextWrapped = true, 
                            Font = l_Font_0.Body.Font, 
                            Text = v29.description, 
                            TextSize = 14, 
                            TextColor3 = l_Theme_0.TextDefault.Color, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            RichText = true
                        }), 
                        Padding = v4.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 24), 
                            LayoutOrder = 2
                        }), 
                        InputBackground = v4.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 0, v40 + 20), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3, 
                            Image = l_Images_0["component_assets/circle_21"], 
                            ImageColor3 = l_Theme_0.UIMuted.Color, 
                            ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(8, 8, 9, 9)
                        }, {
                            InputBorder = v4.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.new(1, 0, 0, v40 + 20), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1, 
                                Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                                ImageColor3 = if v43 then l_Theme_0.Alert.Color else l_Theme_0.Divider.Color, 
                                ScaleType = Enum.ScaleType.Slice, 
                                SliceCenter = Rect.new(8, 8, 9, 9)
                            }, {
                                Padding = v4.createElement("UIPadding", {
                                    PaddingLeft = UDim.new(0, 12), 
                                    PaddingRight = UDim.new(0, 12)
                                }), 
                                Textbox = v4.createElement(l_CallbackInputBox_0, {
                                    inputTextXAlignment = Enum.TextXAlignment.Left, 
                                    inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                    inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                    inputTextSize = v40, 
                                    initialInputText = v29.initialText, 
                                    placeholderText = v29.initialText, 
                                    placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                    captureFocusOnMount = true, 
                                    clearIcon = l_Images_0["icons/actions/edit/clear_small"], 
                                    clearIconColor3 = l_Theme_0.IconEmphasis.Color, 
                                    clearIconTransparency = l_Theme_0.IconEmphasis.Transparency, 
                                    clearButtonSize = l_IconSize_0.Small, 
                                    clearButtonDisabled = false, 
                                    textChangedCallback = v59, 
                                    inputBoxRef = v30
                                })
                            })
                        }), 
                        AdditonalPadding = v4.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 8), 
                            LayoutOrder = 4
                        }), 
                        Counter = v4.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.fromScale(1, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 5
                        }, {
                            v4.createElement("TextLabel", {
                                BackgroundTransparency = 1, 
                                Font = l_Font_0.CaptionBody.Font, 
                                Text = if v43 then v45 else string.format("%d/%d", v34, 20), 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                                TextColor3 = if not (v34 ~= 20) or v43 then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                                TextTransparency = if not (v34 ~= 20) or v43 then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                                AnchorPoint = if v43 then nil else Vector2.new(1, 0), 
                                Position = if v43 then nil else UDim2.fromScale(1, 0), 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                TextWrapped = true, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            }, {
                                UISizeConstraint = v4.createElement("UISizeConstraint", {
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
                            onActivated = v29.cancelOnActivated, 
                            text = v35.cancelButtonText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v60, 
                            text = v35.saveButtonText, 
                            isDisabled = not v41
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