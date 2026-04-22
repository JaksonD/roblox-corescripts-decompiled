local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AmpUpsell);
local l_AccessResponseEnum_0 = v2.AmpEnums.AccessResponseEnum;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v7 = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell;
local v9 = game:DefineFastFlag("ManuallyInvokeAmpUpsell2", false);
local v10 = require(l_script_FirstAncestor_0.Utils.manuallyInvokeAmpUpsell);
local l_InExpAmpWizardController_0 = v2.InExpAmpWizardController;
local v12 = if v9 then require(l_script_FirstAncestor_0.Flag.FStringCommsFAEFeatureName) else game:DefineFastString("CommsFAEFeatureName", "TriggerAgeVerifyRecourse");
local v13 = if v9 then require(l_script_FirstAncestor_0.Flag.FStringCommsFAENamespace) else game:DefineFastString("CommsFAENamespace", "social/Upsells");
return function(v14, v15, v16, v17, v18) --[[ Line: 23 ]]
    -- upvalues: l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v7 (copy), v9 (copy), v10 (copy), l_InExpAmpWizardController_0 (copy), v12 (copy), l_AccessResponseEnum_0 (copy), v13 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_NavigateBack_0 (copy)
    return function(v19) --[[ Line: 30 ]]
        -- upvalues: l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v18 (copy), v14 (copy), v7 (ref), v9 (ref), v10 (ref), v15 (copy), v16 (copy), l_InExpAmpWizardController_0 (ref), v12 (ref), l_AccessResponseEnum_0 (ref), v13 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v17 (copy), l_NavigateBack_0 (ref)
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 and v18 then
            local v20 = v14 or v7.FacialAgeEstimation;
            if v9 then
                return (v10(v20, v15, v16));
            else
                return (l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v12, function(v21, _) --[[ Line: 37 ]]
                    -- upvalues: l_AccessResponseEnum_0 (ref), v15 (ref), v16 (ref)
                    if v21 == l_AccessResponseEnum_0.Granted then
                        if v15 then
                            v15();
                            return;
                        end;
                    elseif v16 then
                        v16();
                    end;
                end, nil, v20, nil, v13));
            end;
        else
            return v19:dispatch(l_NavigateDown_0({
                name = l_AppPage_0.AmpWizardContainer, 
                extraProps = {
                    featureName = v12, 
                    nameSpace = v13, 
                    entryPointEventCtx = v14 or v7.FacialAgeEstimation, 
                    metadata = {
                        source = v17
                    }, 
                    skipFacialAgeEstimationWebLinkModal = true, 
                    completionCallback = function(v23, _) --[[ Line: 65 ]] --[[ Name: completionCallback ]]
                        -- upvalues: v19 (copy), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v15 (ref), v16 (ref)
                        v19:dispatch(l_NavigateBack_0(true));
                        if v23 == l_AccessResponseEnum_0.Granted then
                            if v15 then
                                v15();
                                return;
                            end;
                        elseif v16 then
                            v16();
                        end;
                    end
                }
            }));
        end;
    end;
end;