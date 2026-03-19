local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local l_SduiErrorType_0 = require(l_script_FirstAncestor_0.SduiErrors).SduiErrorType;
local v8 = require(l_script_FirstAncestor_0.SduiParseHelpers);
local l_SduiBuilderProcessingPhase_0 = v4.SduiBuilderProcessingPhase;
local l_ServerBindingPropMap_0 = require(l_Parent_0.SduiCompat).ServerBindingPropMap;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local function v12(v13, v14, v15, v16, v17, v18, v19) --[[ Line: 30 ]] --[[ Name: parseProps ]]
    -- upvalues: l_SduiBuilderProcessingPhase_0 (copy), l_FFlagSduiServerCompat_0 (copy), l_ServerBindingPropMap_0 (copy), v12 (copy), v3 (copy), l_SduiErrorType_0 (copy), v2 (copy), v8 (copy)
    if not v14 then
        return;
    else
        assert(v14, "props must exist");
        local v20 = v18 or v16.componentDefinitions:getPropParsers(v13);
        if not v20 then
            return;
        else
            assert(v20, "componentInterface must exist");
            for v21, v22 in v14 do
                local v23 = v20[v21];
                if v23 and (v19 ~= l_SduiBuilderProcessingPhase_0.Render or v16.componentDefinitions:doesParserRequireRenderContext(v23)) then
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 64 ]]
                        -- upvalues: v23 (copy), v22 (copy), l_FFlagSduiServerCompat_0 (ref), l_ServerBindingPropMap_0 (ref), v12 (ref), v13 (copy), v15 (copy), v16 (copy), v17 (copy), v19 (copy), v3 (ref)
                        if typeof(v23) == "table" then
                            if typeof(v22) ~= "table" then
                                error({
                                    message = ("Invalid input %* for prop. Expected table"):format((typeof(v22)))
                                });
                            end;
                            if l_FFlagSduiServerCompat_0 then
                                local v24 = nil;
                                for v25, _ in v22 do
                                    local v27 = l_ServerBindingPropMap_0[v25];
                                    if v27 then
                                        v24 = v24 or {};
                                        v24[v25] = v27;
                                    end;
                                end;
                                if v24 then
                                    for v28, v29 in v24 do
                                        v22[v29] = v22[v28];
                                    end;
                                end;
                            end;
                            v12(v13, v22, v15, v16, v17, v23, v19);
                            return v22;
                        elseif v22 == "NULL_PROP" then
                            return v3.None;
                        else
                            return v23(v22, v16, v17, v19);
                        end;
                    end);
                    if not l_status_0 then
                        v16.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParseProp, v2.Dictionary.union({
                            name = v15, 
                            componentType = v13, 
                            propName = v21, 
                            value = v8.stringifyValue(v22)
                        }, if typeof(l_result_0) == "table" then l_result_0 else if typeof(l_result_0) == "string" then {
                            message = l_result_0
                        } else {}), v16.appPage);
                        if typeof(l_result_0) == "table" then
                            if l_result_0.overrideValue then
                                v14[v21] = l_result_0.overrideValue;
                            else
                                v14[v21] = nil;
                            end;
                        end;
                    elseif l_result_0 == v3.None then
                        v14[v21] = nil;
                    else
                        v14[v21] = l_result_0;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
return v12;