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
local v15 = l_Images_0["icons/common/search"];
local v16 = l_Images_0["icons/actions/edit/clear_small"];
local l_FFlagDisableAutocorrectSocialUserSearch_0 = require(l_Parent_0.SharedFlags).FFlagDisableAutocorrectSocialUserSearch;
local v18 = game:DefineFastFlag("FixPeopleSearchIconSize", false);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
local v20 = game:DefineFastString("DisableAutocorrectExperimentLayer", "Social.UserSearchUX");
local v21 = {
    cancelText = "Cancel", 
    searchPlaceholderText = "Text", 
    initialInputText = nil, 
    LayoutOrder = 1, 
    isDisabled = false, 
    captureFocusOnMount = false, 
    cancelCallback = nil, 
    textChangedCallback = nil, 
    focusChangedCallback = function() --[[ Line: 74 ]] --[[ Name: focusChangedCallback ]]

    end
};
return function(v22) --[[ Line: 77 ]]
    -- upvalues: l_FFlagDisableAutocorrectSocialUserSearch_0 (copy), v3 (copy), v20 (copy), v5 (copy), v21 (copy), l_useStyle_0 (copy), v2 (copy), l_Text_0 (copy), l_TextButton_0 (copy), l_ImageSetLabel_0 (copy), v18 (copy), l_Icon_0 (copy), l_Enums_0 (copy), v15 (copy), l_CallbackInputBox_0 (copy), v16 (copy), l_IconSize_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy)
    local v24 = if l_FFlagDisableAutocorrectSocialUserSearch_0 then v3.useUserExperiment({
        v20
    }, function(v23) --[[ Line: 79 ]]
        -- upvalues: v20 (ref)
        return (v23[v20] or {}).disableAutocorrectSocialUserSearch;
    end) else nil;
    local v25 = v5.join(v21, v22 or {});
    local v26 = l_useStyle_0();
    local v27 = v2.useRef(nil);
    local v28, v29 = v2.useState(nil);
    local v30, v31 = v2.useState(nil);
    v2.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v25 (copy)
        if v25.onSelectCallback then
            v25.onSelectCallback();
        end;
        if v25.resetOnMount then
            v25.resetOnMount();
        end;
    end, {});
    local l_Header2_0 = v26.Font.Header2;
    local v33 = v26.Font.BaseSize * l_Header2_0.RelativeSize;
    local v34 = l_Text_0.GetTextWidth(v25.cancelText, l_Header2_0.Font, v33);
    local v35 = UDim.new(0, 4);
    local v36 = if v25.isDisabled then UDim2.new(1, 0, 1, 0) else UDim2.new(1, -v34 - 12, 1, 0);
    local l_Body_0 = v26.Font.Body;
    local v38 = v26.Font.BaseSize * l_Body_0.RelativeSize;
    local function v41(v39, v40) --[[ Line: 116 ]]
        -- upvalues: v25 (copy), v29 (copy), v26 (copy), v31 (copy)
        if v25.focusChangedCallback then
            v25.focusChangedCallback(v39, v40);
        end;
        if v39 then
            v29(v26.Theme.SecondaryOnHover.Color);
            v31(v26.Theme.SecondaryOnHover.Transparency);
            return;
        else
            v29(v26.Theme.Divider.Color);
            v31(v26.Theme.Divider.Transparency);
            return;
        end;
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = v26.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v26.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        LayoutOrder = v25.LayoutOrder
    }, {
        Layout = v2.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v35
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 6), 
            PaddingBottom = UDim.new(0, 6)
        }), 
        CancelTextButton = if v25.isDisabled then nil else v25.cancelCallback and v2.createElement(l_TextButton_0, {
            text = v25.cancelText, 
            layoutOrder = 2, 
            onActivated = v25.cancelCallback
        }), 
        FilterBoxBackground = v2.createElement(l_ImageSetLabel_0, {
            Size = v36, 
            BackgroundColor3 = v26.Theme.UIMuted.Color, 
            BackgroundTransparency = v26.Theme.UIMuted.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), 
            UIStroke = v2.createElement("UIStroke", {
                Color = v28 or v26.Theme.Divider.Color, 
                Transparency = v30 or v26.Theme.Divider.Transparency, 
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
            SearchIcon = if v18 then v2.createElement(l_Icon_0, {
                name = l_Enums_0.IconName.MagnifyingGlass, 
                size = l_Enums_0.IconSize.Medium
            }) else v2.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 24, 0, 24), 
                Image = v15, 
                ImageColor3 = v26.Theme.IconEmphasis.Color, 
                ImageTransparency = v26.Theme.IconEmphasis.Transparency, 
                LayoutOrder = 1
            }), 
            FilterBoxContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -28, 1, 0), 
                LayoutOrder = 2
            }, {
                filterBox = if v25.isDisabled then v2.createElement("TextLabel", {
                    Text = v25.searchPlaceholderText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    TextSize = v38, 
                    Font = l_Body_0.Font, 
                    TextColor3 = v26.Theme.TextDefault.Color, 
                    TextTransparency = v26.Theme.TextMuted.Transparency
                }) else v2.createElement(l_CallbackInputBox_0, {
                    initialInputText = v25.initialInputText, 
                    inputTextColor3 = v26.Theme.TextEmphasis.Color, 
                    inputTextFont = l_Body_0.Font, 
                    inputTextSize = v38, 
                    inputTextTransparency = v26.Theme.TextEmphasis.Transparency, 
                    inputTextXAlignment = Enum.TextXAlignment.Left, 
                    textInputType = if l_FFlagDisableAutocorrectSocialUserSearch_0 and v24 then Enum.TextInputType.NoSuggestions else nil, 
                    returnKeyType = if l_FFlagDisableAutocorrectSocialUserSearch_0 and v24 then Enum.ReturnKeyType.Search else nil, 
                    placeholderText = v25.searchPlaceholderText, 
                    placeholderTextColor3 = v26.Theme.TextDefault.Color, 
                    placeholderTextTransparency = v26.Theme.TextMuted.Transparency, 
                    captureFocusOnMount = v25.captureFocusOnMount, 
                    clearButtonDisabled = false, 
                    clearIcon = v16, 
                    clearIconColor3 = v26.Theme.IconEmphasis.Color, 
                    clearIconTransparency = v26.Theme.IconEmphasis.Transparency, 
                    clearButtonSize = l_IconSize_0.Small, 
                    textChangedCallback = v25.textChangedCallback, 
                    onSelectCallback = v25.onSelectCallback, 
                    focusChangedCallback = v41, 
                    returnPressedFromOnScreenKeyboardCallback = if l_FFlagEnableLeftNavOnConsole_0 then v25.returnPressedFromOnScreenKeyboardCallback else if l_FFlagDisableAutocorrectSocialUserSearch_0 and v24 then v25.returnPressedFromOnScreenKeyboardCallback else nil, 
                    inputBoxRef = v27
                })
            })
        })
    });
end;