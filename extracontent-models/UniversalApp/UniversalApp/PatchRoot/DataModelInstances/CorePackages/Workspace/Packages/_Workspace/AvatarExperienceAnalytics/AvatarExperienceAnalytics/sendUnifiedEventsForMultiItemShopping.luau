local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.UnifiedEventLogConstants);
local v4 = require(l_script_FirstAncestor_0.Utils.UnifiedEventLoggingUtils);
local v5 = require(script.Parent.sendUnifiedEventLog);
local v6 = require(script.Parent.Store.UnifiedSelectionListStore);
return function(v7) --[[ Line: 10 ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy), v2 (copy), v5 (copy)
    local v8 = v6.getSelectionList();
    local v9 = v3.ATTRIBUTE_PREFIX .. "itemId";
    local v10 = v3.ATTRIBUTE_PREFIX .. "itemType";
    for _, v12 in v7 do
        local v13 = nil;
        for _, v15 in v8 do
            if tostring(v15[v9]) == tostring(v12.itemId) and tostring(v15[v10]) == tostring(v12.itemType) then
                v13 = v15;
                break;
            end;
        end;
        local v16 = v4.getFieldsToSendFromInstanceAttributes(v13);
        local v17 = v2.Dictionary.join(v16, v12);
        v5(v17);
    end;
end;