local l_SessionService_0 = game:GetService("SessionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.UnifiedEventLogConstants);
local v5 = require(l_script_FirstAncestor_0.Utils.UnifiedEventLoggingUtils);
local v6 = require(script.Parent.sendUnifiedEventLog);
local l_isRunningInStudio_0 = require(l_Parent_0.AppCommonLib).isRunningInStudio;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents;
local v9 = require(script.Parent.AXUnifiedEventFilter);
return function(v10, v11, v12) --[[ Line: 22 ]]
    -- upvalues: l_SessionService_0 (copy), v4 (copy), l_isRunningInStudio_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), v5 (copy), v3 (copy), v9 (copy), v6 (copy)
    if l_SessionService_0:GetSessionTag("level2a") ~= v10:GetAttribute(v4.SESSION_TAG_NAME) and not l_isRunningInStudio_0() then
        return;
    else
        local v13 = v12 or {};
        local v14 = {};
        local l_v10_Attributes_0 = v10:GetAttributes();
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
            v14 = v5.getFieldsToSendFromInstanceAttributes(l_v10_Attributes_0);
        else
            for v16, v17 in l_v10_Attributes_0 do
                if v5.isUnifiedLoggingAttribute(v16) then
                    v14[v5.getUnifiedLoggingFieldName(v16)] = v17;
                end;
            end;
        end;
        if v13.includeScreenSize then
            v14 = v3.Dictionary.join(v14, v5.getScreenSize(v10));
        end;
        if v13.includeElementSizeAndPosition then
            v14 = v3.Dictionary.join(v14, v5.getElementSizeAndPosition(v10));
        end;
        local v18 = v3.Dictionary.join(v14, v11);
        v9.filter(v18);
        v6(v18);
        return;
    end;
end;