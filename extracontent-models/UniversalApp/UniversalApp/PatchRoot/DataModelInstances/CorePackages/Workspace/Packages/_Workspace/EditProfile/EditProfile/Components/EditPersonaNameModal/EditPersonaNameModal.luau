local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_CallbackInputBox_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.CallbackInputBox;
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
local v6 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v6.App.ImageSet.Images;
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v13 = require(l_Parent_0.Foundation);
local l_View_0 = v13.View;
local l_Text_0 = v13.Text;
local v16 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v16.clearTimeout;
local l_setTimeout_0 = v16.setTimeout;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v20 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v21 = game:DefineFastInt("PersonaModalNetworkDelay", 500);
return function(v22) --[[ Line: 49 ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_useLocalization_0 (copy), v20 (copy), l_setTimeout_0 (copy), v21 (copy), v5 (copy), l_HttpService_0 (copy), l_clearTimeout_0 (copy), l_InteractiveAlert_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_CallbackInputBox_0 (copy), l_IconSize_0 (copy), l_ButtonType_0 (copy)
    local v23 = l_useStyle_0();
    local l_Font_0 = v23.Font;
    local l_Theme_0 = v23.Theme;
    local v26 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v27 = v2.useRef(nil);
    local v28 = l_useLocalization_0({
        cancelButtonText = v20.CancelButtonText, 
        saveButtonText = v20.SaveButtonText, 
        nameErrorGeneric = v20.PersonaNameGenericError, 
        nameTooShortError = v20.PersonaNameTooShort, 
        nameTooLongError = v20.PersonaNameTooLong, 
        nameInvalidCharactersError = v20.PersonaNameInvalidCharacters, 
        nameModerationError = v20.PersonaNameModerated, 
        nameMixedError = v20.PersonaNameMixedCharacters, 
        namePlaceholder = v20.PersonaNamePlaceholder
    });
    local v29, v30 = v2.useState(false);
    local v31, v32 = v2.useState(v28.nameErrorGeneric);
    local v33, v34 = v2.useState(true);
    local v35, v36 = v2.useState(v22.initialText);
    local v37 = v2.useMemo(function() --[[ Line: 72 ]]
        -- upvalues: v35 (copy)
        return utf8.len(v35) or 0;
    end);
    local v38 = v2.useRef(l_setTimeout_0(function() --[[ Line: 76 ]]

    end, v21));
    local function v40(v39) --[[ Line: 78 ]] --[[ Name: getErrorMessage ]]
        -- upvalues: v5 (ref), v28 (copy)
        return ({
            [v5.DisplayNameValidationErrorCodes.TooShort] = v28.nameTooShortError, 
            [v5.DisplayNameValidationErrorCodes.TooLong] = v28.nameTooLongError, 
            [v5.DisplayNameValidationErrorCodes.InvalidCharacters] = v28.nameInvalidCharactersError, 
            [v5.DisplayNameValidationErrorCodes.Moderated] = v28.nameModerationError, 
            [v5.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination] = v28.nameMixedError
        })[v39] or v28.nameErrorGeneric;
    end;
    local _ = function(v41) --[[ Line: 90 ]] --[[ Name: validatePersonaName ]]
        -- upvalues: v38 (copy), l_setTimeout_0 (ref), v22 (copy), l_HttpService_0 (ref), v30 (copy), v34 (copy), v31 (ref), v40 (copy), v32 (copy), v21 (ref)
        v38.current = l_setTimeout_0(function() --[[ Line: 91 ]]
            -- upvalues: v22 (ref), l_HttpService_0 (ref), v41 (copy), v30 (ref), v34 (ref), v31 (ref), v40 (ref), v32 (ref)
            v22.validatePersonaName(l_HttpService_0:UrlEncode(v41)):andThen(function(_) --[[ Line: 94 ]]
                -- upvalues: v30 (ref), v34 (ref)
                v30(false);
                v34(true);
            end):catch(function(v43) --[[ Line: 98 ]]
                -- upvalues: l_HttpService_0 (ref), v31 (ref), v40 (ref), v32 (ref), v30 (ref)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 99 ]]
                    -- upvalues: l_HttpService_0 (ref), v43 (copy)
                    return l_HttpService_0:JSONDecode(v43.Body);
                end);
                local v46 = -1;
                if l_status_0 then
                    v46 = l_result_0 and l_result_0.errors and l_result_0.errors[1] and l_result_0.errors[1].code or -1;
                end;
                v31 = v40(v46);
                v32(v31);
                v30(true);
            end);
        end, v21);
    end;
    local function v56(v48) --[[ Line: 114 ]] --[[ Name: onPersonaNameChanged ]]
        -- upvalues: l_clearTimeout_0 (ref), v38 (copy), v34 (copy), v32 (copy), v28 (copy), v30 (copy), v36 (copy), v37 (copy), v35 (copy), v27 (copy), l_setTimeout_0 (ref), v22 (copy), l_HttpService_0 (ref), v31 (ref), v40 (copy), v21 (ref)
        l_clearTimeout_0(v38.current);
        v34(false);
        local v49 = utf8.len(v48);
        if v49 == nil then
            return;
        elseif v49 < 3 then
            v32(v28.nameTooShortError);
            v30(true);
            v36(v48);
            return;
        elseif v49 > 20 then
            v48 = if v37 == 20 then v35 else string.sub(v48, 1, utf8.offset(v48, 21) - 1);
            v49 = 20;
            if v27 and v27.current then
                v27.current.Text = v48;
            end;
            if v35 ~= v48 then
                v36(v48);
            end;
            return;
        else
            v36(v48);
            local l_v48_0 = v48;
            v38.current = l_setTimeout_0(function() --[[ Line: 91 ]]
                -- upvalues: v22 (ref), l_HttpService_0 (ref), l_v48_0 (copy), v30 (ref), v34 (ref), v31 (ref), v40 (ref), v32 (ref)
                v22.validatePersonaName(l_HttpService_0:UrlEncode(l_v48_0)):andThen(function(_) --[[ Line: 94 ]]
                    -- upvalues: v30 (ref), v34 (ref)
                    v30(false);
                    v34(true);
                end):catch(function(v52) --[[ Line: 98 ]]
                    -- upvalues: l_HttpService_0 (ref), v31 (ref), v40 (ref), v32 (ref), v30 (ref)
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 99 ]]
                        -- upvalues: l_HttpService_0 (ref), v52 (copy)
                        return l_HttpService_0:JSONDecode(v52.Body);
                    end);
                    local v55 = -1;
                    if l_status_1 then
                        v55 = l_result_1 and l_result_1.errors and l_result_1.errors[1] and l_result_1.errors[1].code or -1;
                    end;
                    v31 = v40(v55);
                    v32(v31);
                    v30(true);
                end);
            end, v21);
            return;
        end;
    end;
    v2.useEffect(function() --[[ Line: 158 ]]
        -- upvalues: v56 (copy), v22 (copy)
        v56(v22.initialText);
    end, {});
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v22.screenSize, 
        title = v22.title, 
        middleContent = function() --[[ Line: 178 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), l_View_0 (ref), l_Text_0 (ref), v22 (copy), l_ImageSetLabel_0 (ref), v26 (copy), l_Images_0 (ref), l_Theme_0 (copy), v29 (copy), l_CallbackInputBox_0 (ref), v28 (copy), l_IconSize_0 (ref), v56 (copy), v27 (copy), l_Font_0 (copy), v31 (ref), v37 (copy)
            return v2.createElement(l_View_0, {
                BackgroundTransparency = 1, 
                tag = "size-full-0 auto-xy"
            }, {
                InputGroup = v2.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col align-x-center"
                }, {
                    Description = v2.createElement(l_Text_0, {
                        Text = v22.description, 
                        tag = "text-label-small text-align-x-center text-align-y-top auto-xy text-wrap", 
                        LayoutOrder = 1
                    }), 
                    Padding = v2.createElement(l_View_0, {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 24), 
                        LayoutOrder = 2
                    }), 
                    InputBackground = v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 0, v26 + 20), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        Image = l_Images_0["component_assets/circle_21"], 
                        ImageColor3 = l_Theme_0.UIMuted.Color, 
                        ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9)
                    }, {
                        InputBorder = v2.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 0, v26 + 20), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                            ImageColor3 = if v29 then l_Theme_0.Alert.Color else l_Theme_0.Divider.Color, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(8, 8, 9, 9)
                        }, {
                            Padding = v2.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 12), 
                                PaddingRight = UDim.new(0, 12)
                            }), 
                            Textbox = v2.createElement(l_CallbackInputBox_0, {
                                inputTextXAlignment = Enum.TextXAlignment.Left, 
                                inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                inputTextSize = v26, 
                                initialInputText = v22.initialText, 
                                placeholderText = v28.namePlaceholder, 
                                placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                captureFocusOnMount = true, 
                                clearIcon = l_Images_0["icons/actions/edit/clear_small"], 
                                clearIconColor3 = l_Theme_0.IconEmphasis.Color, 
                                clearIconTransparency = l_Theme_0.IconEmphasis.Transparency, 
                                clearButtonSize = l_IconSize_0.Small, 
                                clearButtonDisabled = false, 
                                textChangedCallback = v56, 
                                inputBoxRef = v27
                            })
                        })
                    }), 
                    AdditonalPadding = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 8), 
                        LayoutOrder = 4
                    }), 
                    Counter = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 5
                    }, {
                        v2.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = l_Font_0.CaptionBody.Font, 
                            Text = if v29 then v31 else string.format("%d/%d", v37, 20), 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                            TextColor3 = if not (v37 ~= 20) or v29 then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                            TextTransparency = if not (v37 ~= 20) or v29 then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                            AnchorPoint = if v29 then nil else Vector2.new(1, 0), 
                            Position = if v29 then nil else UDim2.fromScale(1, 0), 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }, {
                            UISizeConstraint = v2.createElement("UISizeConstraint", {
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
                        onActivated = function() --[[ Line: 170 ]] --[[ Name: onCancel ]]
                            -- upvalues: v22 (copy)
                            v22.cancelOnActivated();
                        end, 
                        text = v28.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function() --[[ Line: 162 ]] --[[ Name: onSave ]]
                            -- upvalues: v35 (copy), v22 (copy)
                            if v35 == v22.initialText then
                                v22.cancelOnActivated();
                                return;
                            else
                                v22.saveOnActivated(v35);
                                return;
                            end;
                        end, 
                        isDisabled = not v33, 
                        text = v28.saveButtonText
                    }
                }
            }, 
            buttonHeight = 48, 
            marginBetween = 6, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        }
    });
end;