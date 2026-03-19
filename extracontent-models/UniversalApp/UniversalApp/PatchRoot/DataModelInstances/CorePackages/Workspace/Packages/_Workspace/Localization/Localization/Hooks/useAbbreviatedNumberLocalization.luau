local l_script_FirstAncestor_0 = script:FindFirstAncestor("Localization");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.abbreviateCount);
local v5 = require(l_script_FirstAncestor_0.LocalizationRoactContext);
local l_useSignal_0 = require(l_Parent_0.RoactUtils).Hooks.useSignal;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
return function(v8) --[[ Line: 14 ]] --[[ Name: useAbbreviatedNumberLocalization ]]
    -- upvalues: v3 (copy), v5 (copy), l_LocalizationService_0 (copy), l_useSignal_0 (copy), v4 (copy), l_dependencyArray_0 (copy)
    local v9 = v3.useContext(v5);
    local v10, v11 = v3.useState(l_LocalizationService_0.RobloxLocaleId);
    local v13 = v3.useCallback(function(v12) --[[ Line: 19 ]]
        -- upvalues: v9 (copy), v10 (copy), v11 (copy)
        v12 = v9:GetLocale();
        if v12 ~= v10 then
            v11(v12);
        end;
    end, {
        v9
    });
    l_useSignal_0(v9.changed, v13);
    return v3.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: v8 (copy), v4 (ref), v10 (copy)
        if v8 == nil then
            return nil;
        else
            return v4(v8, v10);
        end;
    end, l_dependencyArray_0(v8, v10));
end;