local l_Parent_0 = script:FindFirstAncestor("AppStoreAgeSignalsManager").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = game:DefineFastFlag("EnableAppAgeSignalsService", false);
return {
    isAvailable = function() --[[ Line: 9 ]] --[[ Name: isAvailable ]]
        -- upvalues: v2 (copy)
        if not v2 then
            return false;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
                return game:GetService("AppAgeSignalsService");
            end);
            if not l_status_0 or not l_result_0 then
                return false;
            else
                return l_result_0:IsAvailable();
            end;
        end;
    end, 
    getAppAgeSignalsAsync = function() --[[ Line: 21 ]] --[[ Name: getAppAgeSignalsAsync ]]
        -- upvalues: v1 (copy)
        return v1.new(function(v5, v6) --[[ Line: 22 ]]
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 23 ]]
                return game:GetService("AppAgeSignalsService"):GetAppAgeSignalsAsync();
            end);
            if not l_status_1 then
                v6(l_result_1);
                return;
            elseif l_result_1.Error and l_result_1.Error ~= "" then
                v6(l_result_1.Error);
                return;
            else
                v5(l_result_1.PlatformPayload);
                return;
            end;
        end);
    end
};