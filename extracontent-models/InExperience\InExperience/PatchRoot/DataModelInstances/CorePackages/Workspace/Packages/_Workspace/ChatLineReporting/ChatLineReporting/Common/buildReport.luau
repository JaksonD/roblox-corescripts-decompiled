local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local v1 = require(l_script_FirstAncestor_0.Flags.FFlagChatLineReportingMessageIdEnabled);
local v2 = {
    Variant = {
        CLRv1 = "CLRv1"
    }
};
buildReport = function(v3, v4, v5, v6, v7) --[[ Line: 10 ]] --[[ Name: buildReport ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v8 = {
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
                        data = tostring(v3)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v5
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v6
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
                        data = v4
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v2.Variant.CLRv1
                    }
                }
            }
        }
    };
    if v1 and v7 then
        v8.tags.REPORT_TARGET_MESSAGE_ID = {
            valueList = {
                {
                    data = v7
                }
            }
        };
    end;
    return v8;
end;
return buildReport;