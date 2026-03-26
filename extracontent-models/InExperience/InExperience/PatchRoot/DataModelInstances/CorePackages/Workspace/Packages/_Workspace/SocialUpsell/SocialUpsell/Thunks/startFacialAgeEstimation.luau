local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AmpUpsell);
local l_AccessResponseEnum_0 = v2.AmpEnums.AccessResponseEnum;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v7 = require(l_script_FirstAncestor_0.Constants);
local v8 = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell;
local v10 = game:DefineFastFlag("ManuallyInvokeAmpUpsell2", false);
local v11 = require(l_script_FirstAncestor_0.Utils.manuallyInvokeAmpUpsell);
local l_InExpAmpWizardController_0 = v2.InExpAmpWizardController;
local v13 = if v10 then require(l_script_FirstAncestor_0.Flag.FStringCommsFAEFeatureName) else game:DefineFastString("CommsFAEFeatureName", "TriggerAgeVerifyRecourse");
local v14 = if v10 then require(l_script_FirstAncestor_0.Flag.FStringCommsFAENamespace) else game:DefineFastString("CommsFAENamespace", "social/Upsells");
local v15 = require(l_script_FirstAncestor_0.Flag.FFlagAddMinorFixesToUpsellAnalytics);
local l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 = v7.DEFAULT_FAE_ENTRY_POINT_EVENT_CTX;
return function(v17, v18, v19, v20, v21) --[[ Line: 28 ]]
    -- upvalues: l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v15 (copy), v8 (copy), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (copy), v10 (copy), v11 (copy), l_InExpAmpWizardController_0 (copy), v13 (copy), l_AccessResponseEnum_0 (copy), v14 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_NavigateBack_0 (copy)
    return function(v22) --[[ Line: 35 ]]
        -- upvalues: l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v21 (copy), v17 (copy), v15 (ref), v8 (ref), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (ref), v10 (ref), v11 (ref), v18 (copy), v19 (copy), l_InExpAmpWizardController_0 (ref), v13 (ref), l_AccessResponseEnum_0 (ref), v14 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v20 (copy), l_NavigateBack_0 (ref)
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 and v21 then
            local v23 = v17 or if v15 then v8.FacialAgeEstimation else l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0;
            if v10 then
                return (v11(v23, v18, v19));
            else
                return (l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v13, function(v24, _) --[[ Line: 47 ]]
                    -- upvalues: l_AccessResponseEnum_0 (ref), v18 (ref), v19 (ref)
                    if v24 == l_AccessResponseEnum_0.Granted then
                        if v18 then
                            v18();
                            return;
                        end;
                    elseif v19 then
                        v19();
                    end;
                end, nil, v23, nil, v14));
            end;
        else
            return v22:dispatch(l_NavigateDown_0({
                name = l_AppPage_0.AmpWizardContainer, 
                extraProps = {
                    featureName = v13, 
                    nameSpace = v14, 
                    entryPointEventCtx = v17 or if v15 then v8.FacialAgeEstimation else l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0, 
                    metadata = {
                        source = v20
                    }, 
                    skipFacialAgeEstimationWebLinkModal = true, 
                    completionCallback = function(v26, _) --[[ Line: 77 ]] --[[ Name: completionCallback ]]
                        -- upvalues: v22 (copy), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v18 (ref), v19 (ref)
                        v22:dispatch(l_NavigateBack_0(true));
                        if v26 == l_AccessResponseEnum_0.Granted then
                            if v18 then
                                v18();
                                return;
                            end;
                        elseif v19 then
                            v19();
                        end;
                    end
                }
            }));
        end;
    end;
end;