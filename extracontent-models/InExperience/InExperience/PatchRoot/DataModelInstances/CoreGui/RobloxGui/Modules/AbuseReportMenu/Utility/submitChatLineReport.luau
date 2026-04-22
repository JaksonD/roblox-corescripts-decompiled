local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_isSystemMessage_0 = require(l_CorePackages_0.Workspace.Packages.ChatLineReporting).Helpers.isSystemMessage;
local l_FFlagEnableGlobalChatAbuseReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableGlobalChatAbuseReporting;
local v5 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v13(v7, v8, v9, v10, v11) --[[ Line: 15 ]] --[[ Name: buildReportTags ]]
    -- upvalues: v5 (copy)
    local v12 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = "in-experience"
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = tostring(v7)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v9
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v10
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = "chat"
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v8
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v5.ChatLineReportingVariant.IGM_CLRv1
                    }
                }
            }
        }
    };
    if v11 then
        v12.tags.REPORT_TARGET_MESSAGE_ID = {
            valueList = {
                {
                    data = v11
                }
            }
        };
    end;
    return v12;
end;
return function(v14) --[[ Line: 87 ]]
    -- upvalues: v13 (copy), l_FFlagEnableGlobalChatAbuseReporting_0 (copy), l_isSystemMessage_0 (copy), l_Players_0 (copy)
    local v15 = v13(v14.localPlayerUserId, v14.reportTargetUser, v14.abuseReason, v14.abuseDescription, v14.selectedMessage.messageId);
    local v16 = {};
    for _, v18 in ipairs(v14.orderedMessages) do
        local v19 = false;
        if v18.userId ~= nil then
            v19 = true;
            if v18.textChannel == nil then
                v19 = l_FFlagEnableGlobalChatAbuseReporting_0;
            end;
        end;
        if v19 then
            local v20 = {
                channel = v18.textChannel, 
                messageId = v18.messageId
            };
            if not l_isSystemMessage_0({
                userId = v18.userId, 
                textChannel = v18.textChannel
            }) then
                table.insert(v16, v20);
            end;
        end;
    end;
    local v21 = {
        {
            channel = v14.selectedMessage.textChannel, 
            messageId = v14.selectedMessage.messageId
        }
    };
    task.defer(function() --[[ Line: 123 ]]
        -- upvalues: l_Players_0 (ref), v16 (copy), v21 (copy), v15 (copy)
        l_Players_0:ReportChatAbuse(v16, v21, v15);
    end);
end;