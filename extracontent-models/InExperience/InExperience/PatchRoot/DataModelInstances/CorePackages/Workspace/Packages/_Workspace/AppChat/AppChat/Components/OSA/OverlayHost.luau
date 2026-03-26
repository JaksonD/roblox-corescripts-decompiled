local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local v6 = require(l_script_FirstAncestor_0.Components.OSA.GroupOSADialog);
local v7 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagSupportViewingUserProfileOnOSA);
local l_FFlagAppChatShowOSAOnPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagAppChatShowOSAOnPageEntry;
local v10 = {
    GroupOSADialog = v6
};
return function(v11) --[[ Line: 35 ]] --[[ Name: OverlayHost ]]
    -- upvalues: v7 (copy), v4 (copy), v8 (copy), v3 (copy), v10 (copy), v2 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), l_ProviderContainer_0 (copy)
    local v12 = v7(false);
    local v13 = v4.useSignalState(v12.getCurrentOverlay);
    local v14 = if v8 then v4.useSignalState(v12.getOverlayDefaultProps) else nil;
    local v15 = v3.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v12 (copy)
        v12.dismissOverlay();
    end, {});
    local v16 = v13 and v13.overlayType;
    local v17 = v16 and v10[v16];
    if not v17 then
        return nil;
    else
        local v18 = if v8 then v2.Dictionary.union(v14 or {}, v13.overlayProps or {}) else table.clone(v13.overlayProps or {});
        if l_FFlagAppChatShowOSAOnPageEntry_0 then
            local l_onClose_0 = v18.onClose;
            local l_l_onClose_0_0 = l_onClose_0 --[[ copy: 8 -> 9 ]];
            v18.onClose = function() --[[ Line: 58 ]]
                -- upvalues: l_l_onClose_0_0 (copy), v15 (copy)
                if l_l_onClose_0_0 then
                    l_l_onClose_0_0();
                end;
                v15();
            end;
        else
            v18.onClose = v15;
        end;
        v18.hasBackdrop = true;
        v18.disablePortal = false;
        local v21 = v3.createElement(v17, v18);
        if v11.providers and #v11.providers > 0 then
            return v3.createElement(l_ProviderContainer_0, {
                providers = v11.providers
            }, {
                Overlay = v21
            });
        else
            return v21;
        end;
    end;
end;