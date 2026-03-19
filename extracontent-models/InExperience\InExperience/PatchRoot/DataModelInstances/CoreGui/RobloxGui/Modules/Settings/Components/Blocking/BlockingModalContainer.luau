local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v5 = require(l_Modules_0.isNewInGameMenuEnabled);
local l_Toast_0 = require(l_CorePackages_0.Packages.UIBlox).App.Dialog.Toast;
local v7 = require(script.Parent.ActionModal);
return function(v8) --[[ Line: 30 ]] --[[ Name: BlockingModalContainer ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), l_Modules_0 (copy), l_useLocalization_0 (copy), l_Toast_0 (copy), v7 (copy)
    local l_player_0 = v8.player;
    local l_closeModal_0 = v8.closeModal;
    local v11 = v8.blockingUtility or v4;
    local l_analytics_0 = v8.analytics;
    local l_source_0 = v8.source;
    local l_onBlockingSuccess_0 = v8.onBlockingSuccess;
    local v15, v16 = v2.useState(Vector2.new(1000, 1000));
    local v17, v18 = v2.useState(false);
    local v19 = v2.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v11 (copy), l_player_0 (copy), l_analytics_0 (copy), l_source_0 (copy), l_onBlockingSuccess_0 (copy), l_closeModal_0 (copy), v18 (copy)
        if v11:BlockPlayerAsync(l_player_0) then
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
            v18(true);
            return;
        end;
    end, {
        l_closeModal_0, 
        l_player_0, 
        l_analytics_0, 
        l_source_0, 
        l_onBlockingSuccess_0
    });
    local v21 = v2.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v19 (copy), l_source_0 (copy), v5 (ref), l_Modules_0 (ref), l_player_0 (copy)
        v19();
        local v20 = l_source_0 or "BlockingModal";
        if v5() then
            require(l_Modules_0.InGameMenuInit).openReportDialog(l_player_0, v20);
            return;
        else
            require(l_Modules_0.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(l_player_0, v20);
            return;
        end;
    end, {
        v19, 
        l_player_0, 
        l_source_0
    });
    local v22 = l_useLocalization_0({
        titleKey = {
            "Feature.BlockingModal.Heading.BlockUser"; 
            DisplayName = l_player_0.DisplayName
        }, 
        bodyKey = "Feature.BlockingModal.Message.BlockConfirmation", 
        cancelTextKey = "Feature.BlockingModal.Action.Cancel", 
        blockTextKey = "Feature.BlockingModal.Action.Block", 
        blockAndReportTextKey = "Feature.BlockingModal.Action.BlockAndReport", 
        blockingFailed = "Feature.Toast.NetworkingError.SomethingIsWrong"
    });
    if v17 then
        return v2.createElement(l_Toast_0, {
            duration = 3, 
            show = v17, 
            toastContent = {
                toastTitle = v22.blockingFailed, 
                onDismissed = l_closeModal_0
            }
        });
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            [v2.Change.AbsoluteSize] = function(v23) --[[ Line: 100 ]]
                -- upvalues: v16 (copy)
                v16(v23.AbsoluteSize);
            end
        }, {
            BlockingModal = v2.createElement(v7, {
                screenSize = v15, 
                title = v22.titleKey, 
                body = v22.bodyKey, 
                blockText = v22.blockTextKey, 
                blockAndReportText = v22.blockAndReportTextKey, 
                cancelText = v22.cancelTextKey, 
                cancel = l_closeModal_0, 
                block = v19, 
                blockAndReport = v21
            })
        });
    end;
end;