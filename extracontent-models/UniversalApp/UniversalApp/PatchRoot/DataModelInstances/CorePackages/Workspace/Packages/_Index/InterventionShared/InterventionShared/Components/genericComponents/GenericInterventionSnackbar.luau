local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local v1 = require(l_Parent_0.React);
local l_useEffect_0 = v1.useEffect;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_setTimeout_0 = v3.setTimeout;
local l_clearTimeout_0 = v3.clearTimeout;
local v6 = require(l_Parent_0.Foundation);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_Snackbar_0 = v6.Snackbar;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v10 = game:DefineFastInt("GenericInterventionSnackbarAutoDismissDelaySeconds", 4);
return v1.memo(function(v11) --[[ Line: 31 ]] --[[ Name: GenericInterventionSnackbar ]]
    -- upvalues: l_useEffect_0 (copy), v10 (copy), l_setTimeout_0 (copy), l_clearTimeout_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v1 (copy), l_Snackbar_0 (copy)
    l_useEffect_0(function() --[[ Line: 33 ]]
        -- upvalues: v11 (copy), v10 (ref), l_setTimeout_0 (ref), l_clearTimeout_0 (ref)
        local v12 = nil;
        local v13 = v11.autoDismissDelaySeconds or v10;
        v12 = l_setTimeout_0(function() --[[ Line: 37 ]]
            -- upvalues: v11 (ref)
            v11.onDismiss();
        end, v13 * 1000);
        return function() --[[ Line: 41 ]]
            -- upvalues: v12 (ref), l_clearTimeout_0 (ref)
            if v12 then
                l_clearTimeout_0(v12);
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v11.onDismiss, 
        v11.autoDismissDelaySeconds
    } else l_dependencyArray_0(v11.onDismiss, v11.autoDismissDelaySeconds));
    return (v1.createElement(l_Snackbar_0, {
        title = v11.titleText, 
        icon = v11.iconName, 
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0)
    }));
end);