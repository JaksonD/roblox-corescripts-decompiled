local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_Images_0 = require(l_Parent_0.FoundationImages).Images;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v7 = require(l_Parent_0.InputHandlers);
local v8 = require(l_script_FirstAncestor_0.executeAction);
local _ = require(l_script_FirstAncestor_0.SduiActionType);
local v10 = require(l_script_FirstAncestor_0.SduiBuilder);
local l_SduiBuilderProcessingPhase_0 = require(l_script_FirstAncestor_0.SduiBuilderTypes).SduiBuilderProcessingPhase;
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v14 = require(l_script_FirstAncestor_0.SduiResponsiveHelpers);
local v15 = require(l_script_FirstAncestor_0.SduiErrors);
local l_SduiErrorType_0 = v15.SduiErrorType;
local v17 = require(l_script_FirstAncestor_0.getSduiComponentWrapper);
local v18 = require(l_script_FirstAncestor_0.getSduiActionHandlerRegistry);
local v19 = require(l_script_FirstAncestor_0.ClientBinding.getSduiTokensStore);
local _ = require(l_script_FirstAncestor_0.SduiContentTypes);
local v21 = require(l_script_FirstAncestor_0.SduiParseHelpers);
local _ = require(l_script_FirstAncestor_0.SduiFocusNavigationTypes);
local l_FFlagSduiActionHandlerSharedRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionHandlerSharedRegistry;
local function _(v24) --[[ Line: 42 ]] --[[ Name: withErrorHandling ]]
    -- upvalues: v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
    return function(v25, v26, v27, v28) --[[ Line: 43 ]]
        -- upvalues: v24 (copy), v2 (ref), v21 (ref), l_SduiErrorType_0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v24 (ref), v25 (copy), v26 (copy), v27 (copy), v28 (copy)
            return v24(v25, v26, v27, v28);
        end);
        if l_status_0 then
            return l_result_0;
        else
            local v31 = v2.Dictionary.join(if typeof(l_result_0) == "table" then l_result_0 else if typeof(l_result_0) == "string" then {
                message = l_result_0
            } else {}, {
                value = v21.stringifyValue(v25)
            });
            v26.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v31, v26.appPage);
            if typeof(l_result_0) == "table" then
                return l_result_0.overrideValue;
            else
                return nil;
            end;
        end;
    end;
end;
local function v41(v33, v34, v35, v36) --[[ Line: 78 ]] --[[ Name: parseFoundationTokenHelper ]]
    -- upvalues: l_FFlagSduiActionHandlerSharedRegistry_0 (copy), v19 (copy)
    local v37 = typeof(v33);
    if v37 == v34 then
        return v33;
    else
        if v37 ~= "string" then
            error({
                parserName = v35, 
                message = ("Invalid inputType. Expect string. %*"):format(v37)
            });
        end;
        local v38 = if l_FFlagSduiActionHandlerSharedRegistry_0 then v19().getTokens(false, v36.appPage) else v36.dependencies.tokens;
        for _, v40 in (v33:split(".")) do
            if typeof(v38) == "table" then
                v38 = v38[v40];
            else
                error({
                    parserName = v35, 
                    message = ("Invalid path for token for input %*"):format(v33)
                });
            end;
            if v38 == nil then
                error({
                    parserName = v35, 
                    message = ("Nil tokens for input %*"):format(v33)
                });
            end;
        end;
        if typeof(v38) ~= v34 then
            error({
                parserName = v35, 
                message = ("Unexpected token type for %*. %* ~= %*"):format(v33, typeof(v38), v34)
            });
        end;
        return v38;
    end;
end;
local function v46(v42, v43, _, _) --[[ Line: 121 ]] --[[ Name: parseNumberToken ]]
    -- upvalues: v41 (copy)
    return (v41(v42, "number", "parseNumberToken", v43));
end;
local function v51(v47, v48, _, _) --[[ Line: 130 ]] --[[ Name: parseTypographyToken ]]
    -- upvalues: v41 (copy)
    return (v41(v47, "table", "parseTypographyToken", v48));
end;
local function v56(v52, v53, _, _) --[[ Line: 139 ]] --[[ Name: parseFontFromTypographyToken ]]
    -- upvalues: v41 (copy)
    return (v41(v52, "EnumItem", "parseFontFromTypographyToken", v53));
end;
local function v61(v57, v58, _, _) --[[ Line: 148 ]] --[[ Name: parseColorToken ]]
    -- upvalues: v41 (copy)
    return (v41(v57, "table", "parseColorToken", v58));
end;
local function v70(v62, v63, v64, v65) --[[ Line: 157 ]] --[[ Name: parseLuaTableEnumHelper ]]
    local v66 = typeof(v62);
    if v66 == v63 and v65[v62] then
        return v62;
    else
        if v66 ~= "string" then
            error({
                parserName = "parseLuaTableEnumHelper", 
                message = ("Invalid input type to parser: %*. Expected string."):format(v66)
            });
        end;
        local v67 = v64[v62];
        if v67 ~= nil then
            return v67;
        else
            local v68 = "";
            for v69 in v65 do
                v68 = v68 .. v69 .. ", ";
            end;
            error({
                parserName = "parseLuaTableEnumHelper", 
                message = ("Failed to parse lua table enum. input: %* validValues: %*"):format(v62, v68)
            });
            return;
        end;
    end;
end;
local v71 = {};
local _ = function(v72, v73) --[[ Line: 195 ]] --[[ Name: makeLuaTableEnumParser ]]
    -- upvalues: v70 (copy)
    local v74 = {};
    for _, v76 in v72 do
        v74[v76] = true;
    end;
    return function(v77, _, _, _) --[[ Line: 200 ]]
        -- upvalues: v70 (ref), v73 (copy), v72 (copy), v74 (copy)
        return v70(v77, v73, v72, v74);
    end;
end;
local function v92(v82, v83) --[[ Line: 210 ]] --[[ Name: getLuaTableEnumParser ]]
    -- upvalues: v71 (copy), v70 (copy)
    if v71[v82] == nil then
        local l_v71_0 = v71;
        local v85 = {};
        for _, v87 in v82 do
            v85[v87] = true;
        end;
        l_v71_0[v82] = function(v88, _, _, _) --[[ Line: 200 ]]
            -- upvalues: v70 (ref), v83 (copy), v82 (copy), v85 (copy)
            return v70(v88, v83, v82, v85);
        end;
    end;
    return v71[v82];
end;
local function v97(v93, v94) --[[ Line: 217 ]] --[[ Name: parseEngineEnumHelper ]]
    if typeof(v93) == "EnumItem" then
        return v93;
    else
        if typeof(v93) ~= "string" then
            error({
                parserName = "parseEngineEnumHelper", 
                message = ("Invalid input type Engine Enum value. Expect string. received %*"):format(v93)
            });
        end;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 228 ]]
            -- upvalues: v94 (copy), v93 (copy)
            return v94[v93];
        end);
        if l_status_1 then
            return l_result_1;
        else
            error({
                parserName = "parseEngineEnumHelper", 
                message = l_result_1
            });
            return;
        end;
    end;
end;
local v98 = {};
local _ = function(v99) --[[ Line: 244 ]] --[[ Name: makeEngineEnumParser ]]
    -- upvalues: v97 (copy)
    return function(v100, _, _, _) --[[ Line: 245 ]]
        -- upvalues: v97 (ref), v99 (copy)
        return v97(v100, v99);
    end;
end;
local function v110(v105) --[[ Line: 255 ]] --[[ Name: getEngineEnumParser ]]
    -- upvalues: v98 (copy), v97 (copy)
    if v98[v105] == nil then
        v98[v105] = function(v106, _, _, _) --[[ Line: 245 ]]
            -- upvalues: v97 (ref), v105 (copy)
            return v97(v106, v105);
        end;
    end;
    return v98[v105];
end;
local function v119(v111, _, _, _) --[[ Line: 265 ]] --[[ Name: parseUDim2 ]]
    local v115 = typeof(v111);
    if v115 == "UDim2" then
        return v111;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 276 ]]
            -- upvalues: v115 (copy), v111 (copy)
            if v115 == "string" then
                local v116 = string.split(v111, ",");
                if #v116 == 4 then
                    return UDim2.new(tonumber(v116[1]) or 0, tonumber(v116[2]) or 0, tonumber(v116[3]) or 0, tonumber(v116[4]) or 0);
                else
                    error("Not enough components in string to parse UDim2");
                    return;
                end;
            elseif v115 == "table" then
                if #v111 == 4 then
                    return UDim2.new(tonumber(v111[1]) or 0, tonumber(v111[2]) or 0, tonumber(v111[3]) or 0, tonumber(v111[4]) or 0);
                else
                    error("Not enough components in table to parse UDim2");
                    return;
                end;
            else
                error((("Invalid input type for parseUDim2: %*"):format(v115)));
                return;
            end;
        end);
        if l_status_2 and l_result_2 then
            return l_result_2;
        else
            error({
                parserName = "parseUDim2", 
                message = if typeof(l_result_2) == "string" then l_result_2 else nil
            });
            return;
        end;
    end;
end;
local function v128(v120, _, _, _) --[[ Line: 315 ]] --[[ Name: parseUDim ]]
    local v124 = typeof(v120);
    if v124 == "UDim" then
        return v120;
    else
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 326 ]]
            -- upvalues: v124 (copy), v120 (copy)
            if v124 == "string" then
                local v125 = string.split(v120, ",");
                if #v125 == 2 then
                    return UDim.new(tonumber(v125[1]) or 0, tonumber(v125[2]) or 0);
                else
                    error("Not enough components in string to parse UDim");
                    return;
                end;
            elseif v124 == "table" then
                if #v120 == 2 then
                    return UDim.new(tonumber(v120[1]) or 0, tonumber(v120[2]) or 0);
                else
                    error("Not enough components in table to parse UDim");
                    return;
                end;
            elseif v124 == "number" then
                return UDim.new(0, v120);
            else
                error((("Invalid input type for parseUDim: %*"):format(v124)));
                return;
            end;
        end);
        if l_status_3 and l_result_3 then
            return l_result_3;
        else
            error({
                parserName = "parseUDim", 
                message = if typeof(l_result_3) == "string" then l_result_3 else nil
            });
            return;
        end;
    end;
end;
local function v145(v129, v130, v131, v132) --[[ Line: 357 ]] --[[ Name: parseColor3 ]]
    -- upvalues: v41 (copy)
    local v133 = typeof(v129);
    if v133 == "Color3" then
        return v129;
    else
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 368 ]]
            -- upvalues: v133 (copy), v129 (copy), v130 (copy), v131 (copy), v132 (copy), v41 (ref)
            if v133 == "string" then
                local l_status_4, l_result_4 = pcall(function() --[[ Line: 371 ]]
                    -- upvalues: v129 (ref)
                    return Color3.fromHex(v129);
                end);
                if l_status_4 and l_result_4 then
                    return l_result_4;
                else
                    local v136 = nil;
                    local l_status_5, l_result_5 = pcall(function() --[[ Line: 381 ]]
                        -- upvalues: v129 (ref), v130 (ref), v131 (ref), v132 (ref), v41 (ref)
                        local l_v129_0 = v129;
                        local l_v130_0 = v130;
                        local _ = v131;
                        local _ = v132;
                        return (v41(l_v129_0, "table", "parseColorToken", l_v130_0));
                    end);
                    l_status_4 = l_status_5;
                    v136 = l_result_5;
                    if l_status_4 and typeof(v136) == "table" and v136.Color3 ~= nil then
                        return v136.Color3;
                    else
                        error((("Invalid input for Color3: %*"):format(v129)));
                        return;
                    end;
                end;
            elseif v133 == "table" then
                return Color3.fromRGB(v129.r, v129.g, v129.b);
            else
                error((("Invalid input type for parseColor3: %*"):format(v133)));
                return;
            end;
        end);
        if l_status_6 and l_result_6 then
            return l_result_6;
        else
            error({
                parserName = "parseColor3", 
                message = if typeof(l_result_6) == "string" then l_result_6 else if typeof(l_result_6) == "table" then l_result_6.message else nil
            });
            return;
        end;
    end;
end;
local v146 = Color3.new(0, 0, 0);
local v147 = {
    startColor = v146, 
    endColor = v146, 
    startOpacity = 0, 
    endOpacity = 1, 
    degree = 270
};
local function v149(v148) --[[ Line: 419 ]] --[[ Name: isValidGradient ]]
    if typeof(v148) ~= "table" then
        return false;
    elseif typeof(v148.startColor) ~= "Color3" then
        return false;
    elseif typeof(v148.endColor) ~= "Color3" then
        return false;
    elseif typeof(v148.startOpacity) ~= "number" then
        return false;
    elseif typeof(v148.endOpacity) ~= "number" then
        return false;
    elseif typeof(v148.degree) ~= "number" then
        return false;
    else
        return true;
    end;
end;
local function v165(v150, v151, v152, v153) --[[ Line: 443 ]] --[[ Name: parseGradient ]]
    -- upvalues: v149 (copy), v145 (copy), v147 (copy)
    local v154 = typeof(v150);
    if v154 == "table" then
        if v149(v150) then
            return v150;
        end;
    else
        error({
            parserName = "parseGradient", 
            message = ("invalid input type for parseGradient: %*"):format(v154)
        });
    end;
    local v155 = nil;
    local v156 = nil;
    if v150.startColor then
        local l_status_7, l_result_7 = pcall(function() --[[ Line: 463 ]]
            -- upvalues: v145 (ref), v150 (copy), v151 (copy), v152 (copy), v153 (copy)
            return v145(v150.startColor, v151, v152, v153);
        end);
        v155 = l_status_7;
        v156 = l_result_7;
        if not v155 then
            error({
                parserName = "parseGradient", 
                message = if typeof(v156) == "string" then v156 else "failed to parse startColor field"
            });
        end;
    else
        v156 = v147.startColor;
    end;
    local v159 = nil;
    if v150.endColor then
        local l_status_8, l_result_8 = pcall(function() --[[ Line: 478 ]]
            -- upvalues: v145 (ref), v150 (copy), v151 (copy), v152 (copy), v153 (copy)
            return v145(v150.endColor, v151, v152, v153);
        end);
        v155 = l_status_8;
        v159 = l_result_8;
        if not v155 then
            error({
                parserName = "parseGradient", 
                message = if typeof(v159) == "string" then v159 else "failed to parse endColor field"
            });
        end;
    else
        v159 = v147.endColor;
    end;
    local v162 = nil;
    if typeof(v150.startOpacity) == "number" then
        v162 = v150.startOpacity;
    elseif v150.startOpacity ~= nil then
        error({
            parserName = "parseGradient", 
            message = ("invalid input type for startOpacity: %*"):format((typeof(v150.startOpacity)))
        });
    end;
    local v163 = nil;
    if typeof(v150.endOpacity) == "number" then
        v163 = v150.endOpacity;
    elseif v150.endOpacity ~= nil then
        error({
            parserName = "parseGradient", 
            message = ("invalid input type for endOpacity: %*"):format((typeof(v150.endOpacity)))
        });
    end;
    local v164 = nil;
    if typeof(v150.degree) == "number" then
        v164 = v150.degree;
    elseif v150.degree ~= nil then
        error({
            parserName = "parseGradient", 
            message = ("invalid input type for degree: %*"):format((typeof(v150.degree)))
        });
    end;
    return {
        startColor = v156, 
        endColor = v159, 
        startOpacity = v162 or v147.startOpacity, 
        endOpacity = v163 or v147.endOpacity, 
        degree = v164 or v147.degree
    };
end;
local function v167(v166) --[[ Line: 530 ]] --[[ Name: isValidImageSet ]]
    if typeof(v166) == "table" and typeof(v166.ImageRectOffset) == "Vector2" and typeof(v166.Image) == "string" and typeof(v166.ImageRectSize) == "Vector2" then
        return true;
    else
        return false;
    end;
end;
local v168 = {
    truncate_arrows = true, 
    squircles = true, 
    gradient = true, 
    component_assets = true, 
    chat_bubble = true, 
    icons = true
};
local function _(v169) --[[ Line: 552 ]] --[[ Name: isValidIconString ]]
    -- upvalues: v168 (copy)
    local v170 = v169:split("/");
    if v170 and #v170 > 1 and v168[v170[1]] then
        return true;
    else
        return false;
    end;
end;
local function v180(v172, _, _, _) --[[ Line: 565 ]] --[[ Name: parseIcon ]]
    -- upvalues: l_GetImageData_0 (copy), l_Images_0 (copy)
    local v176 = nil;
    local v177 = nil;
    if typeof(v172) == "table" and typeof(v172.ImageRectOffset) == "Vector2" and typeof(v172.Image) == "string" and typeof(v172.ImageRectSize) == "Vector2" then
        return v172;
    else
        if typeof(v172) == "string" then
            local l_status_9, l_result_9 = pcall(function() --[[ Line: 575 ]]
                -- upvalues: l_GetImageData_0 (ref), v172 (copy), l_Images_0 (ref)
                return l_GetImageData_0(v172) or l_Images_0[v172];
            end);
            v176 = l_status_9;
            v177 = l_result_9;
            if not v176 or not v177 then
                error({
                    parserName = "parseIcon", 
                    message = ("No icon found for %*"):format(v172)
                });
            end;
        end;
        if not v177 then
            error({
                parserName = "parseIcon", 
                message = ("Bad input for icon: %*"):format(v172)
            });
        end;
        return v177;
    end;
end;
local function v185(v181, v182) --[[ Line: 596 ]] --[[ Name: isValidActionConfig ]]
    -- upvalues: l_FFlagSduiActionHandlerSharedRegistry_0 (copy), v18 (copy)
    if typeof(v181) == "table" and typeof(v181.actionType) == "string" then
        local v183 = if l_FFlagSduiActionHandlerSharedRegistry_0 then v18().getActionHandlerConfig(v181.actionType) else v182.actionHandlerRegistry:getActionHandlerConfig(v181.actionType);
        local v184 = false;
        if v183 ~= nil then
            v184 = v183.handler ~= nil;
        end;
        return v184;
    else
        return false;
    end;
end;
local function _(v186) --[[ Line: 608 ]] --[[ Name: isCallableTable ]]
    if typeof(v186) == "table" then
        local v187 = getmetatable(v186);
        if v187 and type(v187.__call) == "function" then
            return true;
        end;
    end;
    return false;
end;
local function v200(v189, v190, v191, _) --[[ Line: 619 ]] --[[ Name: parseCallback ]]
    -- upvalues: v185 (copy), v8 (copy), v15 (copy)
    local v193 = false;
    local v194 = typeof(v189);
    local v195 = nil;
    if v194 == "function" then
        return v189;
    else
        local v196;
        if typeof(v189) == "table" then
            local v197 = getmetatable(v189);
            if v197 and type(v197.__call) == "function" then
                v196 = true;
                v193 = true;
            end;
        end;
        if not v193 then
            v196 = false;
        end;
        v193 = false;
        if v196 then
            v189.analyticsContext = v191;
            v189.sduiContext = v190;
            return v189;
        else
            if v185(v189, v190) then
                v195 = v189;
            end;
            if v195 then
                v196 = {
                    analyticsContext = v191, 
                    sduiContext = v190
                };
                setmetatable(v196, {
                    __call = function(v198, v199) --[[ Line: 644 ]] --[[ Name: __call ]]
                        -- upvalues: v8 (ref), v195 (ref)
                        return v8(v195, v198.analyticsContext, v198.sduiContext, v199);
                    end
                });
                return v196;
            else
                v196 = typeof(v189) == "table" and v189.actionType or "unknown";
                error({
                    parserName = "parseCallback", 
                    message = ("Could not find action for: %* actionType: %*"):format(v189, v196), 
                    overrideValue = function() --[[ Line: 656 ]] --[[ Name: overrideValue ]]
                        -- upvalues: v190 (copy), v15 (ref), v196 (copy)
                        v190.dependencies.logger.reportCounter(v15.SduiCounterName.ExecutedInvalidAction, {
                            name = v196
                        });
                    end
                });
                return;
            end;
        end;
    end;
end;
local function v205(v201, _, _, _) --[[ Line: 666 ]] --[[ Name: parseLazyCallback ]]
    return v201;
end;
local function v214(v206, v207, v208, v209) --[[ Line: 676 ]] --[[ Name: parseLazyUiComponent ]]
    -- upvalues: l_SduiBuilderProcessingPhase_0 (copy), v10 (copy)
    if v209 == l_SduiBuilderProcessingPhase_0.Eager then
        local l_status_10, l_result_10 = pcall(function() --[[ Line: 684 ]]
            -- upvalues: v206 (copy), v10 (ref), v207 (copy), v208 (copy)
            if typeof(v206) ~= "table" then
                error((("Invalid input type %*"):format((typeof(v206)))));
            end;
            local v210, v211 = v10.tryCreateEagerProcessedComponentConfig(v206, v207, "parseUiComponent", v208);
            if v210 then
                return v211;
            else
                error("Unable to parse componentConfig during Eager phase");
                return;
            end;
        end);
        if l_status_10 and l_result_10 then
            return l_result_10;
        else
            error({
                parserName = "parseLazyUiComponent", 
                message = if typeof(l_result_10) == "string" then l_result_10 else nil
            });
            return;
        end;
    else
        return v206;
    end;
end;
local function v228(v215, v216, v217, v218) --[[ Line: 715 ]] --[[ Name: parseUiComponent ]]
    -- upvalues: l_SduiBuilderProcessingPhase_0 (copy), v10 (copy), v17 (copy), v3 (copy)
    local v219 = nil;
    local v220 = nil;
    if v218 == l_SduiBuilderProcessingPhase_0.Eager then
        local l_status_11, l_result_11 = pcall(function() --[[ Line: 725 ]]
            -- upvalues: v215 (copy), v10 (ref), v216 (copy), v217 (copy)
            if typeof(v215) ~= "table" then
                error((("Invalid input type %*"):format((typeof(v215)))));
            end;
            local v221, v222 = v10.tryCreateEagerProcessedComponentConfig(v215, v216, "parseUiComponent", v217);
            if v221 then
                return v222;
            else
                error("Unable to parse componentConfig during Eager phase");
                return;
            end;
        end);
        v219 = l_status_11;
        v220 = l_result_11;
    else
        local l_status_12, l_result_12 = pcall(function() --[[ Line: 743 ]]
            -- upvalues: v215 (copy), v17 (ref), v3 (ref), v216 (copy), v217 (copy)
            if typeof(v215) == "table" then
                local v225 = v17(v215);
                return v3.createElement(v225, {
                    componentConfig = v215, 
                    sduiContext = v216, 
                    parentAnalyticsContext = v217, 
                    debugName = ("parsedUiComponent-%*"):format(v215.componentType)
                });
            else
                error((("Invalid input type %*"):format((typeof(v215)))));
                return;
            end;
        end);
        v219 = l_status_12;
        v220 = l_result_12;
    end;
    if v219 and v220 then
        return v220;
    else
        error({
            parserName = "parseUiComponent", 
            message = if typeof(v220) == "string" then v220 else nil
        });
        return;
    end;
end;
local function v237(v229, _, _, _) --[[ Line: 770 ]] --[[ Name: parseVector2 ]]
    local v233 = typeof(v229);
    if v233 == "Vector2" then
        return v229;
    else
        local l_status_13, l_result_13 = pcall(function() --[[ Line: 781 ]]
            -- upvalues: v233 (copy), v229 (copy)
            if v233 == "string" then
                local v234 = string.split(v229, ",");
                if #v234 == 2 then
                    return Vector2.new(tonumber(v234[1]) or 0, tonumber(v234[2]) or 0);
                else
                    error("Not enough components in string to parse Vector2");
                    return;
                end;
            elseif v233 == "table" then
                if #v229 == 2 then
                    return Vector2.new(tonumber(v229[1]) or 0, tonumber(v229[2]) or 0);
                else
                    error("Not enough components in table to parse Vector2");
                    return;
                end;
            else
                error((("Invalid input type for parseVector2: %*"):format(v233)));
                return;
            end;
        end);
        if l_status_13 and l_result_13 then
            return l_result_13;
        else
            error({
                parserName = "parseVector2", 
                message = if typeof(l_result_13) == "string" then l_result_13 else nil
            });
            return;
        end;
    end;
end;
local function v251(v238, v239, v240, v241) --[[ Line: 809 ]] --[[ Name: parseNumber ]]
    -- upvalues: v41 (copy)
    local v242 = typeof(v238);
    if v242 == "number" then
        return v238;
    elseif v242 == "string" then
        local l_status_14, l_result_14 = pcall(function() --[[ Line: 819 ]]
            -- upvalues: v238 (copy)
            return (tonumber(v238));
        end);
        if not l_status_14 or l_result_14 == nil then
            local l_status_15, l_result_15 = pcall(function() --[[ Line: 825 ]]
                -- upvalues: v238 (copy), v239 (copy), v240 (copy), v241 (copy), v41 (ref)
                local l_v238_0 = v238;
                local l_v239_0 = v239;
                local _ = v240;
                local _ = v241;
                return (v41(l_v238_0, "number", "parseNumberToken", l_v239_0));
            end);
            l_status_14 = l_status_15;
            l_result_14 = l_result_15;
        end;
        if l_status_14 and l_result_14 then
            return l_result_14;
        else
            error({
                parserName = "parseNumber", 
                message = if typeof(l_result_14) == "string" then l_result_14 else ("Failed to parse string %* to number"):format(v238)
            });
            return;
        end;
    else
        error({
            parserName = "parseNumber", 
            message = ("Invalid input type for parseNumber: %*"):format(v242)
        });
        return;
    end;
end;
local function v259(v252, _, _, _) --[[ Line: 845 ]] --[[ Name: parseInteger ]]
    local v256 = typeof(v252);
    if v256 == "number" then
        return v252;
    elseif v256 == "string" then
        local l_status_16, l_result_16 = pcall(function() --[[ Line: 855 ]]
            -- upvalues: v252 (copy)
            return (tonumber(v252));
        end);
        if l_status_16 and l_result_16 then
            if v252 ~= tostring((math.round(l_result_16))) then
                error({
                    parserName = "parseInteger", 
                    message = if typeof(l_result_16) == "string" then l_result_16 else ("Unexpected output %* does not match input %*."):format(l_result_16, v252)
                });
            end;
            return l_result_16;
        else
            error({
                parserName = "parseInteger", 
                message = if typeof(l_result_16) == "string" then l_result_16 else ("Failed to parse string %* to number"):format(v252)
            });
            return;
        end;
    else
        error({
            parserName = "parseInteger", 
            message = ("Invalid input type for parseInteger: %*"):format(v256)
        });
        return;
    end;
end;
local function v266(v260, _, _, _) --[[ Line: 883 ]] --[[ Name: parseBoolean ]]
    local v264 = typeof(v260);
    if v264 == "boolean" then
        return v260;
    elseif v264 == "number" then
        if v260 == 1 then
            return true;
        elseif v260 == 0 then
            return false;
        else
            error({
                parserName = "parseBoolean", 
                message = ("Failed to parse number %* to boolean"):format(v260)
            });
            return;
        end;
    elseif v264 == "string" then
        local v265 = string.lower(v260);
        if v265 == "t" or v265 == "true" then
            return true;
        elseif v265 == "f" or v265 == "false" then
            return false;
        else
            error({
                parserName = "parseBoolean", 
                message = ("Failed to parse string %* to boolean"):format(v260)
            });
            return;
        end;
    else
        error({
            parserName = "parseBoolean", 
            message = ("Invalid input type for parseBoolean: %*"):format(v264)
        });
        return;
    end;
end;
local function v272(v267, _, _, _) --[[ Line: 921 ]] --[[ Name: parseString ]]
    local v271 = typeof(v267);
    if v271 == "string" then
        return v267;
    elseif v271 == "number" or v271 == "boolean" then
        return (tostring(v267));
    else
        error({
            parserName = "parseString", 
            message = ("Invalid input type for parseString: %*"):format(v271)
        });
        return;
    end;
end;
local function v293(v273, _, _, _) --[[ Line: 942 ]] --[[ Name: parseImageString ]]
    -- upvalues: v14 (copy)
    local v277 = typeof(v273);
    if v277 ~= "string" then
        error({
            parserName = "parseImageString", 
            message = ("Invalid input type for parseImageString: %*"):format(v277)
        });
    end;
    local v278 = v273:split("://");
    local v279 = false;
    if #v278 > 1 then
        v279 = v278[1] == "rbxthumb";
    end;
    if not v279 then
        return v273;
    else
        local v280 = {};
        for _, v282 in (v278[2]:split("&")) do
            local v283 = v282:split("=");
            if #v283 == 2 then
                v280[v283[1]] = v283[2];
            end;
        end;
        if v280.mw == nil or v280.mh == nil then
            return v273;
        else
            local v284 = tonumber(v280.w);
            local v285 = tonumber(v280.h);
            local v286 = tonumber(v280.mw);
            local v287 = tonumber(v280.mh);
            if v284 == nil or v285 == nil or v286 == nil or v287 == nil or v280.type == nil or v280.id == nil then
                error({
                    parserName = "parseImageString", 
                    message = ("Invalid params for rbxthumb in parseImageString: %*"):format(v273)
                });
            end;
            assert(v284, "inputWidth must exist");
            assert(v285, "inputHeight must exist");
            assert(v286, "inputWidth must exist");
            assert(v287, "inputHeight must exist");
            local v288, v289 = v14.adaptThumbnailDimensions(v284, v285, v286, v287, v280.type);
            local v290 = ("rbxthumb://type=%*&id=%*&w=%*&h=%*"):format(v280.type, v280.id, v288, v289);
            v280.w = nil;
            v280.h = nil;
            v280.mw = nil;
            v280.mh = nil;
            v280.id = nil;
            v280.type = nil;
            for v291, v292 in v280 do
                v290 = v290 .. string.format("&%s=%s", v291, v292);
            end;
            return v290;
        end;
    end;
end;
local function v300(v294, v295, v296, v297) --[[ Line: 1018 ]] --[[ Name: parseImageSetOrImage ]]
    -- upvalues: v168 (copy), v180 (copy), v293 (copy)
    local v298 = typeof(v294);
    if v298 == "table" then
        return v294;
    else
        if v298 ~= "string" then
            error({
                parserName = "parseImageSetOrImage", 
                message = ("Invalid input type for parseImageSetOrImage: %*"):format(v298)
            });
        end;
        local v299 = v294:split("/");
        if if v299 then #v299 > 1 and (v168[v299[1]] and true or false) else false then
            return (v180(v294, v295, v296, v297));
        else
            return (v293(v294, v295, v296, v297));
        end;
    end;
end;
local function v310(v301) --[[ Line: 1040 ]] --[[ Name: isValidFocusNavActions ]]
    -- upvalues: l_FocusNavigationEventNameEnum_0 (copy)
    if typeof(v301) ~= "table" then
        return false;
    else
        local v302 = nil;
        local v303 = nil;
        local l_keys_0 = v301.keys;
        if l_keys_0 then
            if typeof(l_keys_0) ~= "table" then
                return false;
            else
                for v305, v306 in l_keys_0 do
                    if typeof(v305) ~= "EnumItem" then
                        return false;
                    elseif l_FocusNavigationEventNameEnum_0[v306] == nil then
                        return false;
                    else
                        v302 = true;
                    end;
                end;
            end;
        end;
        local l_events_0 = v301.events;
        if l_events_0 then
            if typeof(l_events_0) ~= "table" then
                return false;
            else
                for v308, v309 in l_events_0 do
                    if l_FocusNavigationEventNameEnum_0[v308] == nil then
                        return false;
                    elseif typeof(v309) ~= "table" then
                        return false;
                    elseif typeof(v309.handler) ~= "function" then
                        return false;
                    else
                        v303 = true;
                    end;
                end;
            end;
        end;
        return v302 or v303 or false;
    end;
end;
local function v346(v311, v312, v313, v314) --[[ Line: 1098 ]] --[[ Name: parseFocusNavActions ]]
    -- upvalues: v310 (copy), l_FocusNavigationEventNameEnum_0 (copy), v71 (copy), v70 (copy), v98 (copy), v97 (copy), v7 (copy), v200 (copy)
    if v310(v311) then
        return v311;
    else
        local v315 = typeof(v311);
        if v315 ~= "table" then
            error({
                parserName = "parseFocusNavActions", 
                message = ("Invalid input type for parseFocusNavActions: %*"):format(v315)
            });
        end;
        assert(typeof(v311) == "table", "input must be table");
        local l_status_17, l_result_17 = pcall(function() --[[ Line: 1117 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v71 (ref), v70 (ref), v311 (copy), v315 (copy), v98 (ref), v97 (ref), v312 (copy), v313 (copy), v314 (copy), v7 (ref), v200 (ref)
            local l_l_FocusNavigationEventNameEnum_0_0 = l_FocusNavigationEventNameEnum_0;
            if v71[l_l_FocusNavigationEventNameEnum_0_0] == nil then
                local l_v71_1 = v71;
                local v318 = {};
                for _, v320 in l_l_FocusNavigationEventNameEnum_0_0 do
                    v318[v320] = true;
                end;
                local v321 = "string";
                local l_v321_0 = v321 --[[ copy: 5 -> 12 ]];
                local l_l_l_FocusNavigationEventNameEnum_0_0_0 = l_l_FocusNavigationEventNameEnum_0_0 --[[ copy: 1 -> 13 ]];
                local l_v318_0 = v318 --[[ copy: 4 -> 14 ]];
                l_v71_1[l_l_FocusNavigationEventNameEnum_0_0] = function(v325, _, _, _) --[[ Line: 200 ]]
                    -- upvalues: v70 (ref), l_v321_0 (copy), l_l_l_FocusNavigationEventNameEnum_0_0_0 (copy), l_v318_0 (copy)
                    return v70(v325, l_v321_0, l_l_l_FocusNavigationEventNameEnum_0_0_0, l_v318_0);
                end;
            end;
            local v329 = v71[l_l_FocusNavigationEventNameEnum_0_0];
            l_l_FocusNavigationEventNameEnum_0_0 = nil;
            local v330 = nil;
            local l_keys_1 = v311.keys;
            if l_keys_1 then
                if typeof(l_keys_1) ~= "table" then
                    error({
                        parserName = "parseFocusNavActions", 
                        message = ("Invalid input type for keys: %*"):format(v315)
                    });
                end;
                assert(typeof(l_keys_1) == "table", "keys must be table");
                local l_KeyCode_0 = Enum.KeyCode;
                if v98[l_KeyCode_0] == nil then
                    v98[l_KeyCode_0] = function(v333, _, _, _) --[[ Line: 245 ]]
                        -- upvalues: v97 (ref), l_KeyCode_0 (copy)
                        return v97(v333, l_KeyCode_0);
                    end;
                end;
                local v337 = v98[l_KeyCode_0];
                for v338, v339 in l_keys_1 do
                    local v340 = nil;
                    if typeof(v338) == "string" then
                        l_keys_1[v338] = nil;
                        v340 = v337(v338, v312, v313, v314);
                    end;
                    l_keys_1[v340] = v329(v339, v312, v313, v314);
                    l_l_FocusNavigationEventNameEnum_0_0 = true;
                end;
            end;
            local l_events_1 = v311.events;
            if l_events_1 then
                if typeof(l_events_1) ~= "table" then
                    error({
                        parserName = "parseFocusNavActions", 
                        message = ("Invalid input type for events: %*"):format(v315)
                    });
                end;
                assert(typeof(l_events_1) == "table", "events must be table");
                for v342, v343 in l_events_1 do
                    if typeof(v343) == "table" and typeof(v343.handler) ~= "function" then
                        l_events_1[v342] = nil;
                        l_events_1[v329(v342, v312, v313, v314)] = {
                            handler = v7.onRelease(v200(v343, v312, v313, v314))
                        };
                        v330 = true;
                    end;
                end;
            end;
            if not l_l_FocusNavigationEventNameEnum_0_0 and not v330 then
                error("Invalid format. keys or events required");
            end;
            return {
                keys = l_keys_1, 
                events = l_events_1
            };
        end);
        if l_status_17 and l_result_17 then
            return l_result_17;
        elseif typeof(l_result_17) == "table" then
            l_result_17.parserName = "parseFocusNavActions";
            l_result_17.overrideValue = nil;
            error(l_result_17);
            return;
        else
            error({
                parserName = "parseFocusNavActions", 
                message = if typeof(l_result_17) == "string" then l_result_17 else "Failed to parse focus nav event"
            });
            return;
        end;
    end;
end;
local v347 = {};
return {
    parseBooleanProp_ = v266, 
    parseCallbackProp_ = v200, 
    parseColor3Prop_ = v145, 
    parseGradientProp_ = v165, 
    parseIconProp_ = v180, 
    parseImageStringProp_ = v293, 
    parseIntegerProp_ = v259, 
    parseLazyCallbackProp_ = v205, 
    parseLazyUiComponentProp_ = v214, 
    parseNumberProp_ = v251, 
    parseStringProp_ = v272, 
    parseUDimProp_ = v128, 
    parseUDim2Prop_ = v119, 
    parseUiComponentProp_ = v228, 
    parseVector2Prop_ = v237, 
    parseNumberTokenProp_ = v46, 
    parseTypographyTokenProp_ = v51, 
    parseColorTokenProp_ = v61, 
    parseFontFromTypographyTokenProp_ = v56, 
    parseFocusNavActionsProp_ = v346, 
    parseImageSetOrImageProp_ = v300, 
    getArrayMetatableParser = function(v348) --[[ Line: 1198 ]] --[[ Name: getArrayMetatableParser ]]
        -- upvalues: v347 (copy)
        if v347[v348] == nil then
            v347[v348] = setmetatable({}, {
                __index = function(_, v350) --[[ Line: 1201 ]] --[[ Name: __index ]]
                    -- upvalues: v348 (copy)
                    if type(v350) == "number" then
                        return v348;
                    else
                        return nil;
                    end;
                end
            });
        end;
        return v347[v348];
    end, 
    getEngineEnumParser = v110, 
    getLuaTableEnumParser = v92, 
    isValidActionConfig = v185, 
    isValidImageSet = v167, 
    isValidGradient = v149, 
    isValidFocusNavActions = v310, 
    safeParseBoolean = function(v351, v352, v353, v354) --[[ Line: 43 ]]
        -- upvalues: v266 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_18, l_result_18 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v266 (ref), v351 (copy), v352 (copy), v353 (copy), v354 (copy)
            return v266(v351, v352, v353, v354);
        end);
        if l_status_18 then
            return l_result_18;
        else
            local v357 = v2.Dictionary.join(if typeof(l_result_18) == "table" then l_result_18 else if typeof(l_result_18) == "string" then {
                message = l_result_18
            } else {}, {
                value = v21.stringifyValue(v351)
            });
            v352.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v357, v352.appPage);
            if typeof(l_result_18) == "table" then
                return l_result_18.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseCallback = function(v358, v359, v360, v361) --[[ Line: 43 ]]
        -- upvalues: v200 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_19, l_result_19 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v200 (ref), v358 (copy), v359 (copy), v360 (copy), v361 (copy)
            return v200(v358, v359, v360, v361);
        end);
        if l_status_19 then
            return l_result_19;
        else
            local v364 = v2.Dictionary.join(if typeof(l_result_19) == "table" then l_result_19 else if typeof(l_result_19) == "string" then {
                message = l_result_19
            } else {}, {
                value = v21.stringifyValue(v358)
            });
            v359.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v364, v359.appPage);
            if typeof(l_result_19) == "table" then
                return l_result_19.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseColor3 = function(v365, v366, v367, v368) --[[ Line: 43 ]]
        -- upvalues: v145 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_20, l_result_20 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v145 (ref), v365 (copy), v366 (copy), v367 (copy), v368 (copy)
            return v145(v365, v366, v367, v368);
        end);
        if l_status_20 then
            return l_result_20;
        else
            local v371 = v2.Dictionary.join(if typeof(l_result_20) == "table" then l_result_20 else if typeof(l_result_20) == "string" then {
                message = l_result_20
            } else {}, {
                value = v21.stringifyValue(v365)
            });
            v366.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v371, v366.appPage);
            if typeof(l_result_20) == "table" then
                return l_result_20.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseGradient = function(v372, v373, v374, v375) --[[ Line: 43 ]]
        -- upvalues: v165 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_21, l_result_21 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v165 (ref), v372 (copy), v373 (copy), v374 (copy), v375 (copy)
            return v165(v372, v373, v374, v375);
        end);
        if l_status_21 then
            return l_result_21;
        else
            local v378 = v2.Dictionary.join(if typeof(l_result_21) == "table" then l_result_21 else if typeof(l_result_21) == "string" then {
                message = l_result_21
            } else {}, {
                value = v21.stringifyValue(v372)
            });
            v373.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v378, v373.appPage);
            if typeof(l_result_21) == "table" then
                return l_result_21.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseIcon = function(v379, v380, v381, v382) --[[ Line: 43 ]]
        -- upvalues: v180 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_22, l_result_22 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v180 (ref), v379 (copy), v380 (copy), v381 (copy), v382 (copy)
            return v180(v379, v380, v381, v382);
        end);
        if l_status_22 then
            return l_result_22;
        else
            local v385 = v2.Dictionary.join(if typeof(l_result_22) == "table" then l_result_22 else if typeof(l_result_22) == "string" then {
                message = l_result_22
            } else {}, {
                value = v21.stringifyValue(v379)
            });
            v380.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v385, v380.appPage);
            if typeof(l_result_22) == "table" then
                return l_result_22.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseImageString = function(v386, v387, v388, v389) --[[ Line: 43 ]]
        -- upvalues: v293 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_23, l_result_23 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v293 (ref), v386 (copy), v387 (copy), v388 (copy), v389 (copy)
            return v293(v386, v387, v388, v389);
        end);
        if l_status_23 then
            return l_result_23;
        else
            local v392 = v2.Dictionary.join(if typeof(l_result_23) == "table" then l_result_23 else if typeof(l_result_23) == "string" then {
                message = l_result_23
            } else {}, {
                value = v21.stringifyValue(v386)
            });
            v387.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v392, v387.appPage);
            if typeof(l_result_23) == "table" then
                return l_result_23.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseInteger = function(v393, v394, v395, v396) --[[ Line: 43 ]]
        -- upvalues: v259 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_24, l_result_24 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v259 (ref), v393 (copy), v394 (copy), v395 (copy), v396 (copy)
            return v259(v393, v394, v395, v396);
        end);
        if l_status_24 then
            return l_result_24;
        else
            local v399 = v2.Dictionary.join(if typeof(l_result_24) == "table" then l_result_24 else if typeof(l_result_24) == "string" then {
                message = l_result_24
            } else {}, {
                value = v21.stringifyValue(v393)
            });
            v394.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v399, v394.appPage);
            if typeof(l_result_24) == "table" then
                return l_result_24.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseNumber = function(v400, v401, v402, v403) --[[ Line: 43 ]]
        -- upvalues: v251 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_25, l_result_25 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v251 (ref), v400 (copy), v401 (copy), v402 (copy), v403 (copy)
            return v251(v400, v401, v402, v403);
        end);
        if l_status_25 then
            return l_result_25;
        else
            local v406 = v2.Dictionary.join(if typeof(l_result_25) == "table" then l_result_25 else if typeof(l_result_25) == "string" then {
                message = l_result_25
            } else {}, {
                value = v21.stringifyValue(v400)
            });
            v401.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v406, v401.appPage);
            if typeof(l_result_25) == "table" then
                return l_result_25.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseString = function(v407, v408, v409, v410) --[[ Line: 43 ]]
        -- upvalues: v272 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_26, l_result_26 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v272 (ref), v407 (copy), v408 (copy), v409 (copy), v410 (copy)
            return v272(v407, v408, v409, v410);
        end);
        if l_status_26 then
            return l_result_26;
        else
            local v413 = v2.Dictionary.join(if typeof(l_result_26) == "table" then l_result_26 else if typeof(l_result_26) == "string" then {
                message = l_result_26
            } else {}, {
                value = v21.stringifyValue(v407)
            });
            v408.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v413, v408.appPage);
            if typeof(l_result_26) == "table" then
                return l_result_26.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseUDim = function(v414, v415, v416, v417) --[[ Line: 43 ]]
        -- upvalues: v128 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_27, l_result_27 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v128 (ref), v414 (copy), v415 (copy), v416 (copy), v417 (copy)
            return v128(v414, v415, v416, v417);
        end);
        if l_status_27 then
            return l_result_27;
        else
            local v420 = v2.Dictionary.join(if typeof(l_result_27) == "table" then l_result_27 else if typeof(l_result_27) == "string" then {
                message = l_result_27
            } else {}, {
                value = v21.stringifyValue(v414)
            });
            v415.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v420, v415.appPage);
            if typeof(l_result_27) == "table" then
                return l_result_27.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseUDim2 = function(v421, v422, v423, v424) --[[ Line: 43 ]]
        -- upvalues: v119 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_28, l_result_28 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v119 (ref), v421 (copy), v422 (copy), v423 (copy), v424 (copy)
            return v119(v421, v422, v423, v424);
        end);
        if l_status_28 then
            return l_result_28;
        else
            local v427 = v2.Dictionary.join(if typeof(l_result_28) == "table" then l_result_28 else if typeof(l_result_28) == "string" then {
                message = l_result_28
            } else {}, {
                value = v21.stringifyValue(v421)
            });
            v422.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v427, v422.appPage);
            if typeof(l_result_28) == "table" then
                return l_result_28.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseUiComponent = function(v428, v429, v430, v431) --[[ Line: 43 ]]
        -- upvalues: v228 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_29, l_result_29 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v228 (ref), v428 (copy), v429 (copy), v430 (copy), v431 (copy)
            return v228(v428, v429, v430, v431);
        end);
        if l_status_29 then
            return l_result_29;
        else
            local v434 = v2.Dictionary.join(if typeof(l_result_29) == "table" then l_result_29 else if typeof(l_result_29) == "string" then {
                message = l_result_29
            } else {}, {
                value = v21.stringifyValue(v428)
            });
            v429.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v434, v429.appPage);
            if typeof(l_result_29) == "table" then
                return l_result_29.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseVector2 = function(v435, v436, v437, v438) --[[ Line: 43 ]]
        -- upvalues: v237 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_30, l_result_30 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v237 (ref), v435 (copy), v436 (copy), v437 (copy), v438 (copy)
            return v237(v435, v436, v437, v438);
        end);
        if l_status_30 then
            return l_result_30;
        else
            local v441 = v2.Dictionary.join(if typeof(l_result_30) == "table" then l_result_30 else if typeof(l_result_30) == "string" then {
                message = l_result_30
            } else {}, {
                value = v21.stringifyValue(v435)
            });
            v436.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v441, v436.appPage);
            if typeof(l_result_30) == "table" then
                return l_result_30.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseNumberToken = function(v442, v443, v444, v445) --[[ Line: 43 ]]
        -- upvalues: v46 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_31, l_result_31 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v46 (ref), v442 (copy), v443 (copy), v444 (copy), v445 (copy)
            return v46(v442, v443, v444, v445);
        end);
        if l_status_31 then
            return l_result_31;
        else
            local v448 = v2.Dictionary.join(if typeof(l_result_31) == "table" then l_result_31 else if typeof(l_result_31) == "string" then {
                message = l_result_31
            } else {}, {
                value = v21.stringifyValue(v442)
            });
            v443.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v448, v443.appPage);
            if typeof(l_result_31) == "table" then
                return l_result_31.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseTypographyToken = function(v449, v450, v451, v452) --[[ Line: 43 ]]
        -- upvalues: v51 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_32, l_result_32 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v51 (ref), v449 (copy), v450 (copy), v451 (copy), v452 (copy)
            return v51(v449, v450, v451, v452);
        end);
        if l_status_32 then
            return l_result_32;
        else
            local v455 = v2.Dictionary.join(if typeof(l_result_32) == "table" then l_result_32 else if typeof(l_result_32) == "string" then {
                message = l_result_32
            } else {}, {
                value = v21.stringifyValue(v449)
            });
            v450.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v455, v450.appPage);
            if typeof(l_result_32) == "table" then
                return l_result_32.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseFontFromTypographyToken = function(v456, v457, v458, v459) --[[ Line: 43 ]]
        -- upvalues: v56 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_33, l_result_33 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v56 (ref), v456 (copy), v457 (copy), v458 (copy), v459 (copy)
            return v56(v456, v457, v458, v459);
        end);
        if l_status_33 then
            return l_result_33;
        else
            local v462 = v2.Dictionary.join(if typeof(l_result_33) == "table" then l_result_33 else if typeof(l_result_33) == "string" then {
                message = l_result_33
            } else {}, {
                value = v21.stringifyValue(v456)
            });
            v457.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v462, v457.appPage);
            if typeof(l_result_33) == "table" then
                return l_result_33.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseColorToken = function(v463, v464, v465, v466) --[[ Line: 43 ]]
        -- upvalues: v61 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_34, l_result_34 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v61 (ref), v463 (copy), v464 (copy), v465 (copy), v466 (copy)
            return v61(v463, v464, v465, v466);
        end);
        if l_status_34 then
            return l_result_34;
        else
            local v469 = v2.Dictionary.join(if typeof(l_result_34) == "table" then l_result_34 else if typeof(l_result_34) == "string" then {
                message = l_result_34
            } else {}, {
                value = v21.stringifyValue(v463)
            });
            v464.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v469, v464.appPage);
            if typeof(l_result_34) == "table" then
                return l_result_34.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseFocusNavActions = function(v470, v471, v472, v473) --[[ Line: 43 ]]
        -- upvalues: v346 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_35, l_result_35 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v346 (ref), v470 (copy), v471 (copy), v472 (copy), v473 (copy)
            return v346(v470, v471, v472, v473);
        end);
        if l_status_35 then
            return l_result_35;
        else
            local v476 = v2.Dictionary.join(if typeof(l_result_35) == "table" then l_result_35 else if typeof(l_result_35) == "string" then {
                message = l_result_35
            } else {}, {
                value = v21.stringifyValue(v470)
            });
            v471.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v476, v471.appPage);
            if typeof(l_result_35) == "table" then
                return l_result_35.overrideValue;
            else
                return nil;
            end;
        end;
    end, 
    safeParseImageSetOrImageProp_ = function(v477, v478, v479, v480) --[[ Line: 43 ]]
        -- upvalues: v300 (copy), v2 (copy), v21 (copy), l_SduiErrorType_0 (copy)
        local l_status_36, l_result_36 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: v300 (ref), v477 (copy), v478 (copy), v479 (copy), v480 (copy)
            return v300(v477, v478, v479, v480);
        end);
        if l_status_36 then
            return l_result_36;
        else
            local v483 = v2.Dictionary.join(if typeof(l_result_36) == "table" then l_result_36 else if typeof(l_result_36) == "string" then {
                message = l_result_36
            } else {}, {
                value = v21.stringifyValue(v477)
            });
            v478.dependencies.logger.reportError(l_SduiErrorType_0.FailedToParse, v483, v478.appPage);
            if typeof(l_result_36) == "table" then
                return l_result_36.overrideValue;
            else
                return nil;
            end;
        end;
    end
};