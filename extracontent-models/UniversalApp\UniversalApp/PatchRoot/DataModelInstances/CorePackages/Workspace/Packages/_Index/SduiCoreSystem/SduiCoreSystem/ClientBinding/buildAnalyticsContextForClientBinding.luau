local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.UnifiedLogging);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local v6 = require(l_script_FirstAncestor_0.SduiErrors);
local v7 = require(l_script_FirstAncestor_0.SduiLogger);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v9 = {};
local v12 = {
    __index = function(v10, v11) --[[ Line: 29 ]] --[[ Name: __index ]]
        if v11 == "analyticsData" then
            return v10.getAnalyticsDataSnapshot();
        elseif v11 == "ancestorAnalyticsData" then
            return v10.getAncestorAnalyticsDataSnapshot();
        else
            return nil;
        end;
    end
};
return function(v13, v14, v15, v16) --[[ Line: 62 ]] --[[ Name: buildAnalyticsContextForClientBinding ]]
    -- upvalues: v9 (copy), v7 (copy), v6 (copy), v2 (copy), v12 (copy)
    local v17 = nil;
    local v25 = {
        getAnalyticsDataSnapshot = function() --[[ Line: 80 ]] --[[ Name: getAnalyticsDataSnapshot ]]
            -- upvalues: v13 (copy), v9 (ref), v14 (copy), v7 (ref), v6 (ref), v16 (copy), v17 (ref), v2 (ref)
            local v18 = table.clone(v13 or v9);
            if v14 then
                xpcall(function() --[[ Line: 83 ]]
                    -- upvalues: v14 (ref), v18 (copy)
                    for v19, v20 in v14 do
                        v18[v19] = v20(false).data;
                    end;
                end, function(v21) --[[ Line: 87 ]]
                    -- upvalues: v7 (ref), v6 (ref), v16 (ref)
                    v7.reportError(v6.SduiErrorType.FailedToComputeAnalyticsData, {
                        message = v21, 
                        name = v16.debugName
                    }, v16.appPage);
                end);
            end;
            if v17 then
                return (v2.Dictionary.join(v18, v17));
            else
                return v18;
            end;
        end, 
        getAncestorAnalyticsDataSnapshot = function() --[[ Line: 105 ]] --[[ Name: getAncestorAnalyticsDataSnapshot ]]
            -- upvalues: v15 (copy), v9 (ref), v2 (ref)
            if v15 then
                local v22 = v15.ancestorAnalyticsData or v9;
                local v23 = v15.analyticsData or v9;
                return v2.Dictionary.join(v22, v23);
            else
                return v9;
            end;
        end, 
        setLocalAnalyticsData = function(v24) --[[ Line: 122 ]] --[[ Name: setLocalAnalyticsData ]]
            -- upvalues: v17 (ref)
            v17 = v24;
        end, 
        getCollectionData = function() --[[ Line: 134 ]] --[[ Name: getCollectionData ]]
            -- upvalues: v15 (copy)
            if v15 and v15.getCollectionData then
                return v15.getCollectionData();
            else
                return nil;
            end;
        end
    };
    setmetatable(v25, v12);
    return v25;
end;