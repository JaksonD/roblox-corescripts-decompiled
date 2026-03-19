local l_IXPService_0 = game:GetService("IXPService");
return {
    getIxpLayerData = function(v1) --[[ Line: 3 ]]
        -- upvalues: l_IXPService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 4 ]]
            -- upvalues: l_IXPService_0 (ref), v1 (copy)
            return l_IXPService_0:GetUserLayerVariables(v1);
        end);
        return l_status_0 and l_result_0 or nil;
    end, 
    logUserLayerExposure = function(v4) --[[ Line: 11 ]]
        -- upvalues: l_IXPService_0 (copy)
        pcall(function() --[[ Line: 12 ]]
            -- upvalues: l_IXPService_0 (ref), v4 (copy)
            l_IXPService_0:LogUserLayerExposure(v4);
        end);
    end
};