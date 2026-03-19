local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_script_FirstAncestor_0.Components.Constants);
local v5 = require(l_script_FirstAncestor_0.Utility.getAvailableMethodsOfAbuse);
local v6 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v9 = require(l_CorePackages_0.Packages.Cryo);
return {
    componentType = "modalSelector", 
    getIsVisible = function(v10) --[[ Line: 15 ]] --[[ Name: getIsVisible ]]
        -- upvalues: v6 (copy)
        return v10.isVoiceEnabled or v6.getReportAnythingAvatarEnabled();
    end, 
    getMenuItems = function(v11) --[[ Line: 18 ]] --[[ Name: getMenuItems ]]
        -- upvalues: v9 (copy), l_default_0 (copy), v5 (copy), v6 (copy)
        local v12 = v11.isVoiceEnabled and not v9.isEmpty(l_default_0:getRecentUsersInteractionData());
        return v5(v12, v6.getReportAnythingAvatarEnabled());
    end, 
    getSelectedValue = function(v13) --[[ Line: 24 ]] --[[ Name: getSelectedValue ]]
        return v13.methodOfAbuse;
    end, 
    onUpdateSelectedOption = function(v14, v15, v16, v17) --[[ Line: 27 ]] --[[ Name: onUpdateSelectedOption ]]
        -- upvalues: v4 (copy)
        v16({
            type = v4.PlayerMenuActions.UpdateMethodOfAbuse, 
            methodOfAbuse = v14.identifier
        });
        if v14.identifier ~= v15.methodOfAbuse then
            v17.reportAnythingDispatch({
                type = v4.ReportAnythingActions.ClearAnnotationFlowProperties
            });
            v17.analyticsDispatch({
                type = v4.AnalyticsActions.IncrementTypeofabuseChanged
            });
            v17.analyticsDispatch({
                type = v4.AnalyticsActions.SetTypeOfAbuseSelection, 
                selection = v14.identifier
            });
        end;
    end, 
    fieldLabel = "MethodOfAbuse", 
    componentName = "MethodOfAbuse"
};