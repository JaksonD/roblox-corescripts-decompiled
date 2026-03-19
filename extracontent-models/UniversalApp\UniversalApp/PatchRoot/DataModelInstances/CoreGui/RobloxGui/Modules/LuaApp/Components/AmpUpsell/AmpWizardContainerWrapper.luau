local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_script_FirstAncestor_0.LuaApp.Thunks.Verification.OpenPhoneUpsellModal);
local v7 = require(l_script_FirstAncestor_0.LuaApp.Thunks.Verification.OpenEmailUpsellModal);
local v8 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local l_WizardContainer_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).WizardContainer;
local l_ActionTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).AmpEnums.ActionTypeEnum;
local l_GetFFlagEnableAmpEmailUpsellSupport_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpEmailUpsellSupport;
local l_GetFFlagEnableAmpIDVUpsellSupport_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpIDVUpsellSupport;
local l_GetFFlagEnableAmpSubscriptionUpsell_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpSubscriptionUpsell;
return function(v14) --[[ Line: 20 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v2 (copy), v6 (copy), v8 (copy), l_ActionTypeEnum_0 (copy), l_GetFFlagEnableAmpEmailUpsellSupport_0 (copy), v7 (copy), l_GetFFlagEnableAmpIDVUpsellSupport_0 (copy), l_GetFFlagEnableAmpSubscriptionUpsell_0 (copy), v5 (copy), l_WizardContainer_0 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_useNavigation_0();
    local v18 = v2.useCallback(function(v17) --[[ Line: 24 ]]
        -- upvalues: v15 (copy), v6 (ref)
        v15(v6(v17));
    end, {
        v15
    });
    local v20 = v2.useCallback(function(v19) --[[ Line: 28 ]]
        -- upvalues: v16 (copy), v8 (ref)
        v16.push(v8.AccountSettingsUpsell, {
            extraProps = v19
        });
    end, {
        v16
    });
    local v21 = {
        [l_ActionTypeEnum_0.Phone] = v18
    };
    if l_GetFFlagEnableAmpEmailUpsellSupport_0() then
        local v23 = v2.useCallback(function(v22) --[[ Line: 37 ]]
            -- upvalues: v15 (copy), v7 (ref)
            v15(v7(v22));
        end, {
            v15
        });
        v21[l_ActionTypeEnum_0.AddedEmail] = v23;
    end;
    if l_GetFFlagEnableAmpIDVUpsellSupport_0() then
        local v25 = v2.useCallback(function(v24) --[[ Line: 44 ]]
            -- upvalues: v16 (copy), v8 (ref)
            v16.push(v8.IDVUpsellContainer, {
                extraProps = v24
            });
        end, {
            v16
        });
        v21[l_ActionTypeEnum_0.GovernmentId] = v25;
    end;
    local v27 = v2.useCallback(function(v26) --[[ Line: 51 ]]
        -- upvalues: v16 (copy), v8 (ref)
        v16.push(v8.VPCUpsellContainer, {
            extraProps = v26
        });
    end, {
        v16
    });
    v21[l_ActionTypeEnum_0.ParentLink] = v27;
    v21[l_ActionTypeEnum_0.ParentConsent] = v27;
    local v29 = v2.useCallback(function(v28) --[[ Line: 58 ]]
        -- upvalues: v16 (copy), v8 (ref)
        v16.push(v8.FAEUpsell, {
            extraProps = v28
        });
    end, {
        v16
    });
    v21[l_ActionTypeEnum_0.AgeEstimation] = v29;
    if l_GetFFlagEnableAmpSubscriptionUpsell_0() then
        local v31 = v2.useCallback(function(v30) --[[ Line: 65 ]]
            -- upvalues: v16 (copy), v8 (ref)
            v16.push(v8.RobloxSubscriptionUpsell, {
                extraProps = v30
            });
        end, {
            v16
        });
        v21[l_ActionTypeEnum_0.Subscription] = v31;
    end;
    local v32 = v5.Dictionary.join(v14 or {}, {
        openUpsells = v21, 
        openAccountSettingsUpsell = v20
    });
    return v2.createElement(l_WizardContainer_0, v32);
end;