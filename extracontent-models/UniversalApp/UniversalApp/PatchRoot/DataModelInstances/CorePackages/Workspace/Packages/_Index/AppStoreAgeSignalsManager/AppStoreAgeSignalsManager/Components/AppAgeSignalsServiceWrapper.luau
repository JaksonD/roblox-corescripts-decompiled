local l_Parent_0 = script:FindFirstAncestor("AppStoreAgeSignalsManager").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = game:DefineFastFlag("EnableAppAgeSignalsService", false);
return {
    isAvailable = function() --[[ Line: 9 ]] --[[ Name: isAvailable ]]
        -- upvalues: v2 (copy)
        return v2;
    end, 
    getAppStoreAgeSignalsAsync = function() --[[ Line: 13 ]] --[[ Name: getAppStoreAgeSignalsAsync ]]
        -- upvalues: v1 (copy)
        return v1.new(function(v3, v4) --[[ Line: 14 ]]
            -- upvalues: v1 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
                -- upvalues: v1 (ref)
                return v1.reject("AppAgeSignalsService is not available");
            end);
            if not l_status_0 then
                v4(l_result_0);
                return;
            else
                v3(l_result_0);
                return;
            end;
        end);
    end
};