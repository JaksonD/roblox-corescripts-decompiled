local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local _ = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v9 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local l_withTooltip_0 = v7.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v7.App.Dialog.Enum.TooltipOrientation;
local l_StyledTextLabel_0 = v7.App.Text.StyledTextLabel;
local l_useStyle_0 = v7.Core.Style.useStyle;
local v14 = require(l_RobloxGui_0.Modules.Flags.FIntVoiceChatTooltipDelay);
local v15 = require(l_RobloxGui_0.Modules.TopBar.Constants);
local l_TopBarHeight_0 = v15.TopBarHeight;
return function(v17) --[[ Line: 35 ]] --[[ Name: VoiceChatTooltip ]]
    -- upvalues: l_useStyle_0 (copy), v5 (copy), l_GuiService_0 (copy), v14 (copy), v8 (copy), v9 (copy), l_TopBarHeight_0 (copy), v15 (copy), v6 (copy), l_StyledTextLabel_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), l_withTooltip_0 (copy)
    local v18 = l_useStyle_0();
    local v19 = v5.useRef(nil);
    local l_onClose_0 = v17.onClose;
    v5.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v17 (copy), v19 (copy), l_GuiService_0 (ref), l_onClose_0 (copy), v14 (ref)
        if v17.showPrompt then
            v19.current = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 43 ]]
                -- upvalues: v19 (ref), l_onClose_0 (ref)
                if v19.current then
                    v19.current:Disconnect();
                    v19.current = nil;
                    l_onClose_0();
                end;
            end);
            task.delay(v14, function() --[[ Line: 50 ]]
                -- upvalues: v19 (ref), v17 (ref), l_onClose_0 (ref)
                if v19.current then
                    v19.current:Disconnect();
                    v19.current = nil;
                end;
                if v17.showPrompt then
                    l_onClose_0();
                end;
            end);
        end;
        return function() --[[ Line: 61 ]]
            -- upvalues: v19 (ref)
            if v19.current then
                v19.current:Disconnect();
                v19.current = nil;
            end;
        end;
    end, {
        v17.showPrompt
    });
    local v21 = v8:IsSmallTouchScreen();
    local v22 = 38;
    local v23 = v21 and 64 or 64;
    if v9() then
        v22 = l_TopBarHeight_0;
    end;
    v22 = v15.useDisplayScaleState(l_TopBarHeight_0);
    local v25 = {
        headerText = v17.titleText, 
        minContentWidth = 240, 
        renderCustomComponents = function(_) --[[ Line: 83 ]] --[[ Name: renderCustomComponents ]]
            -- upvalues: v6 (ref), l_StyledTextLabel_0 (ref), v17 (copy), v18 (copy)
            return v6.createElement(l_StyledTextLabel_0, {
                text = v17.subtitleText, 
                textTruncate = Enum.TextTruncate.None, 
                textXAlignment = Enum.TextXAlignment.Left, 
                fontStyle = v18.Font.CaptionSmall, 
                colorStyle = v18.Theme.TextDefault, 
                layoutOrder = 0, 
                automaticSize = Enum.AutomaticSize.XY
            });
        end, 
        onClose = l_onClose_0, 
        backgroundColor = v18.Theme.BackgroundUIDefault.Color, 
        backgroundTransparency = v18.Theme.BackgroundUIDefault.Transparency
    };
    local v26 = {
        guiTarget = l_CoreGui_0, 
        active = v17.showPrompt, 
        DisplayOrder = 10, 
        preferredOrientation = l_TooltipOrientation_0.Bottom
    };
    return l_withTooltip_0(v25, v26, function(v27) --[[ Line: 106 ]]
        -- upvalues: v6 (ref), v23 (copy), v22 (ref), v5 (ref)
        return v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v23, 0, v22), 
            [v5.Change.AbsoluteSize] = v27, 
            [v5.Change.AbsolutePosition] = v27
        });
    end);
end;