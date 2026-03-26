local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useMemo_0 = require(l_Parent_0.React).useMemo;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCapturedAuditContent_0 = require(l_script_FirstAncestor_0.Stores.AuditContentContext.AuditContentContext).useCapturedAuditContent;
local v5 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAuditSystem);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local function v12(v7) --[[ Line: 48 ]] --[[ Name: parseTranslationKey ]]
    if not v7 or v7 == "" then
        return "", "";
    else
        local v8 = string.split(v7, ".");
        if #v8 >= 3 then
            local v9 = v8[1] .. "." .. v8[2];
            local v10 = {};
            for v11 = 3, #v8 do
                table.insert(v10, v8[v11]);
            end;
            return v9, (table.concat(v10, "."));
        else
            return "", v7;
        end;
    end;
end;
return function(v13) --[[ Line: 73 ]] --[[ Name: RegisterAuditContent ]]
    -- upvalues: v5 (copy), l_useMemo_0 (copy), v12 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useCapturedAuditContent_0 (copy)
    if not v5() then
        return nil;
    else
        local l_translationKey_0 = v13.translationKey;
        local l_translatedSourceString_0 = v13.translatedSourceString;
        local l_parameters_0 = v13.parameters;
        local v19 = l_useMemo_0(function() --[[ Line: 83 ]]
            -- upvalues: l_translationKey_0 (copy), l_translatedSourceString_0 (copy), v12 (ref), l_parameters_0 (copy)
            if not l_translationKey_0 or not l_translatedSourceString_0 then
                return nil;
            else
                local v17, v18 = v12(l_translationKey_0);
                if v17 == "" then
                    return nil;
                else
                    return {
                        translationKey = v18, 
                        translationNamespace = v17, 
                        translatedSourceString = l_translatedSourceString_0, 
                        parameters = l_parameters_0
                    };
                end;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            l_translationKey_0, 
            l_translatedSourceString_0, 
            l_parameters_0
        } else l_dependencyArray_0(l_translationKey_0, l_translatedSourceString_0, l_parameters_0));
        l_useCapturedAuditContent_0(l_translationKey_0, v19);
        return nil;
    end;
end;