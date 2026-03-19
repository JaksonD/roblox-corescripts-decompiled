local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_CorePackages_0.Packages.enumerate);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.withStyle;
local v7 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v10 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v11 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceARUnblockingUnmutingEnabled);
local v12 = require(script.Parent.ReportActionSelection);
local v13 = require(script.Parent.ReportActionAreYouSure);
local v14 = v5("ReportPages", {
    SelectActions = 1, 
    ConfirmAction = 2
});
local v15 = v2.PureComponent:extend("ReportConfirmationContainer");
v15.defaultProps = {
    blockingUtility = v7, 
    voiceChatServiceManager = l_default_0, 
    isVoiceReport = false, 
    closeMenu = function() --[[ Line: 33 ]]

    end
};
v15.validateProps = v3.interface({
    player = v3.strictInterface({
        UserId = v3.number, 
        Name = v3.string, 
        DisplayName = v3.string
    }), 
    isVoiceReport = v3.boolean, 
    closeMenu = v3.callback, 
    blockingAnalytics = v3.optional(v3.table), 
    reportAbuseAnalytics = v3.optional(v3.table)
});
local _ = function(v16, v17) --[[ Line: 54 ]] --[[ Name: getIsPlayerBlockedByUserId ]]
    -- upvalues: v4 (copy)
    return v4.new(function(v18, _) --[[ Line: 55 ]]
        -- upvalues: v16 (copy), v17 (copy)
        v18(v16:IsPlayerBlockedByUserId(v17));
    end);
end;
v15.init = function(v21) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v10 (copy), v14 (copy), v4 (copy)
    local l_player_0 = v21.props.player;
    local l_participants_0 = v21.props.voiceChatServiceManager.participants;
    v21:setState({
        absoluteWidth = 0
    });
    if v21.props.onSizeChanged then
        v21.props.onSizeChanged:Connect(function(v24) --[[ Line: 69 ]]
            -- upvalues: v21 (copy)
            v21:setState({
                absoluteWidth = v24.X
            });
        end);
    end;
    local v25 = l_participants_0[tostring(l_player_0.UserId)];
    v21.userFullName = l_player_0.DisplayName .. "(@" .. l_player_0.Name .. ")";
    v21.onMuteCheckboxActivated = function(v26) --[[ Line: 79 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            muteFlipped = v26
        });
    end;
    v21.onBlockCheckboxActivated = function(v27) --[[ Line: 85 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            blockFlipped = v27
        });
    end;
    v21.processMuteAndBlocking = function() --[[ Line: 91 ]]
        -- upvalues: v21 (copy), l_player_0 (copy), v11 (ref), v10 (ref)
        local l_blockFlipped_0 = v21.state.blockFlipped;
        local l_muteFlipped_0 = v21.state.muteFlipped;
        if l_blockFlipped_0 and not v21.state.targetInitiallyBlocked then
            if v21.props.blockingUtility:BlockPlayerAsync(l_player_0) then
                v21.props.blockingAnalytics:action("SettingsHub", "blockUser", {
                    blockeeUserId = l_player_0.UserId
                });
            end;
        elseif not l_blockFlipped_0 and v21.state.targetInitiallyBlocked and v11() and v21.props.blockingUtility:UnblockPlayerAsync(l_player_0) then
            v21.props.blockingAnalytics:action("SettingsHub", "unblockUser", {
                blockeeUserId = l_player_0.UserId
            });
        end;
        local v30 = v21.props.voiceChatServiceManager.participants[tostring(l_player_0.UserId)];
        if l_muteFlipped_0 and not v21.state.targetInitiallyVoiceMuted then
            v21.props.blockingUtility:MutePlayer(l_player_0);
            v21.props.reportAbuseAnalytics:reportEventAndIncrement("muteUser");
            if v30 and not v30.isMutedLocally then
                v21.props.voiceChatServiceManager:ToggleMutePlayer(l_player_0.UserId, v10.VOICE_CONTEXT_TYPE.REPORT_MENU);
            end;
        elseif not l_muteFlipped_0 and v21.state.targetInitiallyVoiceMuted and v11() then
            v21.props.blockingUtility:UnmutePlayer(l_player_0);
            v21.props.reportAbuseAnalytics:reportEventAndIncrement("unmuteUser");
            if v30 and v30.isMutedLocally then
                v21.props.voiceChatServiceManager:ToggleMutePlayer(l_player_0.UserId, v10.VOICE_CONTEXT_TYPE.REPORT_MENU);
            end;
        end;
        v21.props.closeMenu();
    end;
    v21.onActionSelectionDoneActivated = function(v31, v32) --[[ Line: 148 ]]
        -- upvalues: v21 (copy), v14 (ref)
        v21:setState({
            blockFlipped = v31, 
            muteFlipped = v32
        });
        if not v31 and not v32 or v32 == v21.state.targetInitiallyVoiceMuted and v31 == v21.state.targetInitiallyBlocked then
            v21.processMuteAndBlocking();
            return;
        else
            v21:setState({
                currentPage = v14.ConfirmAction
            });
            return;
        end;
    end;
    v21.onYesOrNoConfirmation = function() --[[ Line: 171 ]]
        -- upvalues: v21 (copy)
        v21.processMuteAndBlocking();
    end;
    v21.onYesOrNoCancel = function() --[[ Line: 175 ]]
        -- upvalues: v21 (copy), v14 (ref)
        v21:setState({
            currentPage = v14.SelectActions
        });
    end;
    v21:setState({
        currentPage = v14.SelectActions
    });
    if v25 then
        v21:setState({
            targetInitiallyVoiceMuted = v25.isMutedLocally, 
            muteFlipped = v25.isMutedLocally
        });
    else
        v21:setState({
            targetInitiallyVoiceMuted = false, 
            muteFlipped = false
        });
    end;
    local l_blockingUtility_0 = v21.props.blockingUtility;
    local l_UserId_0 = l_player_0.UserId;
    v4.new(function(v35, _) --[[ Line: 55 ]]
        -- upvalues: l_blockingUtility_0 (copy), l_UserId_0 (copy)
        v35(l_blockingUtility_0:IsPlayerBlockedByUserId(l_UserId_0));
    end):andThen(function(v37) --[[ Line: 198 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            targetInitiallyBlocked = v37, 
            blockFlipped = v37
        });
    end);
end;
v15.render = function(v38) --[[ Line: 206 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), v12 (copy), v8 (copy), v13 (copy), v14 (copy)
    return l_withStyle_0(function(_) --[[ Line: 207 ]]
        -- upvalues: v38 (copy), v2 (ref), v12 (ref), v8 (ref), v13 (ref), v14 (ref)
        local l_currentPage_0 = v38.state.currentPage;
        local v41 = 1.3;
        if v38.props.onSizeChanged then
            local l_absoluteWidth_0 = v38.state.absoluteWidth;
            v41 = l_absoluteWidth_0 >= 800 and 1.3 or l_absoluteWidth_0 > 600 and 1 or l_absoluteWidth_0 / 600;
        end;
        local v43 = v38.state.muteFlipped ~= nil and v38.state.muteFlipped;
        local v44 = v38.state.blockFlipped ~= nil and v38.state.blockFlipped;
        local v45 = v2.createElement(v12, {
            titleText = v8:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"), 
            subtitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.ThankYou"), 
            instructionText = v8:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"), 
            muteText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", {
                Player = v38.userFullName
            }), 
            blockText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", {
                Player = v38.userFullName
            }), 
            doneText = v8:FormatByKey("Feature.SettingsHub.Action.Report.Done"), 
            showVoiceMuting = v38.props.isVoiceReport, 
            isVoiceMuted = v43 or v38.state.targetInitiallyVoiceMuted, 
            isBlocked = v44 or v38.state.targetInitiallyBlocked, 
            onMuteCheckboxActivated = v38.onMuteCheckboxActivated, 
            onBlockCheckboxActivated = v38.onBlockCheckboxActivated, 
            onDoneActivated = v38.onActionSelectionDoneActivated, 
            uiScale = v41, 
            ZIndex = v38.props.ZIndex
        });
        local v46 = v2.createElement(v13, {
            mutedTitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", {
                Player = v38.userFullName
            }), 
            blockedTitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", {
                Player = v38.userFullName
            }), 
            mutedAndBlockedTitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockPlayer", {
                DisplayName = v38.userFullName
            }), 
            mutedSubtitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutedSubtitleText", {
                Player = v38.userFullName
            }), 
            blockedSubtitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockedSubtitleText", {
                Player = v38.userFullName
            }), 
            mutedAndBlockedSubtitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockWarning", {
                Player = v38.userFullName
            }), 
            cancelText = v8:FormatByKey("InGame.InspectMenu.Action.Cancel"), 
            confirmText = v8:FormatByKey("InGame.InspectMenu.Action.Confirm"), 
            isMuted = v38.state.muteFlipped, 
            isBlocked = v38.state.blockFlipped, 
            onCancelActivated = v38.onYesOrNoCancel, 
            onConfirmActivated = v38.onYesOrNoConfirmation, 
            uiScale = v41, 
            ZIndex = v38.props.ZIndex
        });
        local v47 = nil;
        if l_currentPage_0 == v14.SelectActions then
            return v45;
        else
            if l_currentPage_0 == v14.ConfirmAction then
                v47 = v46;
            end;
            return v47;
        end;
    end);
end;
return v15;