local v0 = require(script.Parent.Parent.NotificationsUpsellConstants);
return {
    getPushUpsellPromptedCount = function(v1, v2) --[[ Line: 5 ]] --[[ Name: getPushUpsellPromptedCount ]]
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
            -- upvalues: v1 (copy), v2 (copy)
            return v1:GetItem(v2);
        end);
        if l_status_0 then
            local v5 = tonumber(l_result_0);
            if v5 ~= nil then
                return v5;
            else
                return 0;
            end;
        else
            return -1;
        end;
    end, 
    getPushSysUpsellPromptTimestamp = function(v6) --[[ Line: 23 ]] --[[ Name: getPushSysUpsellPromptTimestamp ]]
        -- upvalues: v0 (copy)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 24 ]]
            -- upvalues: v6 (copy), v0 (ref)
            return v6:GetItem(v0.LocalStorageKeys.SysPromptShownTimestamp);
        end);
        if l_status_1 then
            local v9 = tonumber(l_result_1);
            if v9 ~= nil then
                return v9;
            else
                return 0;
            end;
        else
            return -1;
        end;
    end, 
    getPushEduUpsellResponseTimestamp = function(v10) --[[ Line: 41 ]] --[[ Name: getPushEduUpsellResponseTimestamp ]]
        -- upvalues: v0 (copy)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 42 ]]
            -- upvalues: v10 (copy), v0 (ref)
            return v10:GetItem(v0.LocalStorageKeys.EduPromptResponseTimestamp);
        end);
        if l_status_2 then
            local v13 = tonumber(l_result_2);
            if v13 ~= nil then
                return v13;
            else
                return 0;
            end;
        else
            return -1;
        end;
    end, 
    incrementPushUpsellPromptedCount = function(v14, v15) --[[ Line: 59 ]] --[[ Name: incrementPushUpsellPromptedCount ]]
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 60 ]]
            -- upvalues: v14 (copy), v15 (copy)
            return v14:GetItem(v15);
        end);
        if l_status_3 then
            local v18 = tonumber(l_result_3) or 0;
            pcall(function() --[[ Line: 66 ]]
                -- upvalues: v14 (copy), v15 (copy), v18 (copy)
                v14:SetItem(v15, (tostring(v18 + 1)));
                v14:Flush();
            end);
        end;
    end, 
    setPushSysUpsellPromptTimestamp = function(v19, v20) --[[ Line: 73 ]] --[[ Name: setPushSysUpsellPromptTimestamp ]]
        -- upvalues: v0 (copy)
        pcall(function() --[[ Line: 74 ]]
            -- upvalues: v19 (copy), v0 (ref), v20 (copy)
            v19:SetItem(v0.LocalStorageKeys.SysPromptShownTimestamp, (tostring(v20)));
            v19:Flush();
        end);
    end, 
    setPushEduUpsellResponseTimestamp = function(v21, v22) --[[ Line: 83 ]] --[[ Name: setPushEduUpsellResponseTimestamp ]]
        -- upvalues: v0 (copy)
        pcall(function() --[[ Line: 84 ]]
            -- upvalues: v21 (copy), v0 (ref), v22 (copy)
            v21:SetItem(v0.LocalStorageKeys.EduPromptResponseTimestamp, (tostring(v22)));
            v21:Flush();
        end);
    end, 
    setPushEduUpsellResponse = function(v23, v24) --[[ Line: 93 ]] --[[ Name: setPushEduUpsellResponse ]]
        -- upvalues: v0 (copy)
        pcall(function() --[[ Line: 94 ]]
            -- upvalues: v23 (copy), v0 (ref), v24 (copy)
            v23:SetItem(v0.LocalStorageKeys.EduPromptResponse, v24);
            v23:Flush();
        end);
    end
};