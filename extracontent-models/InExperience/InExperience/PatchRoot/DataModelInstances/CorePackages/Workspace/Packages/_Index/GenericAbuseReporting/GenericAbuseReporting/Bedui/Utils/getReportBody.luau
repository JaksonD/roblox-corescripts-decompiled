local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v4 = require(l_script_FirstAncestor_0.Enums.AbuseCategory);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
return function(v6) --[[ Line: 28 ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v7 = {};
    v2.forEach(v6.additionalReportTags or {}, function(v8) --[[ Line: 38 ]]
        -- upvalues: v7 (copy)
        if not v8.tagKey or v8.tagKey == "" or not v8.tagValue or v8.tagValue == "" then
            return;
        elseif v7[v8.tagKey] ~= nil then
            local v9 = v7[v8.tagKey];
            v7[v8.tagKey] = v9 .. "," .. v8.tagValue;
            return;
        else
            v7[v8.tagKey] = v8.tagValue;
            return;
        end;
    end);
    return {
        abuseVector = v6.abuseVector, 
        category = v6.formData.abuse_category or v4.ABUSE_CATEGORY_INVALID, 
        comment = v6.formData.free_comment or "", 
        submitterId = v6.localPlayerUserId, 
        targetIdStr = v6.targetIdStr, 
        targetType = v6.abuseVector, 
        custom = if next(v7) ~= nil then v7 else nil
    };
end;