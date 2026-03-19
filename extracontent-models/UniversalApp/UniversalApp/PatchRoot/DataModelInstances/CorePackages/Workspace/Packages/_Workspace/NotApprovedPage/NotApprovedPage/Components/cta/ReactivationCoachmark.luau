local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_VRService_0 = game:GetService("VRService");
local v3 = require(l_Parent_0.React);
local l_useCallback_0 = v3.useCallback;
local l_useEffect_0 = v3.useEffect;
local l_useRef_0 = v3.useRef;
local l_useState_0 = v3.useState;
local l_useMemo_0 = v3.useMemo;
local v9 = require(l_Parent_0.Foundation);
local l_Coachmark_0 = v9.Coachmark;
local l_OverlayProvider_0 = v9.OverlayProvider;
local l_PopoverSide_0 = v9.Enums.PopoverSide;
local l_PopoverAlign_0 = v9.Enums.PopoverAlign;
local v14 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v14.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v14.FocusNavigationEventNameEnum;
local _ = require(l_Parent_0.ReactFocusNavigation);
local l_useAppFocusRoot_0 = v14.useAppFocusRoot;
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local v20 = require(l_script_FirstAncestor_0.Utils.canReactivate);
local v21 = require(l_script_FirstAncestor_0.Utils.getVRSurfaceGui);
local v22 = require(l_script_FirstAncestor_0.Utils.hasAnyCommutation);
local v23 = require(l_Parent_0.InputHandlers);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 = l_Constants_0.PUNISHMENT_TYPE_TO_INTERVENTION_MAP;
return v3.memo(function(v27) --[[ Line: 52 ]] --[[ Name: ReactivationCoachmark ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), l_useNotApprovedPageContext_0 (copy), l_VRService_0 (copy), v21 (copy), l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 (copy), v20 (copy), v22 (copy), l_useCallback_0 (copy), l_useMemo_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v23 (copy), l_useAppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useEffect_0 (copy), v3 (copy), l_OverlayProvider_0 (copy), l_Coachmark_0 (copy), l_PopoverSide_0 (copy), l_PopoverAlign_0 (copy)
    local v28 = l_useRef_0(nil);
    local v29, v30 = l_useState_0(false);
    local v31 = l_useNotApprovedPageContext_0();
    local l_translations_0 = v31.translations;
    local l_commutationEligibility_0 = v31.commutationEligibility;
    local v34 = if l_VRService_0.VREnabled then v21() else nil;
    local l_moderationDetail_0 = v27.moderationDetail;
    local l_punishmentTypeDescription_0 = l_moderationDetail_0.punishmentTypeDescription;
    local l_endDate_0 = l_moderationDetail_0.endDate;
    local l_verificationCategory_0 = l_moderationDetail_0.verificationCategory;
    local v39 = l_verificationCategory_0 and l_verificationCategory_0 ~= "";
    local v40 = l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0[l_punishmentTypeDescription_0];
    local v41 = v20(v40, l_endDate_0, l_verificationCategory_0) and not v39 and not v22(l_commutationEligibility_0) and not v27.hasNavigatedForward and not v29;
    local v42 = l_useCallback_0(function() --[[ Line: 78 ]]
        -- upvalues: v30 (copy)
        v30(true);
    end, {});
    local v44 = l_useMemo_0(function() --[[ Line: 82 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v23 (ref), v42 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v23.onRelease(function(v43) --[[ Line: 85 ]]
                    -- upvalues: v42 (ref)
                    v43.cancelled = true;
                    v42();
                end)
            }
        };
    end, {
        v42
    });
    local v45 = l_useAppFocusRoot_0({
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
        isAutoFocusRoot = true, 
        isFocusable = v41, 
        customEventHandlers = v44
    });
    local v47 = l_useCallback_0(function(v46) --[[ Line: 105 ]]
        -- upvalues: v28 (copy), v45 (copy)
        v28.current = v46;
        if type(v45) == "function" then
            v45(v46);
        end;
    end, {
        v45
    });
    l_useEffect_0(function() --[[ Line: 113 ]]
        -- upvalues: v28 (copy)
        if v28.current then
            v28.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
            v28.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
            v28.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
            v28.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
            v28.current.SelectionGroup = true;
        end;
    end, {
        v41
    });
    return v3.createElement(l_OverlayProvider_0, {
        gui = v34
    }, {
        Coachmark = v3.createElement(l_Coachmark_0, {
            title = l_translations_0.reactivationNoticeHeading, 
            text = l_translations_0.reactivationNoticeDescription, 
            isOpen = v41, 
            side = l_PopoverSide_0.Top, 
            align = l_PopoverAlign_0.Center, 
            anchorRef = v27.anchorRef, 
            onClose = v42, 
            ref = v47
        })
    });
end);