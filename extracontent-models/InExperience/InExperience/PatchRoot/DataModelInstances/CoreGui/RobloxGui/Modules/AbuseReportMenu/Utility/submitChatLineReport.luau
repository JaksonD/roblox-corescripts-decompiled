local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_isSystemMessage_0 = require(l_CorePackages_0.Workspace.Packages.ChatLineReporting).Helpers.isSystemMessage;
local v4 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v12(v6, v7, v8, v9, v10) --[[ Line: 12 ]] --[[ Name: buildReportTags ]]
    -- upvalues: v4 (copy)
    local v11 = {
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
                        data = tostring(v6)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v8
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v9
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
                        data = v7
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v4.ChatLineReportingVariant.IGM_CLRv1
                    }
                }
            }
        }
    };
    if v10 then
        v11.tags.REPORT_TARGET_MESSAGE_ID = {
            valueList = {
                {
                    data = v10
                }
            }
        };
    end;
    return v11;
end;
return function(v13) --[[ Line: 84 ]]
    -- upvalues: v12 (copy), l_isSystemMessage_0 (copy), l_Players_0 (copy)
    local v14 = v12(v13.localPlayerUserId, v13.reportTargetUser, v13.abuseReason, v13.abuseDescription, v13.selectedMessage.messageId);
    local v15 = {};
    for _, v17 in ipairs(v13.orderedMessages) do
        if v17.userId ~= nil and v17.textChannel ~= nil then
            local v18 = {
                channel = v17.textChannel, 
                messageId = v17.messageId
            };
            if not l_isSystemMessage_0({
                userId = v17.userId, 
                textChannel = v17.textChannel
            }) then
                table.insert(v15, v18);
            end;
        end;
    end;
    local v19 = {
        {
            channel = v13.selectedMessage.textChannel, 
            messageId = v13.selectedMessage.messageId
        }
    };
    task.defer(function() --[[ Line: 119 ]]
        -- upvalues: l_Players_0 (ref), v15 (copy), v19 (copy), v14 (copy)
        l_Players_0:ReportChatAbuse(v15, v19, v14);
    end);
end;