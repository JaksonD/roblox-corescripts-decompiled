local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_UserService_0 = game:GetService("UserService");
local l_getMessageText_0 = require(l_CorePackages_0.Workspace.Packages.ChatLineReporting).Helpers.getMessageText;
local v5 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return {
    componentType = "chatModalSelector", 
    getIsVisible = function(v7) --[[ Line: 19 ]] --[[ Name: getIsVisible ]]
        -- upvalues: v5 (copy)
        return v7.methodOfAbuse == v5.AbuseMethods.TextChat;
    end, 
    getSelectedValue = function(v8) --[[ Line: 27 ]] --[[ Name: getSelectedValue ]]
        -- upvalues: l_getMessageText_0 (copy)
        return v8.selectedMessage and l_getMessageText_0(v8.selectedMessage.useTranslation, v8.selectedMessage.translation, v8.selectedMessage.text) or nil;
    end, 
    onUpdateSelectedOption = function(v9, v10, v11, v12, v13) --[[ Line: 42 ]] --[[ Name: onUpdateSelectedOption ]]
        -- upvalues: v5 (copy), l_Players_0 (copy), l_UserService_0 (copy)
        v13.analyticsDispatch({
            type = v5.AnalyticsActions.IncrementChatLineChanged
        });
        v12({
            type = v5.PlayerMenuActions.UpdatedSelectedChatAndOrderedMessages, 
            orderedMessages = v10, 
            selectedMessage = v9
        });
        if v11.allegedAbuserId ~= nil then
            if v9 == nil or v9.userId == nil then
                v12({
                    type = v5.PlayerMenuActions.UpdateAbuser, 
                    abuseId = nil, 
                    abuser = nil
                });
                return;
            else
                local v14 = tonumber(v9.userId);
                if v14 ~= nil then
                    task.defer(function() --[[ Line: 73 ]]
                        -- upvalues: l_Players_0 (ref), v14 (copy), l_UserService_0 (ref), v12 (copy), v5 (ref), v9 (copy)
                        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v14);
                        if l_l_Players_0_PlayerByUserId_0 == nil then
                            local v16 = false;
                            local v17 = nil;
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 80 ]]
                                -- upvalues: l_UserService_0 (ref), v14 (ref)
                                return l_UserService_0:GetUserInfosByUserIdsAsync({
                                    v14
                                });
                            end);
                            v16 = l_status_0;
                            v17 = l_result_0;
                            if v16 and v17 and v17[1] then
                                l_l_Players_0_PlayerByUserId_0 = {
                                    Name = v17[1].Username, 
                                    DisplayName = v17[1].DisplayName
                                };
                            end;
                        end;
                        if l_l_Players_0_PlayerByUserId_0 ~= nil then
                            v12({
                                type = v5.PlayerMenuActions.UpdateAbuser, 
                                abuseId = v9.userId, 
                                abuser = l_l_Players_0_PlayerByUserId_0
                            });
                        end;
                    end);
                end;
            end;
        end;
    end, 
    fieldLabel = "WhichChat", 
    componentName = "ChatSelector"
};