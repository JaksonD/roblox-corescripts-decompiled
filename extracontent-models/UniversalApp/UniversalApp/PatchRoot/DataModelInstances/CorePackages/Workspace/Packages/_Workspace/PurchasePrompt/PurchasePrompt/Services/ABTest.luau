local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local l_IXPServiceWrapper_0 = require(l_Parent_0.IxpServiceWrapper).IXPServiceWrapper;
return {
    new = function() --[[ Line: 15 ]] --[[ Name: new ]]
        -- upvalues: l_IXPServiceWrapper_0 (copy)
        local v2 = {};
        setmetatable(v2, {
            __tostring = function() --[[ Line: 19 ]] --[[ Name: __tostring ]]
                return "Service(ABTest)";
            end
        });
        v2.getLayerData = function(v3) --[[ Line: 24 ]] --[[ Name: getLayerData ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v3);
        end;
        v2.logUserLayerExposure = function(v4) --[[ Line: 28 ]] --[[ Name: logUserLayerExposure ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref)
            l_IXPServiceWrapper_0:LogUserLayerExposure(v4);
        end;
        return v2;
    end
};