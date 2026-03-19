local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.AvatarExperienceNavigation);
local l_SlotBasedEditorAnalytics_0 = require(l_Parent_0.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
local v6 = require(l_script_FirstAncestor_0.Enums.SaveStatusEnum);
local v7 = require(l_script_FirstAncestor_0.Context.useAvatarSaveContext);
local l_useAvatarRoute_0 = v4.AvatarRoute.Hooks.useAvatarRoute;
return function() --[[ Line: 22 ]] --[[ Name: useSaveButtonProps ]]
    -- upvalues: l_useAvatarRoute_0 (copy), v7 (copy), v3 (copy), v2 (copy), v6 (copy), l_SlotBasedEditorAnalytics_0 (copy)
    local v9 = l_useAvatarRoute_0();
    local v10 = v7();
    local l_getSaveEligibilityStatusSignal_0 = v10.getSaveEligibilityStatusSignal;
    local l_trySaveAvatar_0 = v10.trySaveAvatar;
    local v13 = v3.useSignalState(l_getSaveEligibilityStatusSignal_0);
    local v15 = v2.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v13 (copy), v6 (ref), v9 (copy)
        local v14 = true;
        if v13 == v6.Eligible then
            v14 = v9.isOverlayVisible;
        end;
        return v14;
    end, {
        v13, 
        v9.isOverlayVisible
    });
    local v16 = v2.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v15 (copy), l_trySaveAvatar_0 (copy), l_SlotBasedEditorAnalytics_0 (ref)
        if not v15 and l_trySaveAvatar_0 then
            l_trySaveAvatar_0();
            l_SlotBasedEditorAnalytics_0.trackSaveClick();
        end;
    end, {
        v15, 
        l_trySaveAvatar_0
    });
    return {
        disabled = v15, 
        onActivated = v16
    };
end;