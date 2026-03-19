local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ReactRoblox);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local l_OpenTypeSupport_0 = require(l_CorePackages_0.Packages.UIBlox).Utility.OpenTypeSupport;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Constants;
local v8 = require(l_Modules_0.Settings.Theme);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local v11 = require(l_ShareGame_0.Constants);
local v12 = require(l_ShareGame_0.PresenceUtil);
local v13 = require(l_ShareGame_0.Components.SingleUserThumbnail);
local v14 = require(l_ShareGame_0.Components.InviteButton);
local l_InviteStatus_0 = v11.InviteStatus;
local v16 = require(l_ShareGame_0.ThrottleFunctionCall);
local v17 = require(l_Modules_0.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData);
local v18 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteSendEndpoint);
local v19 = require(l_Modules_0.Flags.GetFFlagThrottleInviteSendEndpoint);
local v20 = require(l_Modules_0.Flags.GetFIntThrottleInviteSendEndpointDelay);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local v22 = Rect.new(10, 10, 10, 10);
return function(v23) --[[ Line: 64 ]]
    -- upvalues: v2 (copy), l_InviteStatus_0 (copy), l_Players_0 (copy), v18 (copy), l_GameInviteEvents_0 (copy), v17 (copy), v19 (copy), v16 (copy), v20 (copy), v22 (copy), v8 (copy), v3 (copy), v13 (copy), v12 (copy), l_Constants_0 (copy), l_AppFonts_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), v14 (copy)
    local l_user_0 = v23.user;
    local v33 = v2.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v23 (copy), l_InviteStatus_0 (ref), l_user_0 (copy), l_Players_0 (ref), v18 (ref), l_GameInviteEvents_0 (ref), v17 (ref)
        local l_inviteUser_0 = v23.inviteUser;
        local l_inviteStatus_0 = v23.inviteStatus;
        local l_analytics_0 = v23.analytics;
        if l_inviteStatus_0 and l_inviteStatus_0 ~= l_InviteStatus_0.Failed then
            return;
        else
            local function v31(v28) --[[ Line: 74 ]]
                -- upvalues: l_user_0 (ref), l_Players_0 (ref), l_analytics_0 (copy)
                if not v28 then
                    return;
                else
                    local v29 = {
                        l_user_0.id
                    };
                    if l_Players_0.LocalPlayer and v28 then
                        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                        l_analytics_0:onActivatedInviteSent(l_LocalPlayer_0.UserId, v28.conversationId, v29);
                    end;
                    return;
                end;
            end;
            if v18() then
                local v32 = false;
                if v23.launchData ~= nil then
                    v32 = v23.launchData ~= "";
                end;
                l_analytics_0:sendEvent(v23.trigger, l_GameInviteEvents_0.SendInvite, {
                    recipient = l_user_0.id, 
                    isLaunchDataProvided = if v17() then v32 else nil
                });
                l_inviteUser_0(l_user_0.id, l_analytics_0, v23.trigger, v23.inviteMessageId, v23.launchData):andThen(v31, function() --[[ Line: 97 ]]

                end);
                return;
            else
                l_inviteUser_0(l_user_0.id):andThen(v31, function() --[[ Line: 100 ]]

                end);
                return;
            end;
        end;
    end, {
        v23.inviteUser, 
        v23.inviteStatus, 
        v23.analytics, 
        l_user_0
    });
    if v19() then
        v33 = v2.useCallback(v16(v20(), v33), {
            v33
        });
    end;
    if not v23.visible then
        return;
    else
        return v2.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, 60), 
            ScaleType = Enum.ScaleType.Stretch, 
            SliceCenter = v22, 
            BackgroundColor3 = v8.color("PlayerRowFrame"), 
            BackgroundTransparency = v8.transparency("PlayerRowFrame", 1), 
            ImageTransparency = 0.85, 
            LayoutOrder = v23.layoutOrder, 
            [v3.Event.Activated] = if v23.isFullRowActivatable then v33 else nil
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = v8.MenuContainerCornerRadius
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 16), 
                PaddingLeft = UDim.new(0, 8)
            }), 
            Thumbnail = v2.createElement(v13, {
                user = l_user_0, 
                size = UDim2.new(0, 44, 0, 44), 
                position = UDim2.new(0, 0, 0.5, 0), 
                anchorPoint = Vector2.new(0, 0.5)
            }), 
            UserInfo = v2.createElement("Frame", {
                Position = UDim2.new(0, 44, 0, 0), 
                Size = UDim2.new(1, -118, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 4)
                }), 
                DisplayNameWrapper = v2.createElement("Frame", {
                    Size = UDim2.new(0, 0, 0, 16), 
                    BackgroundTransparency = 1
                }, {
                    PresenceIconLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    Icon = v12.GetIcon(l_user_0.presence), 
                    DisplayName = v2.createElement("TextLabel", {
                        Size = UDim2.new(0, 0, 0, 16), 
                        Text = l_user_0.displayName, 
                        TextSize = 16, 
                        TextColor3 = l_Constants_0.COLORS.WHITE, 
                        Font = l_AppFonts_0.default:getMedium(), 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 2
                    })
                }), 
                Username = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 16), 
                    Text = "@" .. l_user_0.name, 
                    TextSize = 16, 
                    TextColor3 = l_Constants_0.COLORS.PUMICE, 
                    Font = l_AppFonts_0.default:getDefault(), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    OpenTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
                })
            }), 
            InviteButton = v2.createElement(v14, {
                size = UDim2.new(0, 66, 0, 36), 
                position = UDim2.new(1, 0, 0.5, 0), 
                anchorPoint = Vector2.new(1, 0.5), 
                onInvite = v33, 
                inviteStatus = v23.inviteStatus
            })
        });
    end;
end;