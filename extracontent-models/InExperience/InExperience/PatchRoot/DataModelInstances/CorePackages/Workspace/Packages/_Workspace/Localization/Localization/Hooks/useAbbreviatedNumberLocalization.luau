local l_script_FirstAncestor_0 = script:FindFirstAncestor("Localization");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.abbreviateCount);
local v5 = require(l_script_FirstAncestor_0.LocalizationRoactContext);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useSignal_0 = require(l_Parent_0.RoactUtils).Hooks.useSignal;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
return function(v9) --[[ Line: 16 ]] --[[ Name: useAbbreviatedNumberLocalization ]]
    -- upvalues: v3 (copy), v5 (copy), l_LocalizationService_0 (copy), l_useSignal_0 (copy), v4 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v10 = v3.useContext(v5);
    local v11, v12 = v3.useState(l_LocalizationService_0.RobloxLocaleId);
    local v14 = v3.useCallback(function(v13) --[[ Line: 21 ]]
        -- upvalues: v10 (copy), v11 (copy), v12 (copy)
        v13 = v10:GetLocale();
        if v13 ~= v11 then
            v12(v13);
        end;
    end, {
        v10
    });
    l_useSignal_0(v10.changed, v14);
    return v3.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v9 (copy), v4 (ref), v11 (copy)
        if v9 == nil then
            return nil;
        else
            return v4(v9, v11);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v9, 
        v11
    } else l_dependencyArray_0(v9, v11));
end;