local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.UnifiedLogging);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local v6 = require(l_script_FirstAncestor_0.SduiErrors);
local v7 = require(l_script_FirstAncestor_0.SduiLogger);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
local v10 = {};
local v13 = {
    __index = function(v11, v12) --[[ Line: 31 ]] --[[ Name: __index ]]
        if v12 == "analyticsData" then
            return v11.getAnalyticsDataSnapshot();
        elseif v12 == "ancestorAnalyticsData" then
            return v11.getAncestorAnalyticsDataSnapshot();
        else
            return nil;
        end;
    end
};
return function(v14, v15, v16, v17) --[[ Line: 64 ]] --[[ Name: buildAnalyticsContextForClientBinding ]]
    -- upvalues: v10 (copy), l_FFlagSduiInputDataSignals_0 (copy), v7 (copy), v6 (copy), v2 (copy), v13 (copy)
    local v18 = nil;
    local v26 = {
        getAnalyticsDataSnapshot = function() --[[ Line: 82 ]] --[[ Name: getAnalyticsDataSnapshot ]]
            -- upvalues: v14 (copy), v10 (ref), v15 (copy), l_FFlagSduiInputDataSignals_0 (ref), v7 (ref), v6 (ref), v17 (copy), v18 (ref), v2 (ref)
            local v19 = table.clone(v14 or v10);
            if v15 then
                xpcall(function() --[[ Line: 85 ]]
                    -- upvalues: v15 (ref), l_FFlagSduiInputDataSignals_0 (ref), v19 (copy)
                    for v20, v21 in v15 do
                        if l_FFlagSduiInputDataSignals_0 then
                            v19[v20] = v21(false).data;
                        else
                            v19[v20] = v21(false);
                        end;
                    end;
                end, function(v22) --[[ Line: 93 ]]
                    -- upvalues: v7 (ref), v6 (ref), v17 (ref)
                    v7.reportError(v6.SduiErrorType.FailedToComputeAnalyticsData, {
                        message = v22, 
                        name = v17.debugName
                    }, v17.appPage);
                end);
            end;
            if v18 then
                return (v2.Dictionary.join(v19, v18));
            else
                return v19;
            end;
        end, 
        getAncestorAnalyticsDataSnapshot = function() --[[ Line: 111 ]] --[[ Name: getAncestorAnalyticsDataSnapshot ]]
            -- upvalues: v16 (copy), v10 (ref), v2 (ref)
            if v16 then
                local v23 = v16.ancestorAnalyticsData or v10;
                local v24 = v16.analyticsData or v10;
                return v2.Dictionary.join(v23, v24);
            else
                return v10;
            end;
        end, 
        setLocalAnalyticsData = function(v25) --[[ Line: 128 ]] --[[ Name: setLocalAnalyticsData ]]
            -- upvalues: v18 (ref)
            v18 = v25;
        end, 
        getCollectionData = function() --[[ Line: 140 ]] --[[ Name: getCollectionData ]]
            -- upvalues: v16 (copy)
            if v16 and v16.getCollectionData then
                return v16.getCollectionData();
            else
                return nil;
            end;
        end
    };
    setmetatable(v26, v13);
    return v26;
end;