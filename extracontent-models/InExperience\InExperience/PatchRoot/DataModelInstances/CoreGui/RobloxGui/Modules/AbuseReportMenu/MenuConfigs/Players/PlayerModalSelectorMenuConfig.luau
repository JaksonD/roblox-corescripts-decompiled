local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v4 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.Constants);
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local v8 = require(l_script_FirstAncestor_0.Flags.GetFFlagAbuseReportShouldUseCanDisplayPeoplesUsernamesAppPolicy);
local l_FFlagInGameMenuAddChatLineReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting;
return {
    componentType = "modalSelector", 
    getIsVisible = function(_) --[[ Line: 17 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    getMenuItems = function(v11) --[[ Line: 20 ]] --[[ Name: getMenuItems ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy), v8 (copy), l_InExperienceCapabilities_0 (copy)
        return (v2.List.map(v11.playerObjects, function(v12) --[[ Line: 21 ]]
            -- upvalues: v4 (ref), v3 (ref), v8 (ref), l_InExperienceCapabilities_0 (ref)
            local v13 = if v4.Utils.isPlayerVerified(v12) then v3.emoji.verified else "";
            if v8() then
                return {
                    label = v12.DisplayName .. v13, 
                    subLabel = if l_InExperienceCapabilities_0.canDisplayPeoplesUsernames then "[@" .. v12.Name .. "]" else nil, 
                    identifier = v12.Name
                };
            else
                return {
                    label = v12.DisplayName .. v13, 
                    subLabel = "[@" .. v12.Name .. "]", 
                    identifier = v12.Name
                };
            end;
        end));
    end, 
    getSelectedValue = function(v14) --[[ Line: 43 ]] --[[ Name: getSelectedValue ]]
        -- upvalues: v8 (copy), l_InExperienceCapabilities_0 (copy)
        local l_allegedAbuser_0 = v14.allegedAbuser;
        if l_allegedAbuser_0 then
            local l_DisplayName_0 = l_allegedAbuser_0.DisplayName;
            local l_Name_0 = l_allegedAbuser_0.Name;
            local v18 = l_DisplayName_0 .. "[@" .. l_Name_0 .. "]";
            if v8() then
                v18 = l_DisplayName_0 .. if l_InExperienceCapabilities_0.canDisplayPeoplesUsernames then "[@" .. l_Name_0 .. "]" else "";
            end;
            return v18;
        else
            return nil;
        end;
    end, 
    onUpdateSelectedOption = function(v19, v20, v21, v22) --[[ Line: 57 ]] --[[ Name: onUpdateSelectedOption ]]
        -- upvalues: v6 (copy), l_FFlagInGameMenuAddChatLineReporting_0 (copy)
        if v19.identifier then
            local l_identifier_0 = v19.identifier;
            for _, v25 in v20.playerObjects do
                if l_identifier_0 == v25.Name then
                    local l_UserId_0 = v25.UserId;
                    v22.analyticsDispatch({
                        type = v6.AnalyticsActions.IncrementPersonChanged
                    });
                    v21({
                        type = v6.PlayerMenuActions.UpdateAbuser, 
                        abuseId = l_UserId_0, 
                        abuser = v25
                    });
                    if l_FFlagInGameMenuAddChatLineReporting_0 then
                        v21({
                            type = v6.PlayerMenuActions.UpdatedSelectedChatAndOrderedMessages, 
                            orderedMessages = {}, 
                            selectedMessage = nil
                        });
                    end;
                end;
            end;
        end;
    end, 
    fieldLabel = "WhichPerson", 
    componentName = "PlayerSelector"
};