local l_SessionService_0 = game:GetService("SessionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.UnifiedEventLogConstants);
local v5 = require(l_script_FirstAncestor_0.Utils.UnifiedEventLoggingUtils);
local v6 = require(script.Parent.sendUnifiedEventLog);
local l_isRunningInStudio_0 = require(l_Parent_0.AppCommonLib).isRunningInStudio;
local v8 = require(script.Parent.AXUnifiedEventFilter);
return function(v9, v10, v11) --[[ Line: 19 ]]
    -- upvalues: l_SessionService_0 (copy), v4 (copy), l_isRunningInStudio_0 (copy), v5 (copy), v3 (copy), v8 (copy), v6 (copy)
    if l_SessionService_0:GetSessionTag("level2a") ~= v9:GetAttribute(v4.SESSION_TAG_NAME) and not l_isRunningInStudio_0() then
        return;
    else
        local v12 = v11 or {};
        local v13 = {};
        for v14, v15 in (v9:GetAttributes()) do
            if v5.isUnifiedLoggingAttribute(v14) then
                v13[v5.getUnifiedLoggingFieldName(v14)] = v15;
            end;
        end;
        if v12.includeScreenSize then
            v13 = v3.Dictionary.join(v13, v5.getScreenSize(v9));
        end;
        if v12.includeElementSizeAndPosition then
            v13 = v3.Dictionary.join(v13, v5.getElementSizeAndPosition(v9));
        end;
        local v16 = v3.Dictionary.join(v13, v10);
        v8.filter(v16);
        v6(v16);
        return;
    end;
end;