local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4, v5) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    return v3(string.format("%sabuse-reporting/v1/safety-event", v2.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            safetyEvent = {
                eventTime = DateTime.now().UnixTimestampMillis, 
                idempotencyKey = "subscriptions/" .. v4 .. "/" .. v5, 
                tags = {
                    SUBMITTER_USER_ID = {
                        valueList = {
                            {
                                data = v5
                            }
                        }
                    }, 
                    ENTRY_POINT = {
                        valueList = {
                            {
                                data = "luaApp"
                            }
                        }
                    }, 
                    REPORTED_ABUSE_CATEGORY = {
                        valueList = {
                            {
                                data = "ABUSE_CATEGORY_OTHER"
                            }
                        }
                    }, 
                    REPORTED_ABUSE_VECTOR = {
                        valueList = {
                            {
                                data = "subscriptions"
                            }
                        }
                    }, 
                    REPORTER_COMMENT = {
                        valueList = {
                            {
                                data = ""
                            }
                        }
                    }, 
                    REPORT_TARGET_ASSET_ID = {
                        valueList = {
                            {
                                data = "0"
                            }
                        }
                    }, 
                    REPORT_TARGET_SUBSCRIPTION_TARGET_KEY = {
                        valueList = {
                            {
                                data = v4
                            }
                        }
                    }
                }
            }
        })
    });
end;