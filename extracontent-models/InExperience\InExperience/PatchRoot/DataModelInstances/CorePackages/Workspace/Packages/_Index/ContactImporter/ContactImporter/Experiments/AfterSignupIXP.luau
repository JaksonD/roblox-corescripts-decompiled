local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_IXPService_0 = game:GetService("IXPService");
local l_useUserExperiment_0 = require(l_Parent_1.RoactAppExperiment).useUserExperiment;
local v4 = require(l_Parent_0.Flags.FStringPVCIAfterSignupLayer);
local v5 = require(l_Parent_0.Flags.FStringPVCIAfterSignupVariantKey);
local function v7(v6) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v5 (copy)
    return (v6[v4] or {})[v5];
end;
return {
    usePVAndCIAfterSignupVariant = function(v8) --[[ Line: 18 ]] --[[ Name: usePVAndCIAfterSignupVariant ]]
        -- upvalues: l_useUserExperiment_0 (copy), v4 (copy), v7 (copy)
        local v9 = v8 or {
            isExposureEnabled = false
        };
        return (l_useUserExperiment_0({
            v4
        }, v7, v9.isExposureEnabled));
    end, 
    logExposure = function() --[[ Line: 26 ]] --[[ Name: logExposure ]]
        -- upvalues: l_IXPService_0 (copy), v4 (copy)
        l_IXPService_0:LogUserLayerExposure(v4);
    end
};