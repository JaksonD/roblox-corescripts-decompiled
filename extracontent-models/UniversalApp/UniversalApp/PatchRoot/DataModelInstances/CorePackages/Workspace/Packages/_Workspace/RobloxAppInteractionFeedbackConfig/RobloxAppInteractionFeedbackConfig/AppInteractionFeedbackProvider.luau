local l_Parent_0 = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Responsive);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v4 = require(l_Parent_0.RoactAppExperiment);
local l_InteractionFeedbackContext_0 = require(l_Parent_0.InteractionFeedback).InteractionFeedbackContext;
local v6 = require(script.Parent.SpatialConfig);
local v7 = require(script.Parent.DirectionalConfig);
local v8 = require(script.Parent.PointerConfig);
local v9 = require(script.Parent.TouchConfig);
local l_useUserExperiment_0 = v4.useUserExperiment;
local v11 = game:DefineFastFlag("MobileSoundAndHapticsEnabledIXP", false);
local v12 = game:DefineFastFlag("MobileSoundAndHapticsIXPBypass", false);
return function(v13) --[[ Line: 17 ]] --[[ Name: InteractionFeedbackProvider ]]
    -- upvalues: v2 (copy), v11 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v1 (copy), v6 (copy), v12 (copy), v9 (copy), v7 (copy), v8 (copy), l_InteractionFeedbackContext_0 (copy)
    local v14 = v2.useLastInput();
    local v15 = v2.useIsSpatial();
    local v16 = nil;
    if v11 then
        v16 = l_useUserExperiment_0({
            l_AppUserLayers_0.MobileSoundAndHapticsLayer
        }, function(v17) --[[ Line: 22 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            return (v17[l_AppUserLayers_0.MobileSoundAndHapticsLayer] or {}).mobileSoundAndHapticsEnabled;
        end);
    end;
    local v18 = v1.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: v15 (copy), v6 (ref), v14 (copy), v2 (ref), v12 (ref), v11 (ref), v16 (ref), v9 (ref), v7 (ref), v8 (ref)
        if v15 then
            return v6;
        elseif v14 == v2.Input.Touch then
            if v12 or v11 and v16 then
                return v9;
            else
                return {};
            end;
        elseif v14 == v2.Input.Directional then
            return v7;
        elseif v14 == v2.Input.Pointer then
            return v8;
        else
            return {};
        end;
    end, {
        v15, 
        v14
    });
    return v1.createElement(l_InteractionFeedbackContext_0.Provider, {
        value = v18
    }, v13.children);
end;