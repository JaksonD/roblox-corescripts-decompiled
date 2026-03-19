local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppStoreAgeSignalsManager");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(script.Parent.AppAgeSignalsServiceWrapper);
local v4 = require(l_script_FirstAncestor_0.Utils.AppStoreAgeSignalsProvider);
local v5 = require(l_script_FirstAncestor_0.Telemetry.AppAgeSignalsTelemetryConfigs);
return {
    requestAppAgeSignals = function() --[[ Line: 10 ]] --[[ Name: requestAppAgeSignals ]]
        -- upvalues: v3 (copy), v2 (copy), v4 (copy), v5 (copy)
        if not v3.isAvailable() then
            return v2.reject("AppAgeSignalsService is not available");
        else
            return v4.checkEligibility():andThen(function(v6) --[[ Line: 15 ]]
                -- upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref)
                if not v6.eligible then
                    return v2.reject("User is not eligible for app age signals");
                else
                    return v3.getAppAgeSignalsAsync():andThen(function(v7) --[[ Line: 21 ]]
                        -- upvalues: v4 (ref), v6 (copy)
                        return v4.publishResult(v6.signalSource, v7, "Complete");
                    end):catch(function(v8) --[[ Line: 24 ]]
                        -- upvalues: v5 (ref), v6 (copy), v2 (ref)
                        v5.reportError({
                            error = tostring(v8), 
                            signalSource = v6.signalSource
                        });
                        return v2.reject(v8);
                    end);
                end;
            end);
        end;
    end
};