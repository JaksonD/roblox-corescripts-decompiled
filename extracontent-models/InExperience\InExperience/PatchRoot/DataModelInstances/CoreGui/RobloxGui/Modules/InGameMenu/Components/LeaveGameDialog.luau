local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Localization.withLocalization);
local v8 = require(l_Parent_0.Actions.CancelLeavingGame);
local v9 = require(l_Parent_0.GlobalConfig);
local v10 = require(script.Parent.ConfirmationDialog);
local v11 = require(l_Parent_0.Resources.Constants);
local v12 = require(l_Parent_0.Utility.SendAnalytics);
local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
local v14 = l_t_0.strictInterface({
    isLeavingGame = l_t_0.boolean, 
    onCancel = l_t_0.callback, 
    sendAnalytics = l_t_0.callback
});
return l_RoactRodux_0.UNSTABLE_connect2(function(v15, _) --[[ Line: 69 ]]
    return {
        isLeavingGame = v15.leavingGame
    };
end, function(v17) --[[ Line: 73 ]]
    -- upvalues: v8 (copy), v12 (copy), v11 (copy)
    return {
        onCancel = function() --[[ Line: 75 ]] --[[ Name: onCancel ]]
            -- upvalues: v17 (copy), v8 (ref), v12 (ref), v11 (ref)
            v17(v8());
            v12(v11.AnalyticsInGameMenuName, v11.AnalyticsLeaveGameName, {
                confirmed = v11.AnalyticsCancelledName
            });
        end
    };
end)(function(v18) --[[ Line: 31 ]] --[[ Name: LeaveGameDialog ]]
    -- upvalues: v9 (copy), v14 (copy), v7 (copy), l_Roact_0 (copy), v10 (copy), v12 (copy), v11 (copy), l_RunService_0 (copy), l_GetDefaultQualityLevel_0 (copy)
    if v9.propValidation then
        assert(v14(v18));
    end;
    return v7({
        bodyText = "CoreScripts.InGameMenu.ConfirmLeaveGame", 
        confirmText = "CoreScripts.InGameMenu.Leave", 
        titleText = "CoreScripts.InGameMenu.LeaveGameQuestion", 
        cancelText = "CoreScripts.InGameMenu.Cancel"
    })(function(v19) --[[ Line: 41 ]]
        -- upvalues: l_Roact_0 (ref), v10 (ref), v18 (copy), v12 (ref), v11 (ref), l_RunService_0 (ref), l_GetDefaultQualityLevel_0 (ref)
        return l_Roact_0.createElement(v10, {
            bodyText = v19.bodyText, 
            confirmText = v19.confirmText, 
            titleText = v19.titleText, 
            cancelText = v19.cancelText, 
            bindReturnToConfirm = true, 
            onCancel = v18.onCancel, 
            onConfirm = function() --[[ Line: 51 ]] --[[ Name: onConfirm ]]
                -- upvalues: v12 (ref), v11 (ref), l_RunService_0 (ref), l_GetDefaultQualityLevel_0 (ref)
                v12(v11.AnalyticsInGameMenuName, v11.AnalyticsLeaveGameName, {
                    confirmed = v11.AnalyticsConfirmedName
                });
                l_RunService_0.Heartbeat:Wait();
                game:Shutdown();
                settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
            end, 
            blurBackground = true, 
            visible = v18.isLeavingGame
        });
    end);
end);