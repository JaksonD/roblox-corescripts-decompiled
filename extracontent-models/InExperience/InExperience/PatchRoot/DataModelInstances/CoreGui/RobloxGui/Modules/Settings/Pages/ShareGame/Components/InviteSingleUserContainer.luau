local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.Common.renderWithCoreScriptsStyleProvider);
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local l_COLORS_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Constants.COLORS;
local v11 = require(l_ShareGame_0.Constants);
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local l_InviteStatus_0 = v11.InviteStatus;
local v14 = require(l_ShareGame_0.getTranslator)();
local v15 = require(l_Modules_0.Common.httpRequest);
local v16 = require(l_ShareGame_0.Thunks.InviteUserIdToPlaceId);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v18 = require(l_ShareGame_0.Thunks.InviteUserIdToPlaceIdCustomized);
local v19 = require(l_ShareGame_0.ThrottleFunctionCall);
local v20 = require(l_ShareGame_0.Components.SingleUserThumbnail);
local v21 = require(l_Modules_0.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData);
local v22 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteSendEndpoint);
local v23 = require(l_Modules_0.Flags.GetFFlagInviteListStyleFixes);
local v24 = require(l_Modules_0.Flags.GetFFlagThrottleInviteSendEndpoint);
local v25 = require(l_Modules_0.Flags.GetFIntThrottleInviteSendEndpointDelay);
local v26 = require(l_Modules_0.Settings.Flags.GetFFlagSingleUserInvitePageKeybind);
local v27 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v27.App.Button.Button;
local l_ButtonType_0 = v27.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v27.App.Text.StyledTextLabel;
local l_useStyle_0 = v27.Core.Style.useStyle;
local v32 = Color3.fromRGB(41, 41, 41);
local function v58(v33) --[[ Line: 53 ]]
    -- upvalues: l_useStyle_0 (copy), v5 (copy), v11 (copy), l_GameInviteEvents_0 (copy), l_InviteStatus_0 (copy), v21 (copy), l_Players_0 (copy), v26 (copy), l_ContextActionService_0 (copy), v24 (copy), v19 (copy), v25 (copy), l_RetrievalStatus_0 (copy), v23 (copy), v32 (copy), l_COLORS_0 (copy), l_StyledTextLabel_0 (copy), v14 (copy), v20 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v34 = v33.friends[tostring(v33.inviteUserId)];
    local v35 = v34 and v33.invites[v34.id];
    local v36 = l_useStyle_0();
    local v37, v38 = v5.useState(false);
    v5.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: v33 (copy), v11 (ref), l_GameInviteEvents_0 (ref)
        if v33.promptMessage and v33.analytics then
            v33.analytics:sendEvent(v11.Triggers.DeveloperSingle, l_GameInviteEvents_0.CustomTextShown);
        end;
    end, {});
    local v39 = v5.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v33 (copy)
        v33.closePage();
        if v33.onAfterClosePage then
            v33.onAfterClosePage();
        end;
    end, {
        v33.closePage, 
        v33.onAfterClosePage
    });
    local v40 = v5.useCallback(function() --[[ Line: 76 ]]
        -- upvalues: v33 (copy), v11 (ref), l_GameInviteEvents_0 (ref), v39 (copy)
        v33.analytics:sendEvent(v11.Triggers.DeveloperSingle, l_GameInviteEvents_0.CancelInvite);
        v39();
    end, {
        v39
    });
    local v48 = v5.useCallback(function() --[[ Line: 83 ]]
        -- upvalues: v38 (copy), v33 (copy), v35 (copy), l_InviteStatus_0 (ref), v11 (ref), l_GameInviteEvents_0 (ref), v34 (copy), v21 (ref), l_Players_0 (ref), v39 (copy)
        v38(true);
        local l_inviteUser_0 = v33.inviteUser;
        local l_analytics_0 = v33.analytics;
        if v35 and v35 ~= l_InviteStatus_0.Failed then
            return;
        else
            local v43 = false;
            if v33.launchData ~= nil then
                v43 = v33.launchData ~= "";
            end;
            l_analytics_0:sendEvent(v11.Triggers.DeveloperSingle, l_GameInviteEvents_0.SendInvite, {
                recipient = v34.id, 
                isLaunchDataProvided = if v21() then v43 else nil
            });
            local function v47(v44) --[[ Line: 97 ]]
                -- upvalues: v38 (ref), v34 (ref), l_Players_0 (ref), l_analytics_0 (copy), v39 (ref)
                v38(false);
                if not v44 then
                    return;
                else
                    local v45 = {
                        v34.id
                    };
                    if l_Players_0.LocalPlayer and v44.conversationId then
                        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                        l_analytics_0:onActivatedInviteSent(l_LocalPlayer_0.UserId, v44.conversationId, v45);
                    end;
                    v39();
                    return;
                end;
            end;
            l_inviteUser_0(tostring(v34.id), l_analytics_0, v33.inviteMessageId, v33.launchData):andThen(v47, v39);
            return;
        end;
    end, {
        v33.inviteUser, 
        v33.inviteMessageId, 
        v33.launchData, 
        v33.analytics, 
        v38, 
        v35, 
        v34, 
        v39
    });
    if v26() then
        v5.useEffect(function() --[[ Line: 125 ]]
            -- upvalues: v33 (copy), l_ContextActionService_0 (ref), v48 (ref), v40 (copy)
            if v33.isVisible then
                l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v50, _) --[[ Line: 127 ]]
                    -- upvalues: v48 (ref)
                    if v50 == Enum.UserInputState.Begin then
                        v48();
                    end;
                end, false, Enum.KeyCode.ButtonA);
                l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v53, _) --[[ Line: 132 ]]
                    -- upvalues: v40 (ref)
                    if v53 == Enum.UserInputState.Begin then
                        v40();
                    end;
                end, false, Enum.KeyCode.ButtonB);
                return function() --[[ Line: 137 ]]
                    -- upvalues: l_ContextActionService_0 (ref)
                    l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
                    l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
                end;
            else
                return nil;
            end;
        end, {
            v33.isVisible, 
            v48, 
            v40
        });
    end;
    if v24() then
        v48 = v5.useCallback(v19(v25(), v48), {
            v48
        });
    end;
    if not v34 then
        if v33.friendsRetrievalStatus == l_RetrievalStatus_0.Done or v33.friendsRetrievalStatus == l_RetrievalStatus_0.Failed then
            v39();
        end;
        return;
    else
        local v55 = v35 and v35 ~= l_InviteStatus_0.Failed;
        local v56 = v55 and "Feature.SettingsHub.Label.Invited" or "Feature.SettingsHub.Action.InviteFriend";
        local v57 = v23();
        return v5.createElement("Frame", {
            Size = if v57 then UDim2.new(1, 0, 0, 0) else UDim2.new(0, 442, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0, 
            BackgroundColor3 = if v57 then v32 else l_COLORS_0.FLINT, 
            BackgroundTransparency = v57 and 0.1 or 0
        }, {
            SizeConstraint = if v57 then v5.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(442, 1e999), 
                MinSize = Vector2.new(0, 0)
            }) else nil, 
            Corner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Padding = v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            Header = v5.createElement(l_StyledTextLabel_0, {
                fontStyle = v36.Font.Header1, 
                colorStyle = v36.Theme.TextEmphasis, 
                text = v14:FormatByKey("Feature.SettingsHub.Heading.InviteUser", {
                    DisplayName = v34.displayName
                }), 
                size = UDim2.new(1, 0, 0, 48), 
                textXAlignment = Enum.TextXAlignment.Center
            }), 
            Divider = v5.createElement("Frame", {
                Position = UDim2.new(0, 0, 0, 48), 
                Size = UDim2.new(1, 0, 0, 1), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_COLORS_0.GRAPHITE
            }), 
            Wrapper = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, 0, 0, 56), 
                BackgroundTransparency = 1
            }, {
                ListLayout = v5.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 24)
                }), 
                Thumbnail = v5.createElement(v20, {
                    user = v34, 
                    size = UDim2.new(0, 95, 0, 95), 
                    layoutOrder = 1, 
                    square = true, 
                    backgroundTransparency = v57 and 1 or nil
                }), 
                TextBody = v5.createElement(l_StyledTextLabel_0, {
                    fontStyle = v36.Font.Header2, 
                    colorStyle = v36.Theme.TextEmphasis, 
                    text = v33.promptMessage or v14:FormatByKey("Feature.SettingsHub.Label.DefaultInviteMessage", {
                        DisplayName = v34.displayName
                    }), 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.new(1, 0, 0, 0), 
                    layoutOrder = 2
                }), 
                ButtonWrapper = v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48), 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1
                }, {
                    CancelButton = v5.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.Secondary, 
                        size = UDim2.new(0.5, -12, 1, 0), 
                        text = v14:FormatByKey("Feature.SettingsHub.Action.Cancel"), 
                        onActivated = v40, 
                        isDisabled = v37
                    }), 
                    InviteButton = v5.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = UDim2.new(0.5, -12, 1, 0), 
                        position = UDim2.new(0.5, 12, 0, 0), 
                        text = v14:FormatByKey(v56), 
                        onActivated = v48, 
                        isLoading = v37, 
                        isDisabled = v55
                    })
                })
            })
        });
    end;
end;
return v6.connect(function(v59) --[[ Line: 271 ]]
    -- upvalues: l_Players_0 (copy)
    return {
        friends = v59.Users, 
        friendsRetrievalStatus = l_Players_0.LocalPlayer and v59.Friends.retrievalStatus[tostring(l_Players_0.LocalPlayer.UserId)], 
        invites = v59.Invites
    };
end, function(v60) --[[ Line: 278 ]]
    -- upvalues: v15 (copy), l_HttpRbxApiService_0 (copy), v22 (copy), v18 (copy), v11 (copy), v16 (copy)
    return {
        inviteUser = function(v61, v62, v63, v64) --[[ Line: 280 ]] --[[ Name: inviteUser ]]
            -- upvalues: v15 (ref), l_HttpRbxApiService_0 (ref), v22 (ref), v60 (copy), v18 (ref), v11 (ref), v16 (ref)
            local v65 = v15(l_HttpRbxApiService_0);
            local v66 = tostring(game.PlaceId);
            if v22() then
                return v60(v18(v65, v61, v66, v62, v11.Triggers.DeveloperSingle, v63, v64));
            else
                return v60(v16(v65, v61, v66));
            end;
        end
    };
end)(function(v67) --[[ Line: 301 ]]
    -- upvalues: v8 (copy), v5 (copy), v58 (copy)
    return v8({
        SingleUserInvite = v5.createElement(v58, v67)
    });
end);