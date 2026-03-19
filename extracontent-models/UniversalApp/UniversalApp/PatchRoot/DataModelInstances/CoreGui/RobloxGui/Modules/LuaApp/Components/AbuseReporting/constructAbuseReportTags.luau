local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local function v8(v2) --[[ Line: 4 ]] --[[ Name: getAbuseCategoryValueList ]]
    local v3 = {};
    for _, v5 in v2 do
        for _, v7 in v5.tagValues do
            table.insert(v3, {
                data = v7
            });
        end;
    end;
    return v3;
end;
local v19 = {
    Item = function(v9) --[[ Line: 16 ]] --[[ Name: constructItemReportTags ]]
        local v10 = {};
        if v9.assetTypeName and v9.itemId then
            v10.REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v9.assetTypeName
                    }
                }
            };
            v10.REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v9.itemId
                    }
                }
            };
        end;
        return v10;
    end, 
    Chat = function(v11) --[[ Line: 52 ]] --[[ Name: constructChatReportTags ]]
        -- upvalues: v1 (copy)
        local v12 = {
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v1.ABUSE_VECTOR.UserProfile
                    }
                }
            }
        };
        if v11.userId then
            v12.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v11.userId
                    }
                }
            };
        end;
        return v12;
    end, 
    Profile = function(v13) --[[ Line: 34 ]] --[[ Name: constructProfileReportTags ]]
        -- upvalues: v1 (copy)
        local v14 = {
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v1.ABUSE_VECTOR.UserProfile
                    }
                }
            }
        };
        if v13.profileUserId then
            v14.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v13.profileUserId
                    }
                }
            };
        end;
        return v14;
    end, 
    ExperienceDetails = function(v15) --[[ Line: 70 ]] --[[ Name: constructExperienceReportTags ]]
        -- upvalues: v1 (copy)
        local v16 = {};
        if v15.rootPlaceId then
            v16.REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v1.ABUSE_VECTOR.Place
                    }
                }
            };
            v16.REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v15.rootPlaceId
                    }
                }
            };
        end;
        return v16;
    end, 
    Notification = function(v17) --[[ Line: 89 ]] --[[ Name: constructNotificationReportTags ]]
        -- upvalues: v1 (copy)
        local v18 = {
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v1.ABUSE_VECTOR.Notification
                    }
                }
            }
        };
        if v17.submitterUserId then
            v18.SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = v17.submitterUserId
                    }
                }
            };
        end;
        if v17.assetId then
            v18.NOTIFICATION_ID = {
                valueList = {
                    {
                        data = v17.assetId
                    }
                }
            };
        end;
        return v18;
    end
};
return function(v20, v21, v22) --[[ Line: 124 ]] --[[ Name: constructAbuseReportTags ]]
    -- upvalues: v8 (copy), v19 (copy)
    local v23 = v8(v20);
    local v24 = {
        ENTRY_POINT = {
            valueList = {
                {
                    data = v22
                }
            }
        }, 
        REPORTED_ABUSE_CATEGORY = {
            valueList = v23
        }
    };
    local v25 = v19[v21.reportEntryPoint];
    local v26 = if v25 then v25(v21) else {};
    for v27, v28 in v26 do
        v24[v27] = v28;
    end;
    return v24;
end;