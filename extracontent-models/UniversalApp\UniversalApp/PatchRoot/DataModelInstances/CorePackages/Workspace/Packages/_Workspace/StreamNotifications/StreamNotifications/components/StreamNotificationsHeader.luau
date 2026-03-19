local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.constants);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local l_NotificationHelper_0 = require(l_Parent_0.NotificationsCommon).NotificationHelper;
local v12 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local v13 = require(l_script_FirstAncestor_0.StreamNotificationDropdownExperimentation);
return function(v14) --[[ Line: 25 ]]
    -- upvalues: l_useStyle_0 (copy), l_UserInputService_0 (copy), l_useLocalization_0 (copy), v2 (copy), v13 (copy), v4 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v12 (copy)
    local v15 = l_useStyle_0();
    local l_Font_0 = v15.Font;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v18 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local v19 = if l_UserInputService_0.StatusBarSize and v14.isSmallScreen then l_UserInputService_0.StatusBarSize.Y else 0;
    local v20 = l_useLocalization_0({
        headerText = v2.Text.HeaderKey
    });
    if v13.getDropdownEnabled() then
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v2.Dropdown.HeaderMinHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            HeaderText = v4.createElement("TextLabel", {
                Text = v20 and v20.headerText, 
                Font = l_Font_1, 
                TextSize = v18, 
                TextColor3 = v15.Theme.TextEmphasis.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            })
        });
    else
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v2.Modal.HeaderHeight + v19), 
            BackgroundTransparency = 1
        }, {
            HeaderFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v2.Modal.HeaderHeight), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1)
            }, {
                CloseModal = v4.createElement(l_IconButton_0, {
                    anchorPoint = Vector2.new(0, 0), 
                    iconSize = l_IconSize_0.Medium, 
                    icon = if v14.isSmallScreen then v2.Modal.BackIcon else v2.Modal.CloseIcon, 
                    layoutOrder = 1, 
                    size = UDim2.new(0, v2.Modal.HeaderHeight - v2.Modal.Padding * 2, 0, v2.Modal.HeaderHeight - v2.Modal.Padding * 2), 
                    position = UDim2.fromOffset(v2.Modal.Padding, v2.Modal.Padding), 
                    onActivated = function() --[[ Line: 81 ]] --[[ Name: onActivated ]]
                        -- upvalues: v14 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v12 (ref)
                        v14.displayStream(false);
                        l_NotificationHelper_0.fireEvent(l_EventStream_0, v12.Context.click, v12.EventNames.closeContent, {
                            closeMethod = v12.CloseMethod.closeIcon
                        });
                    end
                }), 
                HeaderText = v4.createElement("TextLabel", {
                    Text = v20 and v20.headerText, 
                    Font = l_Font_1, 
                    TextSize = v18, 
                    TextColor3 = v15.Theme.TextEmphasis.Color, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(1, 0, 0, v2.Modal.HeaderHeight), 
                    BackgroundTransparency = 1
                })
            })
        });
    end;
end;