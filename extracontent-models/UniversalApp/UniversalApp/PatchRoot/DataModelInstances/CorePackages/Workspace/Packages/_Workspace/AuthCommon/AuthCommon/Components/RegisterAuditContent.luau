local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useMemo_0 = require(l_Parent_0.React).useMemo;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCapturedAuditContent_0 = require(l_script_FirstAncestor_0.Stores.AuditContentContext.AuditContentContext).useCapturedAuditContent;
local v5 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAuditSystem);
local function v11(v6) --[[ Line: 46 ]] --[[ Name: parseTranslationKey ]]
    if not v6 or v6 == "" then
        return "", "";
    else
        local v7 = string.split(v6, ".");
        if #v7 >= 3 then
            local v8 = v7[1] .. "." .. v7[2];
            local v9 = {};
            for v10 = 3, #v7 do
                table.insert(v9, v7[v10]);
            end;
            return v8, (table.concat(v9, "."));
        else
            return "", v6;
        end;
    end;
end;
return function(v12) --[[ Line: 71 ]] --[[ Name: RegisterAuditContent ]]
    -- upvalues: v5 (copy), l_useMemo_0 (copy), v11 (copy), l_dependencyArray_0 (copy), l_useCapturedAuditContent_0 (copy)
    if not v5() then
        return nil;
    else
        local l_translationKey_0 = v12.translationKey;
        local l_translatedSourceString_0 = v12.translatedSourceString;
        local l_parameters_0 = v12.parameters;
        local v18 = l_useMemo_0(function() --[[ Line: 80 ]]
            -- upvalues: l_translationKey_0 (copy), l_translatedSourceString_0 (copy), v11 (ref), l_parameters_0 (copy)
            if not l_translationKey_0 or not l_translatedSourceString_0 then
                return nil;
            else
                local v16, v17 = v11(l_translationKey_0);
                if v16 == "" then
                    return nil;
                else
                    return {
                        translationKey = v17, 
                        translationNamespace = v16, 
                        translatedSourceString = l_translatedSourceString_0, 
                        parameters = l_parameters_0
                    };
                end;
            end;
        end, l_dependencyArray_0(l_translationKey_0, l_translatedSourceString_0, l_parameters_0));
        l_useCapturedAuditContent_0(l_translationKey_0, v18);
        return nil;
    end;
end;