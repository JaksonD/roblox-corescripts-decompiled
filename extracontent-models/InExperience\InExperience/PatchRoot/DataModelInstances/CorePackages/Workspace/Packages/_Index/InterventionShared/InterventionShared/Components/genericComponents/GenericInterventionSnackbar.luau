local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local v1 = require(l_Parent_0.React);
local l_useEffect_0 = v1.useEffect;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_setTimeout_0 = v3.setTimeout;
local l_clearTimeout_0 = v3.clearTimeout;
local l_Snackbar_0 = require(l_Parent_0.Foundation).Snackbar;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v8 = game:DefineFastInt("GenericInterventionSnackbarAutoDismissDelaySeconds", 4);
return v1.memo(function(v9) --[[ Line: 29 ]] --[[ Name: GenericInterventionSnackbar ]]
    -- upvalues: l_useEffect_0 (copy), v8 (copy), l_setTimeout_0 (copy), l_clearTimeout_0 (copy), l_dependencyArray_0 (copy), v1 (copy), l_Snackbar_0 (copy)
    l_useEffect_0(function() --[[ Line: 30 ]]
        -- upvalues: v9 (copy), v8 (ref), l_setTimeout_0 (ref), l_clearTimeout_0 (ref)
        local v10 = nil;
        local v11 = v9.autoDismissDelaySeconds or v8;
        v10 = l_setTimeout_0(function() --[[ Line: 34 ]]
            -- upvalues: v9 (ref)
            v9.onDismiss();
        end, v11 * 1000);
        return function() --[[ Line: 38 ]]
            -- upvalues: v10 (ref), l_clearTimeout_0 (ref)
            if v10 then
                l_clearTimeout_0(v10);
            end;
        end;
    end, l_dependencyArray_0(v9.onDismiss, v9.autoDismissDelaySeconds));
    return (v1.createElement(l_Snackbar_0, {
        title = v9.titleText, 
        icon = v9.iconName, 
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0)
    }));
end);