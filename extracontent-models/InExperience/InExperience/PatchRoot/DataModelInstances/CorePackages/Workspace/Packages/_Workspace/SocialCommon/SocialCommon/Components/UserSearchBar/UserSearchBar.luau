local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local l_CallbackInputBox_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.CallbackInputBox;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactAppExperiment);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v5 = require(l_Parent_0.Dash);
local v6 = require(l_Parent_0.UIBlox);
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_TextButton_0 = v6.App.Button.TextButton;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v12 = require(l_Parent_0.Foundation);
local l_Icon_0 = v12.Icon;
local l_Enums_0 = v12.Enums;
local v15 = l_Images_0["icons/actions/edit/clear_small"];
local l_FFlagDisableAutocorrectSocialUserSearch_0 = require(l_Parent_0.SharedFlags).FFlagDisableAutocorrectSocialUserSearch;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
local v18 = game:DefineFastString("DisableAutocorrectExperimentLayer", "Social.UserSearchUX");
local v19 = {
    cancelText = "Cancel", 
    searchPlaceholderText = "Text", 
    initialInputText = nil, 
    LayoutOrder = 1, 
    isDisabled = false, 
    captureFocusOnMount = false, 
    cancelCallback = nil, 
    textChangedCallback = nil, 
    focusChangedCallback = function() --[[ Line: 72 ]] --[[ Name: focusChangedCallback ]]

    end
};
return function(v20) --[[ Line: 75 ]]
    -- upvalues: l_FFlagDisableAutocorrectSocialUserSearch_0 (copy), v3 (copy), v18 (copy), v5 (copy), v19 (copy), l_useStyle_0 (copy), v2 (copy), l_Text_0 (copy), l_TextButton_0 (copy), l_ImageSetLabel_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_CallbackInputBox_0 (copy), v15 (copy), l_IconSize_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy)
    local v22 = if l_FFlagDisableAutocorrectSocialUserSearch_0 then v3.useUserExperiment({
        v18
    }, function(v21) --[[ Line: 77 ]]
        -- upvalues: v18 (ref)
        return (v21[v18] or {}).disableAutocorrectSocialUserSearch;
    end) else nil;
    local v23 = v5.join(v19, v20 or {});
    local v24 = l_useStyle_0();
    local v25 = v2.useRef(nil);
    local v26, v27 = v2.useState(nil);
    local v28, v29 = v2.useState(nil);
    v2.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v23 (copy)
        if v23.onSelectCallback then
            v23.onSelectCallback();
        end;
        if v23.resetOnMount then
            v23.resetOnMount();
        end;
    end, {});
    local l_Header2_0 = v24.Font.Header2;
    local v31 = v24.Font.BaseSize * l_Header2_0.RelativeSize;
    local v32 = l_Text_0.GetTextWidth(v23.cancelText, l_Header2_0.Font, v31);
    local v33 = UDim.new(0, 4);
    local v34 = if v23.isDisabled then UDim2.new(1, 0, 1, 0) else UDim2.new(1, -v32 - 12, 1, 0);
    local l_Body_0 = v24.Font.Body;
    local v36 = v24.Font.BaseSize * l_Body_0.RelativeSize;
    local function v39(v37, v38) --[[ Line: 114 ]]
        -- upvalues: v23 (copy), v27 (copy), v24 (copy), v29 (copy)
        if v23.focusChangedCallback then
            v23.focusChangedCallback(v37, v38);
        end;
        if v37 then
            v27(v24.Theme.SecondaryOnHover.Color);
            v29(v24.Theme.SecondaryOnHover.Transparency);
            return;
        else
            v27(v24.Theme.Divider.Color);
            v29(v24.Theme.Divider.Transparency);
            return;
        end;
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = v24.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v24.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        LayoutOrder = v23.LayoutOrder
    }, {
        Layout = v2.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v33
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 6), 
            PaddingBottom = UDim.new(0, 6)
        }), 
        CancelTextButton = if v23.isDisabled then nil else v23.cancelCallback and v2.createElement(l_TextButton_0, {
            text = v23.cancelText, 
            layoutOrder = 2, 
            onActivated = v23.cancelCallback
        }), 
        FilterBoxBackground = v2.createElement(l_ImageSetLabel_0, {
            Size = v34, 
            BackgroundColor3 = v24.Theme.UIMuted.Color, 
            BackgroundTransparency = v24.Theme.UIMuted.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), 
            UIStroke = v2.createElement("UIStroke", {
                Color = v26 or v24.Theme.Divider.Color, 
                Transparency = v28 or v24.Theme.Divider.Transparency, 
                Thickness = 1
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10)
            }), 
            SearchIcon = v2.createElement(l_Icon_0, {
                name = l_Enums_0.IconName.MagnifyingGlass, 
                size = l_Enums_0.IconSize.Medium
            }), 
            FilterBoxContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -28, 1, 0), 
                LayoutOrder = 2
            }, {
                filterBox = if v23.isDisabled then v2.createElement("TextLabel", {
                    Text = v23.searchPlaceholderText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    TextSize = v36, 
                    Font = l_Body_0.Font, 
                    TextColor3 = v24.Theme.TextDefault.Color, 
                    TextTransparency = v24.Theme.TextMuted.Transparency
                }) else v2.createElement(l_CallbackInputBox_0, {
                    initialInputText = v23.initialInputText, 
                    inputTextColor3 = v24.Theme.TextEmphasis.Color, 
                    inputTextFont = l_Body_0.Font, 
                    inputTextSize = v36, 
                    inputTextTransparency = v24.Theme.TextEmphasis.Transparency, 
                    inputTextXAlignment = Enum.TextXAlignment.Left, 
                    textInputType = if l_FFlagDisableAutocorrectSocialUserSearch_0 and v22 then Enum.TextInputType.NoSuggestions else nil, 
                    returnKeyType = if l_FFlagDisableAutocorrectSocialUserSearch_0 and v22 then Enum.ReturnKeyType.Search else nil, 
                    placeholderText = v23.searchPlaceholderText, 
                    placeholderTextColor3 = v24.Theme.TextDefault.Color, 
                    placeholderTextTransparency = v24.Theme.TextMuted.Transparency, 
                    captureFocusOnMount = v23.captureFocusOnMount, 
                    clearButtonDisabled = false, 
                    clearIcon = v15, 
                    clearIconColor3 = v24.Theme.IconEmphasis.Color, 
                    clearIconTransparency = v24.Theme.IconEmphasis.Transparency, 
                    clearButtonSize = l_IconSize_0.Small, 
                    textChangedCallback = v23.textChangedCallback, 
                    onSelectCallback = v23.onSelectCallback, 
                    focusChangedCallback = v39, 
                    returnPressedFromOnScreenKeyboardCallback = if l_FFlagEnableLeftNavOnConsole_0 then v23.returnPressedFromOnScreenKeyboardCallback else if l_FFlagDisableAutocorrectSocialUserSearch_0 and v22 then v23.returnPressedFromOnScreenKeyboardCallback else nil, 
                    inputBoxRef = v25
                })
            })
        })
    });
end;