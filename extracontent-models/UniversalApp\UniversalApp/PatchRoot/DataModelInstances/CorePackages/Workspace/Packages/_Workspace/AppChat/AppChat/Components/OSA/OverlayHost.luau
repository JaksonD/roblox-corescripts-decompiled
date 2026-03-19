local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local v6 = require(l_script_FirstAncestor_0.Components.OSA.GroupOSADialog);
local v7 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagSupportViewingUserProfileOnOSA);
local v9 = {
    GroupOSADialog = v6
};
return function(v10) --[[ Line: 34 ]] --[[ Name: OverlayHost ]]
    -- upvalues: v7 (copy), v4 (copy), v8 (copy), v3 (copy), v9 (copy), v2 (copy), l_ProviderContainer_0 (copy)
    local v11 = v7(false);
    local v12 = v4.useSignalState(v11.getCurrentOverlay);
    local v13 = if v8 then v4.useSignalState(v11.getOverlayDefaultProps) else nil;
    local v14 = v3.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v11 (copy)
        v11.dismissOverlay();
    end, {});
    local v15 = v12 and v12.overlayType;
    local v16 = v15 and v9[v15];
    if not v16 then
        return nil;
    else
        local v17 = if v8 then v2.Dictionary.union(v13 or {}, v12.overlayProps or {}) else table.clone(v12.overlayProps or {});
        v17.onClose = v14;
        v17.hasBackdrop = true;
        v17.disablePortal = false;
        local v18 = v3.createElement(v16, v17);
        if v10.providers and #v10.providers > 0 then
            return v3.createElement(l_ProviderContainer_0, {
                providers = v10.providers
            }, {
                Overlay = v18
            });
        else
            return v18;
        end;
    end;
end;