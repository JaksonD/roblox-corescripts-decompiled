local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v5 = require(l_Modules_0.isNewInGameMenuEnabled);
local l_Toast_0 = require(l_CorePackages_0.Packages.UIBlox).App.Dialog.Toast;
local v7 = require(script.Parent.ActionModal);
local l_FFlagConnectionsToFriendsRename_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename;
return function(v9) --[[ Line: 33 ]] --[[ Name: BlockingModalContainer ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), l_Modules_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_Toast_0 (copy), v7 (copy)
    local l_player_0 = v9.player;
    local l_closeModal_0 = v9.closeModal;
    local v12 = v9.blockingUtility or v4;
    local l_analytics_0 = v9.analytics;
    local l_source_0 = v9.source;
    local l_onBlockingSuccess_0 = v9.onBlockingSuccess;
    local v16, v17 = v2.useState(Vector2.new(1000, 1000));
    local v18, v19 = v2.useState(false);
    local v20 = v2.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v12 (copy), l_player_0 (copy), l_analytics_0 (copy), l_source_0 (copy), l_onBlockingSuccess_0 (copy), l_closeModal_0 (copy), v19 (copy)
        if v12:BlockPlayerAsync(l_player_0) then
            l_analytics_0:action("SettingsHub", "blockUser", {
                blockeeUserId = l_player_0.UserId, 
                source = l_source_0
            });
            if l_onBlockingSuccess_0 then
                l_onBlockingSuccess_0();
            end;
            l_closeModal_0();
            return;
        else
            v19(true);
            return;
        end;
    end, {
        l_closeModal_0, 
        l_player_0, 
        l_analytics_0, 
        l_source_0, 
        l_onBlockingSuccess_0
    });
    local v22 = v2.useCallback(function() --[[ Line: 62 ]]
        -- upvalues: v20 (copy), l_source_0 (copy), v5 (ref), l_Modules_0 (ref), l_player_0 (copy)
        v20();
        local v21 = l_source_0 or "BlockingModal";
        if v5() then
            require(l_Modules_0.InGameMenuInit).openReportDialog(l_player_0, v21);
            return;
        else
            require(l_Modules_0.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(l_player_0, v21);
            return;
        end;
    end, {
        v20, 
        l_player_0, 
        l_source_0
    });
    local v23 = l_useLocalization_0({
        titleKey = {
            "Feature.BlockingModal.Heading.BlockUser"; 
            DisplayName = l_player_0.DisplayName
        }, 
        bodyKey = l_FFlagConnectionsToFriendsRename_0 and "Feature.BlockingModal.Message.BlockConfirmation.FriendsRename" or "Feature.BlockingModal.Message.BlockConfirmation", 
        cancelTextKey = "Feature.BlockingModal.Action.Cancel", 
        blockTextKey = "Feature.BlockingModal.Action.Block", 
        blockAndReportTextKey = "Feature.BlockingModal.Action.BlockAndReport", 
        blockingFailed = "Feature.Toast.NetworkingError.SomethingIsWrong"
    });
    if v18 then
        return v2.createElement(l_Toast_0, {
            duration = 3, 
            show = v18, 
            toastContent = {
                toastTitle = v23.blockingFailed, 
                onDismissed = l_closeModal_0
            }
        });
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            [v2.Change.AbsoluteSize] = function(v24) --[[ Line: 105 ]]
                -- upvalues: v17 (copy)
                v17(v24.AbsoluteSize);
            end
        }, {
            BlockingModal = v2.createElement(v7, {
                screenSize = v16, 
                title = v23.titleKey, 
                body = v23.bodyKey, 
                blockText = v23.blockTextKey, 
                blockAndReportText = v23.blockAndReportTextKey, 
                cancelText = v23.cancelTextKey, 
                cancel = l_closeModal_0, 
                block = v20, 
                blockAndReport = v22
            })
        });
    end;
end;