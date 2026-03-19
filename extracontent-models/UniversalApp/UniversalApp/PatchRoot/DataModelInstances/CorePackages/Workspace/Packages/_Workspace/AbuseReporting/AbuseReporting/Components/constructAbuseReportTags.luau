local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v4 = {
    UserProfile = "user_profile", 
    Place = "place"
};
local v5 = {
    Experience = "experience", 
    Profile = "profile", 
    Item = "item"
};
local v6 = {
    AssetId = "REPORT_TARGET_ASSET_ID", 
    UserId = "REPORT_TARGET_USER_ID"
};
local function v13(v7) --[[ Line: 38 ]] --[[ Name: getAbuseCategoryValueList ]]
    local v8 = {};
    for _, v10 in v7 do
        if v10.tagValues then
            for _, v12 in v10.tagValues do
                table.insert(v8, {
                    data = v12
                });
            end;
        end;
    end;
    return v8;
end;
local function _(v14) --[[ Line: 51 ]] --[[ Name: constructTags ]]
    -- upvalues: v5 (copy), v4 (copy)
    return function(v15) --[[ Line: 52 ]]
        -- upvalues: v5 (ref), v4 (ref), v14 (copy)
        return {
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = if v15.context == v5.Experience then v4.Place else if v15.context == v5.Profile then v4.UserProfile else v15.reportAbuseVector
                    }
                }
            }, 
            [v14] = {
                valueList = {
                    {
                        data = v15.assetId
                    }
                }
            }
        };
    end;
end;
local v17 = {};
local l_AssetId_0 = v6.AssetId;
local l_l_AssetId_0_0 = l_AssetId_0 --[[ copy: 11 -> 12 ]];
v17.item = function(v20) --[[ Line: 52 ]]
    -- upvalues: v5 (copy), v4 (copy), l_l_AssetId_0_0 (copy)
    return {
        REPORTED_ABUSE_VECTOR = {
            valueList = {
                {
                    data = if v20.context == v5.Experience then v4.Place else if v20.context == v5.Profile then v4.UserProfile else v20.reportAbuseVector
                }
            }
        }, 
        [l_l_AssetId_0_0] = {
            valueList = {
                {
                    data = v20.assetId
                }
            }
        }
    };
end;
l_AssetId_0 = v6.UserId;
local l_l_AssetId_0_1 = l_AssetId_0 --[[ copy: 11 -> 13 ]];
v17.profile = function(v22) --[[ Line: 52 ]]
    -- upvalues: v5 (copy), v4 (copy), l_l_AssetId_0_1 (copy)
    return {
        REPORTED_ABUSE_VECTOR = {
            valueList = {
                {
                    data = if v22.context == v5.Experience then v4.Place else if v22.context == v5.Profile then v4.UserProfile else v22.reportAbuseVector
                }
            }
        }, 
        [l_l_AssetId_0_1] = {
            valueList = {
                {
                    data = v22.assetId
                }
            }
        }
    };
end;
l_AssetId_0 = v6.AssetId;
v17.experience = function(v23) --[[ Line: 52 ]]
    -- upvalues: v5 (copy), v4 (copy), l_AssetId_0 (copy)
    return {
        REPORTED_ABUSE_VECTOR = {
            valueList = {
                {
                    data = if v23.context == v5.Experience then v4.Place else if v23.context == v5.Profile then v4.UserProfile else v23.reportAbuseVector
                }
            }
        }, 
        [l_AssetId_0] = {
            valueList = {
                {
                    data = v23.assetId
                }
            }
        }
    };
end;
return function(v24, v25) --[[ Line: 80 ]] --[[ Name: constructAbuseReportTags ]]
    -- upvalues: v13 (copy), v17 (copy), v2 (copy)
    local v26 = v13(v24);
    local v27 = {
        ENTRY_POINT = {
            valueList = {
                {
                    data = v25.platform
                }
            }
        }, 
        REPORTED_ABUSE_CATEGORY = {
            valueList = v26
        }
    };
    local v28 = v17[v25.context];
    if v28 then
        local v29 = v28(v25);
        v27 = v2.Dictionary.join(v29, v27);
    end;
    return v27;
end;