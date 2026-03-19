local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_1.AppCommonLib);
local v5 = require(l_Parent_1.Localization);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.UIBlox);
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_Text_0 = v4.Text;
local v11 = require(l_Parent_0.Context.CapturesContext);
local v12 = require(l_Parent_0.App.CapturesPolicy);
local v13 = require(l_Parent_0.Components.CoreUI.OnOffButton);
local v14 = require(l_Parent_0.Components.CoreUI.VideoCaptureCTA);
local v15 = require(l_Parent_0.Hooks.useKeyboardEnabled);
local v16 = UDim.new(0, 8);
local v17 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX and "Opt" or "Alt";
return (v12.connect(function(v18) --[[ Line: 222 ]]
    return {
        eligibleForVideoCapture = v18.eligibleForVideoCapture()
    };
end)(function(v19) --[[ Line: 44 ]]
    -- upvalues: l_useStyle_0 (copy), v6 (copy), v11 (copy), l_GuiService_0 (copy), l_useLocalization_0 (copy), v17 (copy), l_UserInputService_0 (copy), v15 (copy), l_Text_0 (copy), v16 (copy), v13 (copy), v14 (copy)
    local v20 = l_useStyle_0();
    local l_chromeEnabled_0 = v6.useContext(v11).chromeEnabled;
    local v22, v23 = v6.useState(Vector2.new(0, 0));
    local v24, v25 = v6.useState(l_GuiService_0.PreferredTextSize);
    v6.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: v25 (copy), l_GuiService_0 (ref)
        local function v26() --[[ Line: 52 ]] --[[ Name: onPreferredTextSizeChangedSignal ]]
            -- upvalues: v25 (ref), l_GuiService_0 (ref)
            v25(l_GuiService_0.PreferredTextSize);
        end;
        local v27 = l_GuiService_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(v26);
        return function() --[[ Line: 58 ]]
            -- upvalues: v27 (copy)
            v27:Disconnect();
        end;
    end, {});
    local v28 = l_useLocalization_0({
        capturesTitle = "Feature.Captures.Title.Captures", 
        educationalText = "Feature.Captures.Label.EducationalText", 
        hotkeyEducationalText = {
            "Feature.Captures.Label.HotkeyEducationalText"; 
            keyOne = v17, 
            keyTwo = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.One)
        }
    });
    local v29 = if v15() then v28.hotkeyEducationalText else v28.educationalText;
    local l_Color_0 = v20.Theme.BackgroundDefault.Color;
    local l_Transparency_0 = v20.Theme.BackgroundDefault.Transparency;
    local l_Color_1 = v20.Theme.TextDefault.Color;
    local l_Font_0 = v20.Font.CaptionBody.Font;
    local v34 = v20.Font.BaseSize * v20.Font.CaptionBody.RelativeSize;
    local l_Color_2 = v20.Theme.TextEmphasis.Color;
    local l_Font_1 = v20.Font.Header2.Font;
    local v37 = v20.Font.BaseSize * v20.Font.Header2.RelativeSize;
    local v39 = v6.useCallback(function(v38) --[[ Line: 89 ]]
        -- upvalues: v23 (copy), v19 (copy)
        v23(v38.AbsoluteSize);
        if v19.onAbsoluteSizeChanged then
            v19.onAbsoluteSizeChanged(v38.AbsoluteSize);
        end;
    end, {});
    local v40 = v6.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: l_Text_0 (ref), v29 (copy), l_Font_0 (copy), v34 (copy)
        return l_Text_0.GetTextWidth(v29, l_Font_0, v34);
    end, {
        l_Font_0, 
        v34, 
        v24, 
        v29
    });
    local l_X_0 = v22.X;
    local v42 = v40 < l_X_0 - 224 - 24;
    local v43 = 20;
    if not v42 and not (v40 < l_X_0 - 24) then
        v43 = l_Text_0.GetTextHeight(v29, l_Font_0, v34, l_X_0 - 24) + 10;
    end;
    return v6.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v19.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        [v6.Change.AbsoluteSize] = v39
    }, {
        UICorner = v6.createElement("UICorner", {
            CornerRadius = v16
        }), 
        UIPadding = v6.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12), 
            PaddingTop = UDim.new(0, 12)
        }), 
        Layout = if not l_chromeEnabled_0 then v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }) else nil, 
        CapturesToggleCTA = if not l_chromeEnabled_0 then v6.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = l_Color_0, 
            BackgroundTransparency = l_Transparency_0, 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0)
        }, {
            TextFrame = v6.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0)
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                Title = v6.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = l_Font_1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 30), 
                    Text = v28.capturesTitle, 
                    TextColor3 = l_Color_2, 
                    TextSize = v37, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                EducationalLabel = v6.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = l_Font_0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v43), 
                    Text = v29, 
                    TextColor3 = l_Color_1, 
                    TextSize = v34, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            CapturesToggleFrame = v6.createElement("Frame", {
                AnchorPoint = if v42 then Vector2.new(1, 0.5) else Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = if v42 then UDim2.fromScale(1, 0.5) else UDim2.new(1, 0, 0, -10), 
                Size = UDim2.fromOffset(224, 44)
            }, {
                OnOffButton = v6.createElement(v13, {
                    height = 44, 
                    width = 224
                })
            })
        }) else nil, 
        Space = if not v19.eligibleForVideoCapture or l_chromeEnabled_0 then nil else v6.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 0, 0, 20), 
            LayoutOrder = 2
        }), 
        VideoCaptureCTA = if v19.eligibleForVideoCapture then v6.createElement(v14, {
            closeSettingsMenu = v19.closeSettingsMenu, 
            LayoutOrder = 3
        }) else nil
    });
end));