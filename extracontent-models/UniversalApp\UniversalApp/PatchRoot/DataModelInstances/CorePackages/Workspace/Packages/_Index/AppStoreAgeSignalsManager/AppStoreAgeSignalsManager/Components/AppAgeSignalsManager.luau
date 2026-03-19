local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppStoreAgeSignalsManager");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(script.Parent.AppAgeSignalsServiceWrapper);
local v4 = require(l_script_FirstAncestor_0.Utils.AppStoreAgeSignalsProvider);
return {
    requestAppAgeSignals = function() --[[ Line: 9 ]] --[[ Name: requestAppAgeSignals ]]
        -- upvalues: v3 (copy), v2 (copy), v4 (copy)
        if not v3.isAvailable() then
            return v2.reject("AppAgeSignalsService is not available");
        else
            return v4.checkEligibility():andThen(function(v5) --[[ Line: 14 ]]
                -- upvalues: v2 (ref), v3 (ref), v4 (ref)
                if not v5.eligible then
                    return v2.reject("User is not eligible for app age signals");
                else
                    return v3.getAppStoreAgeSignalsAsync():andThen(function(v6) --[[ Line: 20 ]]
                        -- upvalues: v4 (ref), v5 (copy)
                        return v4.publishResult(v5.signalSource, v6, "Complete");
                    end):catch(function(v7) --[[ Line: 23 ]]
                        -- upvalues: v4 (ref), v5 (copy), v2 (ref)
                        v4.publishResult(v5.signalSource, "", "Error");
                        return v2.reject(v7);
                    end);
                end;
            end);
        end;
    end
};