local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconSize_0 = v4.App.Constant.IconSize;
local v9 = require(l_script_FirstAncestor_0.Flags.SocialNetworksInEditProfileIXP);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_CallbackInputBox_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.CallbackInputBox;
return function(v12) --[[ Line: 34 ]] --[[ Name: EditSocialNetworksItem ]]
    -- upvalues: v3 (copy), l_useStyle_0 (copy), l_useScreenSize_0 (copy), v9 (copy), l_UserInputService_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_CallbackInputBox_0 (copy), l_IconSize_0 (copy)
    local v13 = v3.useRef(nil);
    local v14 = l_useStyle_0();
    local l_Font_0 = v14.Font;
    local l_Theme_0 = v14.Theme;
    local v17 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v18 = l_useScreenSize_0();
    local v19 = v9.useGetExperimentVariant({
        isExposureEnabled = true
    });
    local v20 = if v19 then v19 == v9.Variants.VisibilityFirst and v12.isVisibilityNoOne else nil;
    local v22 = v3.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: l_UserInputService_0 (ref), v13 (copy), v12 (copy)
        if l_UserInputService_0.OnScreenKeyboardVisible then
            if v13.current and v13.current:IsFocused() then
                local v21 = l_UserInputService_0.OnScreenKeyboardPosition.Y - (v13.current.AbsolutePosition.Y + v13.current.AbsoluteSize.Y);
                if v21 < 0 then
                    v12.setKeyboardOffset(v21);
                    return;
                else
                    v12.setKeyboardOffset(0);
                    return;
                end;
            end;
        else
            v12.setKeyboardOffset(0);
        end;
    end, {
        v18, 
        v12.setKeyboardOffset
    });
    v3.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: l_UserInputService_0 (ref), v22 (copy), v12 (copy), v13 (copy)
        local v23 = {
            l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(v22), 
            l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(v22)
        };
        if v12.focusOn then
            task.spawn(function() --[[ Line: 71 ]]
                -- upvalues: v13 (ref)
                if v13 and v13.current then
                    v13.current:captureFocus();
                end;
            end);
        end;
        return function() --[[ Line: 78 ]]
            -- upvalues: v23 (copy)
            for _, v25 in v23 do
                v25:Disconnect();
            end;
        end;
    end, {
        v22
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v12.layoutOrder, 
        Interactable = not v20
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingTop = if v19 == v9.Variants.VisibilityFirst then UDim.new(0, 12) else nil, 
            PaddingBottom = if v19 == v9.Variants.VisibilityLast then UDim.new(0, 12) else nil
        }), 
        NetworkLabel = v3.createElement("TextLabel", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Font = l_Font_0.Body.Font, 
            Text = v12.networkTitle, 
            TextSize = v17, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            RichText = true
        }), 
        InputBackground = v3.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(1, 0, 0, v17 + 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            Image = l_Images_0["component_assets/circle_21"], 
            ImageColor3 = l_Theme_0.UIMuted.Color, 
            ImageTransparency = l_Theme_0.UIMuted.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9)
        }, {
            InputBorder = v3.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 0, v17 + 20), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                ImageColor3 = l_Theme_0.Divider.Color, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9)
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                TextBox = v3.createElement(l_CallbackInputBox_0, {
                    captureFocusOnMount = v12.focusOn, 
                    clearButtonDisabled = false, 
                    clearButtonSize = l_IconSize_0.Small, 
                    clearIcon = l_Images_0["icons/actions/edit/clear_small"], 
                    clearIconColor3 = l_Theme_0.IconEmphasis.Color, 
                    clearIconTransparency = if v20 then l_Theme_0.PlaceHolder.Transparency else nil, 
                    initialInputText = v12.initialText, 
                    inputBoxRef = v13, 
                    inputTextColor3 = l_Theme_0.TextDefault.Color, 
                    inputTextSize = v17, 
                    inputTextTransparency = if v20 then l_Theme_0.PlaceHolder.Transparency else l_Theme_0.TextDefault.Transparency, 
                    inputTextXAlignment = Enum.TextXAlignment.Left, 
                    placeholderText = v12.placeholderText, 
                    placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                    placeholderTextTransparency = if v20 then l_Theme_0.PlaceHolder.Transparency else nil, 
                    textChangedCallback = v12.textChanged
                })
            })
        })
    });
end;