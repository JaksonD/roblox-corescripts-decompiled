local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_IXPServiceWrapper_0 = require(l_Parent_0.IXPServiceWrapper).IXPServiceWrapper;
local v2 = game:DefineFastFlag("NewUpsellModalExperimentForDesktopV2", false);
local v3 = game:DefineFastString("DesktopUpsellIXPLayer", "Payments.Optimization.InExperienceUpsell.Desktop.UI");
local v4 = {
    Control = 0, 
    OpenRobuxStore = 1, 
    OpenPaymentsPage = 2
};
return {
    variants = v4, 
    getVariant = function() --[[ Line: 14 ]] --[[ Name: getVariant ]]
        -- upvalues: v2 (copy), v4 (copy), l_IXPServiceWrapper_0 (copy), v3 (copy)
        if not v2 then
            return v4.Control;
        else
            local l_l_IXPServiceWrapper_0_LayerData_0 = l_IXPServiceWrapper_0:GetLayerData(v3);
            if not l_l_IXPServiceWrapper_0_LayerData_0 or l_l_IXPServiceWrapper_0_LayerData_0.newUpsellModalVariant == nil then
                return v4.Control;
            else
                return l_l_IXPServiceWrapper_0_LayerData_0.newUpsellModalVariant;
            end;
        end;
    end, 
    logExposure = function() --[[ Line: 29 ]] --[[ Name: logExposure ]]
        -- upvalues: v2 (copy), l_IXPServiceWrapper_0 (copy), v3 (copy)
        if not v2 then
            return;
        else
            l_IXPServiceWrapper_0:LogUserLayerExposure(v3);
            return;
        end;
    end, 
    shouldShowNewModal = function() --[[ Line: 37 ]] --[[ Name: shouldShowNewModal ]]
        -- upvalues: v2 (copy), l_IXPServiceWrapper_0 (copy), v3 (copy), v4 (copy)
        if v2 then
            l_IXPServiceWrapper_0:LogUserLayerExposure(v3);
        end;
        local v6;
        if not v2 then
            v6 = v4.Control;
        else
            local l_l_IXPServiceWrapper_0_LayerData_1 = l_IXPServiceWrapper_0:GetLayerData(v3);
            v6 = if not l_l_IXPServiceWrapper_0_LayerData_1 or l_l_IXPServiceWrapper_0_LayerData_1.newUpsellModalVariant == nil then v4.Control else l_l_IXPServiceWrapper_0_LayerData_1.newUpsellModalVariant;
        end;
        return v6 ~= v4.Control;
    end
};