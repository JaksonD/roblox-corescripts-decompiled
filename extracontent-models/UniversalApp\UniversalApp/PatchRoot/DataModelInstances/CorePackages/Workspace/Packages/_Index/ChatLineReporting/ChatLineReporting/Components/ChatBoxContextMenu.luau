local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Otter);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local v8 = require(l_Parent_0.React);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ContextualMenu_0 = v3.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v3.App.Menu.MenuDirection;
local v12 = require(l_script_FirstAncestor_0.Components.ChatLineReportRoot);
local v13 = require(l_Parent_0.SharedFlags);
local l_FFlagChatLineReportingFocusFixesEnabled_0 = v13.FFlagChatLineReportingFocusFixesEnabled;
local l_GetFFlagMemoizeChatReportingMenu_0 = v13.GetFFlagMemoizeChatReportingMenu;
local v16 = {
    motorCallback = v4.instant, 
    open = {
        targetValue = 1
    }, 
    close = {
        targetValue = 0
    }
};
local v17 = {
    reportAbuse = "Feature.ReportAbuse.Action.EnterChatLineReporting"
};
return function(v18) --[[ Line: 35 ]]
    -- upvalues: l_useLocalization_0 (copy), v17 (copy), l_CurrentCamera_0 (copy), v7 (copy), v8 (copy), l_ContextualMenu_0 (copy), l_Images_0 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), l_GuiService_0 (copy), v12 (copy), l_GetFFlagMemoizeChatReportingMenu_0 (copy), l_MenuDirection_0 (copy), v16 (copy)
    local v19 = l_useLocalization_0(v17);
    local v20 = if l_CurrentCamera_0 then l_CurrentCamera_0.ViewportSize else Vector2.new(v7.ViewportSize, v7.ViewportSize);
    local v21 = v8.useRef(nil);
    v8.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: v21 (copy), v20 (copy), v7 (ref)
        if v21.current and v21.current.AbsolutePosition.X + v21.current.AbsoluteSize.X > v20.X then
            v21.current.AnchorPoint = Vector2.new(1, 0);
            v21.current.Position = UDim2.new(1, v7.FramePositionXOffsetLeft, 0, v7.FramePositionYOffset);
        end;
    end, {
        v21, 
        v20
    });
    return v8.createElement("Frame", {
        Size = UDim2.new(v7.FrameSizeXScale, v7.FrameSizeXOffset, 1, 0), 
        Position = UDim2.new(1, v7.FramePositionXOffset, 0, v7.FramePositionYOffset), 
        BackgroundTransparency = 1, 
        ref = v21
    }, {
        ContextualMenu = v8.createElement(l_ContextualMenu_0, {
            buttonProps = {
                {
                    icon = l_Images_0["icons/actions/feedback"], 
                    text = v19.reportAbuse, 
                    onActivated = function() --[[ Line: 67 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_FFlagChatLineReportingFocusFixesEnabled_0 (ref), l_GuiService_0 (ref), v12 (ref), l_GetFFlagMemoizeChatReportingMenu_0 (ref), v18 (copy)
                        if l_FFlagChatLineReportingFocusFixesEnabled_0 and l_GuiService_0.MenuIsOpen then
                            local v22 = nil;
                            do
                                local l_v22_0 = v22;
                                l_v22_0 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 73 ]]
                                    -- upvalues: v12 (ref), l_GetFFlagMemoizeChatReportingMenu_0 (ref), v18 (ref), l_v22_0 (ref)
                                    v12.initialize(if l_GetFFlagMemoizeChatReportingMenu_0() then v18.getMessages() else v18.messages);
                                    l_v22_0:Disconnect();
                                end);
                            end;
                        else
                            v12.initialize(if l_GetFFlagMemoizeChatReportingMenu_0() then v18.getMessages() else v18.messages);
                        end;
                        v18.setContextMenuOpen(false);
                    end
                }
            }, 
            elementHeight = v7.TopBannerSize, 
            closeBackgroundVisible = false, 
            open = true, 
            menuDirection = l_MenuDirection_0.Down, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            openPositionX = UDim.new(0, 0), 
            openPositionY = UDim.new(0, 0), 
            borderCornerRadius = v7.ContextualMenuBorderRadius, 
            motorOverrideOptions = v16, 
            background = {
                Transparency = v18.backgroundTransparency, 
                Color = v18.backgroundColor3
            }, 
            screenSize = v20, 
            onDismiss = function() --[[ Line: 52 ]]
                -- upvalues: v18 (copy)
                v18.setContextMenuOpen(false);
            end
        })
    });
end;