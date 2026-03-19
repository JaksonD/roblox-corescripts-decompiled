local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useCursor_0 = require(l_Parent_0.UIBlox).App.SelectionCursor.useCursor;
local v5 = require(l_script_FirstAncestor_0.Localization);
local v6 = require(l_script_FirstAncestor_0.Config);
local v7 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableChatButtonTelemetryEnabled");
local function _(v9, v10) --[[ Line: 34 ]] --[[ Name: setTransparency ]]
    return v10:map(function(v11) --[[ Line: 35 ]]
        -- upvalues: v9 (copy)
        return v9 + v11 * (1 - v9);
    end);
end;
return v5.connect(function() --[[ Line: 120 ]]
    return {
        EnableChatButtonText = "CoreScripts.TextChat.EnableChatButton.Label.UnlockChat"
    };
end)(function(v13) --[[ Line: 40 ]] --[[ Name: EnableChatButton ]]
    -- upvalues: l_useCursor_0 (copy), v7 (copy), v3 (copy), l_game_EngineFeature_0 (copy), l_TextChatService_0 (copy), v6 (copy)
    local v14 = l_useCursor_0();
    local l_isSpatialUIEnabled_0 = v13.isSpatialUIEnabled;
    local l_chatWindowSettings_0 = v13.chatWindowSettings;
    local l_BackgroundTransparency_0 = v7(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v7(l_chatWindowSettings_0).BackgroundColor3;
    v3.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v13 (copy), l_TextChatService_0 (ref)
        if l_game_EngineFeature_0 and v13.visible then
            l_TextChatService_0:SendEnableChatButtonShown();
        end;
    end, {
        v13.visible
    });
    local l_createElement_0 = v3.createElement;
    local v20 = "Frame";
    local v22 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = v13.transparencyValue:map(function(v21) --[[ Line: 35 ]]
            -- upvalues: l_BackgroundTransparency_0 (copy)
            return l_BackgroundTransparency_0 + v21 * (1 - l_BackgroundTransparency_0);
        end), 
        BorderSizePixel = 0, 
        LayoutOrder = v13.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        Visible = v13.visible, 
        ZIndex = 2, 
        [v3.Event.MouseEnter] = v13.onHovered, 
        [v3.Event.MouseLeave] = v13.onUnhovered
    };
    local v23 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8), 
            PaddingTop = v13.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 1)
        })
    };
    local l_createElement_1 = v3.createElement;
    local v25 = "TextButton";
    local v26 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = v6.EnableChatButtonBackgroundColor
    };
    local l_EnableChatButtonBackgroundTransparency_0 = v6.EnableChatButtonBackgroundTransparency;
    local l_l_EnableChatButtonBackgroundTransparency_0_0 = l_EnableChatButtonBackgroundTransparency_0 --[[ copy: 14 -> 19 ]];
    v26.BackgroundTransparency = v13.transparencyValue:map(function(v29) --[[ Line: 35 ]]
        -- upvalues: l_l_EnableChatButtonBackgroundTransparency_0_0 (copy)
        return l_l_EnableChatButtonBackgroundTransparency_0_0 + v29 * (1 - l_l_EnableChatButtonBackgroundTransparency_0_0);
    end);
    v26.Size = UDim2.fromScale(1, 0);
    v26.FontFace = v6.EnableChatButtonFontFace;
    v26.Selectable = true;
    v26.SelectionImageObject = v14;
    v26.Text = if v13.EnableChatButtonText ~= nil and v13.EnableChatButtonText ~= "" then v13.EnableChatButtonText else "Unlock chat";
    v26.TextColor3 = v6.ChatInputBarTextColor3;
    v26.TextSize = if l_isSpatialUIEnabled_0 then v6.ChatInputBarSpatialPanelTextSize else v6.ChatInputBarTextSize;
    l_EnableChatButtonBackgroundTransparency_0 = v13.transparencyValue;
    local v30 = 0;
    v26.TextTransparency = l_EnableChatButtonBackgroundTransparency_0:map(function(v31) --[[ Line: 35 ]]
        -- upvalues: v30 (copy)
        return v30 + v31 * (1 - v30);
    end);
    v26.TextWrapped = true;
    v26.TextXAlignment = Enum.TextXAlignment.Center;
    v26.TextYAlignment = Enum.TextYAlignment.Center;
    v26.ZIndex = 2;
    v26[v3.Event.Activated] = function() --[[ Line: 100 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), l_TextChatService_0 (ref), v13 (copy)
        if l_game_EngineFeature_0 then
            l_TextChatService_0:SendEnableChatButtonClicked();
        end;
        v13.onActivated();
    end;
    v23.EnableChatButton = l_createElement_1(v25, v26, {
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 10), 
            PaddingLeft = UDim.new(0, 10), 
            PaddingRight = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10)
        })
    });
    return l_createElement_0(v20, v22, v23);
end);