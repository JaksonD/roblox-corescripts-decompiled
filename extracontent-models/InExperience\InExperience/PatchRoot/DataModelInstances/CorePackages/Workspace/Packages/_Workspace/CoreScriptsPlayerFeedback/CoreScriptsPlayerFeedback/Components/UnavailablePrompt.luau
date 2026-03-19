local l_Parent_0 = script:FindFirstAncestor("CoreScriptsPlayerFeedback").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_useScreenSize_0 = require(l_Parent_0.CoreScriptsRoactCommon).useScreenSize;
local l_useLastInputMethod_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMethod;
local l_GuiService_0 = game:GetService("GuiService");
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return (v1.memo(function(v10) --[[ Line: 26 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useStyle_0 (copy), v1 (copy), l_useLastInputMethod_0 (copy), l_useLocalization_0 (copy), l_GuiService_0 (copy), l_ButtonType_0 (copy), l_InteractiveAlert_0 (copy)
    local v11 = l_useScreenSize_0();
    local v12 = l_useStyle_0();
    local v13 = v1.useRef(nil);
    local v14 = l_useLastInputMethod_0();
    local v15, v16 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v15 (copy), v14 (copy), v16 (copy)
        if not v15 and (v14 == "Keyboard" or v14 == "Gamepad") then
            v16(true);
        end;
    end, {
        v15, 
        v14
    });
    local v17 = l_useLocalization_0({
        Title = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Title", 
        HeaderUnder13 = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.Under13", 
        HintUnder13 = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.Under13", 
        HeaderRateLimited = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.RateLimited", 
        HintRateLimited = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.RateLimited", 
        HeaderDefault = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.Default", 
        HintDefault = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.Default", 
        OkayButton = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.OkayButton"
    });
    local _ = v17.Title;
    local v19 = "";
    local v20 = "";
    if v10.reason == "Under13" then
        v19 = v17.HeaderUnder13;
        v20 = v17.HintUnder13;
    elseif v10.reason == "RateLimited" then
        v19 = v17.HeaderRateLimited;
        v20 = v17.HintRateLimited;
    else
        v19 = v17.HeaderDefault;
        v20 = v17.HintDefault;
    end;
    local v26 = v1.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v12 (copy), v1 (ref), v19 (ref), v20 (ref)
        local l_Body_0 = v12.Font.Body;
        local v22 = v12.Font.Header2 or v12.Font.Body;
        local l_BaseSize_0 = v12.Font.BaseSize;
        local v24 = math.floor(v22.RelativeSize * l_BaseSize_0);
        local v25 = math.floor(l_Body_0.RelativeSize * l_BaseSize_0);
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }), 
            Header = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v19, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = v12.Theme.TextEmphasis.Color, 
                TextTransparency = v12.Theme.TextEmphasis.Transparency, 
                Font = v22.Font, 
                TextSize = v24, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 1
            }), 
            Hint = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = v12.Theme.TextMuted.Color, 
                TextTransparency = v12.Theme.TextMuted.Transparency, 
                Font = l_Body_0.Font, 
                TextSize = v25, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2
            })
        });
    end, {
        v12, 
        v19, 
        v20
    });
    local v27 = v1.useCallback(function() --[[ Line: 114 ]]
        -- upvalues: v10 (copy)
        v10.closePrompt();
    end, {
        v10.closePrompt
    });
    local v29 = v1.useCallback(function(v28) --[[ Line: 118 ]]
        -- upvalues: v13 (copy), v15 (copy), l_GuiService_0 (ref)
        v13.current = v28;
        if v15 and v28 then
            pcall(function() --[[ Line: 121 ]]
                -- upvalues: l_GuiService_0 (ref), v28 (copy)
                l_GuiService_0:Select(v28);
            end);
        end;
    end, {
        v15
    });
    v1.useEffect(function() --[[ Line: 127 ]]
        -- upvalues: v15 (copy), v13 (copy), l_GuiService_0 (ref)
        if not v15 then
            return;
        else
            local l_current_0 = v13.current;
            if l_current_0 then
                pcall(function() --[[ Line: 133 ]]
                    -- upvalues: l_GuiService_0 (ref), l_current_0 (copy)
                    l_GuiService_0:Select(l_current_0);
                end);
            end;
            return;
        end;
    end, {
        v15
    });
    local v31 = v1.useMemo(function() --[[ Line: 139 ]]
        -- upvalues: l_ButtonType_0 (ref), v27 (copy), v17 (copy), v29 (copy), v15 (copy)
        return {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v27, 
                        text = v17.OkayButton, 
                        isDelayedInput = false, 
                        enableInputDelayed = false, 
                        delayInputSeconds = 1, 
                        isDisabled = false, 
                        buttonRef = v29
                    }, 
                    isDefaultChild = v15
                }
            }
        };
    end, {
        v27, 
        v17.OkayButton, 
        v15, 
        v29
    });
    return v1.createElement(l_InteractiveAlert_0, {
        title = v17.Title, 
        buttonStackInfo = v31, 
        isMiddleContentFocusable = false, 
        middleContent = v26, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v11, 
        defaultChildRef = if v15 then v13 else nil, 
        isRoactGamepadEnabled = v15, 
        onCloseClicked = v27
    });
end));