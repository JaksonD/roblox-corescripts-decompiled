local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_normalize_0 = require(l_Parent_0.AvatarExperienceCommon).Utils.normalize;
local l_normalizeBoolean_0 = l_normalize_0.normalizeBoolean;
local l_normalizeString_0 = l_normalize_0.normalizeString;
local l_normalizeNumber_0 = l_normalize_0.normalizeNumber;
local l_makeNormalizeTableFn_0 = l_normalize_0.makeNormalizeTableFn;
local l_normalizeNotEmptyString_0 = l_normalize_0.normalizeNotEmptyString;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_script_FirstAncestor_0.Models.CatalogCategories);
local v10 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesSDUITaxonomy_0 = v10.FFlagAXCatalogCategoriesSDUITaxonomy;
local l_FFlagAXLooksWidgetContextForOrganicContent_0 = v10.FFlagAXLooksWidgetContextForOrganicContent;
local l_FFlagAXCatalogCategoriesSDUIPillTitleNormalization_0 = v10.FFlagAXCatalogCategoriesSDUIPillTitleNormalization;
local function _() --[[ Line: 22 ]] --[[ Name: SearchUuid ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:GenerateGUID(true);
end;
local function v19(v15) --[[ Line: 40 ]] --[[ Name: extractShowCatalogContentActionRequestParams ]]
    local v16 = nil;
    if v15.props and v15.props.OnActivated then
        for _, v18 in v15.props.OnActivated do
            if v18.componentType == "ShowCatalogContentAction" then
                return v18.props and v18.props.requestParams;
            end;
        end;
    end;
    return v16;
end;
local function v24(v20) --[[ Line: 54 ]] --[[ Name: extractWidgetContext ]]
    local v21 = nil;
    if v20.props and v20.props.OnActivated then
        for _, v23 in v20.props.OnActivated do
            if v23.componentType == "ShowWidgetContentAction" then
                return v23.props and v23.props.requestParams and v23.props.requestParams.context;
            end;
        end;
    end;
    return v21;
end;
local function _(v25) --[[ Line: 70 ]] --[[ Name: stringToBoolean ]]
    if type(v25) == "boolean" then
        return v25, nil;
    elseif type(v25) == "string" then
        if v25 == "True" then
            return true, nil;
        elseif v25 == "False" then
            return false, nil;
        else
            return nil, "Invalid boolean string value, expected \"True\" or \"False\"";
        end;
    else
        return nil, "Expected boolean or string";
    end;
end;
local function v32(v27) --[[ Line: 89 ]] --[[ Name: splitCommaSeparatedString ]]
    if not v27 or v27 == "" then
        return nil;
    else
        local v28 = string.split(v27, ",");
        local v29 = {};
        for _, v31 in v28 do
            if v31 ~= "" then
                table.insert(v29, v31);
            end;
        end;
        return #v29 > 0 and v29 or nil;
    end;
end;
local function _(v33) --[[ Line: 106 ]] --[[ Name: normalizeAssetTypeIdStrings ]]
    -- upvalues: v19 (copy), l_normalizeString_0 (copy), v32 (copy)
    local v34 = v19(v33);
    local v35 = v34 and v34.assetTypeIds;
    if v35 == nil or v35 == "" then
        return nil, nil;
    else
        local v36, v37 = l_normalizeString_0(v35);
        if v37 then
            return nil, v37;
        else
            return v32(v36), nil;
        end;
    end;
end;
local function _(v39) --[[ Line: 124 ]] --[[ Name: normalizeBundleTypes ]]
    -- upvalues: v19 (copy), l_normalizeString_0 (copy), v32 (copy)
    local v40 = v19(v39);
    local v41 = v40 and v40.bundleTypeIds;
    if v41 == nil or v41 == "" then
        return nil, nil;
    else
        local v42, v43 = l_normalizeString_0(v41);
        if v43 then
            return nil, v43;
        else
            return v32(v42), nil;
        end;
    end;
end;
local function _(v45) --[[ Line: 142 ]] --[[ Name: normalizeTaxonomy ]]
    -- upvalues: v19 (copy), l_normalizeNotEmptyString_0 (copy)
    local v46 = v19(v45);
    local v47 = v46 and v46.taxonomyId;
    local v48, v49 = l_normalizeNotEmptyString_0(v47);
    return v48, v49;
end;
local function _(v51) --[[ Line: 151 ]] --[[ Name: normalizeWidgetContext ]]
    -- upvalues: v24 (copy)
    return v24(v51), nil;
end;
local function _() --[[ Line: 157 ]] --[[ Name: normalizeSearchUuid ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:GenerateGUID(true), nil;
end;
local _ = function(v54) --[[ Line: 163 ]] --[[ Name: normalizePillTitle ]]
    -- upvalues: l_FFlagAXCatalogCategoriesSDUIPillTitleNormalization_0 (copy), l_normalizeNotEmptyString_0 (copy), l_normalizeString_0 (copy)
    local v55 = v54.props and v54.props.pillTitle;
    local _ = nil;
    local _ = nil;
    if l_FFlagAXCatalogCategoriesSDUIPillTitleNormalization_0 then
        local v58, v59 = l_normalizeNotEmptyString_0(v55);
        return v58, v59;
    else
        local v60, v61 = l_normalizeString_0(v55);
        return v60, v61;
    end;
end;
local _ = function(v63) --[[ Line: 175 ]] --[[ Name: normalizePillId ]]
    -- upvalues: l_FFlagAXCatalogCategoriesSDUIPillTitleNormalization_0 (copy), l_normalizeNotEmptyString_0 (copy), l_normalizeString_0 (copy)
    local v64 = v63.props and v63.props.pillId;
    local _ = nil;
    local _ = nil;
    if l_FFlagAXCatalogCategoriesSDUIPillTitleNormalization_0 then
        local v67, v68 = l_normalizeNotEmptyString_0(v64);
        return v67, v68;
    else
        local v69, v70 = l_normalizeString_0(v64);
        return v69, v70;
    end;
end;
local function _(v72) --[[ Line: 187 ]] --[[ Name: normalizeTimeToRefresh ]]
    -- upvalues: l_normalizeNumber_0 (copy)
    local v73 = v72.props and v72.props.timeToRefresh;
    if v73 == nil or v73 == "" then
        return nil, nil;
    else
        if type(v73) == "string" then
            v73 = tonumber(v73);
        end;
        if v73 == nil then
            return nil, nil;
        else
            local v74, v75 = l_normalizeNumber_0(v73);
            return v74, v75;
        end;
    end;
end;
local function _(v77) --[[ Line: 205 ]] --[[ Name: normalizeCameraFocus ]]
    -- upvalues: l_normalizeNotEmptyString_0 (copy)
    local v78 = v77.props and v77.props.cameraFocus;
    local v79, v80 = l_normalizeNotEmptyString_0(v78);
    return v79, v80;
end;
local function _(v82) --[[ Line: 212 ]] --[[ Name: normalizeCameraZoomRadius ]]
    -- upvalues: l_normalizeNumber_0 (copy)
    local v83 = v82.props and v82.props.cameraZoomRadius;
    if v83 == nil or v83 == "" then
        return nil, nil;
    else
        if type(v83) == "string" then
            v83 = tonumber(v83);
        end;
        if v83 == nil then
            return nil, nil;
        else
            local v84, v85 = l_normalizeNumber_0(v83);
            return v84, v85;
        end;
    end;
end;
local function _(v87) --[[ Line: 230 ]] --[[ Name: normalizeCanAnimateCameraBasedMood ]]
    -- upvalues: l_normalizeBoolean_0 (copy)
    local v88 = v87.props and v87.props.canAnimateCameraBasedMood;
    if v88 == nil or v88 == "" then
        return nil, nil;
    else
        local v89, v90;
        if type(v88) == "boolean" then
            v90 = v88;
            v89 = nil;
        elseif type(v88) == "string" then
            if v88 == "True" then
                v90 = true;
                v89 = nil;
            elseif v88 == "False" then
                v90 = false;
                v89 = nil;
            else
                v90 = nil;
                v89 = "Invalid boolean string value, expected \"True\" or \"False\"";
            end;
        else
            v90 = nil;
            v89 = "Expected boolean or string";
        end;
        if v89 then
            return nil, v89;
        else
            local v91, v92 = l_normalizeBoolean_0(v90);
            return v91, v92;
        end;
    end;
end;
local function _(v94) --[[ Line: 246 ]] --[[ Name: normalizeDisableFilters ]]
    -- upvalues: l_normalizeBoolean_0 (copy)
    local v95 = v94.props and v94.props.disableFilters;
    if v95 == nil or v95 == "" then
        return nil, nil;
    else
        local v96, v97;
        if type(v95) == "boolean" then
            v97 = v95;
            v96 = nil;
        elseif type(v95) == "string" then
            if v95 == "True" then
                v97 = true;
                v96 = nil;
            elseif v95 == "False" then
                v97 = false;
                v96 = nil;
            else
                v97 = nil;
                v96 = "Invalid boolean string value, expected \"True\" or \"False\"";
            end;
        else
            v97 = nil;
            v96 = "Expected boolean or string";
        end;
        if v96 then
            return nil, v96;
        else
            local v98, v99 = l_normalizeBoolean_0(v97);
            return v98, v99;
        end;
    end;
end;
local function _(v101) --[[ Line: 262 ]] --[[ Name: normalizePageType ]]
    -- upvalues: l_normalizeNotEmptyString_0 (copy)
    local v102 = v101.props and v101.props.pageType;
    local v103, v104 = l_normalizeNotEmptyString_0(v102);
    return v103, v104;
end;
local function _(v106) --[[ Line: 269 ]] --[[ Name: normalizeShowLooksAsOrganicContent ]]
    -- upvalues: l_normalizeBoolean_0 (copy)
    local v107 = v106.props and v106.props.showLooksAsOrganicContent;
    if v107 == nil or v107 == "" then
        return nil, nil;
    else
        local v108, v109;
        if type(v107) == "boolean" then
            v109 = v107;
            v108 = nil;
        elseif type(v107) == "string" then
            if v107 == "True" then
                v109 = true;
                v108 = nil;
            elseif v107 == "False" then
                v109 = false;
                v108 = nil;
            else
                v109 = nil;
                v108 = "Invalid boolean string value, expected \"True\" or \"False\"";
            end;
        else
            v109 = nil;
            v108 = "Expected boolean or string";
        end;
        if v108 then
            return nil, v108;
        else
            local v110, v111 = l_normalizeBoolean_0(v109);
            return v110, v111;
        end;
    end;
end;
local function _(v113) --[[ Line: 285 ]] --[[ Name: normalizeLooksWidgetContextForOrganicContent ]]
    -- upvalues: v19 (copy), l_normalizeString_0 (copy)
    local v114 = v19(v113);
    local v115 = v114 and v114.context;
    if v115 == nil or v115 == "" then
        return nil, nil;
    else
        local v116, v117 = l_normalizeString_0(v115);
        return v116, v117;
    end;
end;
local function _(v119) --[[ Line: 298 ]] --[[ Name: normalizeTooltipKey ]]
    -- upvalues: l_normalizeNotEmptyString_0 (copy)
    local v120 = v119.props and v119.props.tooltipKey;
    local v121, v122 = l_normalizeNotEmptyString_0(v120);
    return v121, v122;
end;
local function _(v124) --[[ Line: 305 ]] --[[ Name: normalizeTooltipBody ]]
    -- upvalues: l_normalizeNotEmptyString_0 (copy)
    local v125 = v124.props and v124.props.tooltipBody;
    local v126, v127 = l_normalizeNotEmptyString_0(v125);
    return v126, v127;
end;
local function _(v129) --[[ Line: 312 ]] --[[ Name: normalizeTileType ]]
    -- upvalues: l_normalizeNotEmptyString_0 (copy)
    local v130 = v129.props and v129.props.tileType;
    local v131, v132 = l_normalizeNotEmptyString_0(v130);
    return v131, v132;
end;
local v134 = nil;
local v135 = nil;
v135 = function(v136) --[[ Line: 323 ]]
    -- upvalues: v134 (ref)
    if not v136.props or not v136.props.Configs or type(v136.props.Configs) ~= "table" then
        return nil, nil;
    else
        local v137 = {};
        local v138 = {};
        for _, v140 in v136.props.Configs do
            local v141, v142 = v134(v140);
            if v142 then
                table.insert(v138, v142);
            end;
            if v141 and not v142 then
                table.insert(v137, v141);
            end;
        end;
        local v143 = nil;
        if next(v138) then
            v143 = table.concat(v138, " ");
        end;
        return v137, v143;
    end;
end;
local function v245(v144, v145) --[[ Line: 351 ]] --[[ Name: normalizeCategoryOrSubcategory ]]
    -- upvalues: l_FFlagAXCatalogCategoriesSDUIPillTitleNormalization_0 (copy), l_normalizeNotEmptyString_0 (copy), l_normalizeString_0 (copy), l_HttpService_0 (copy), v19 (copy), v32 (copy), l_FFlagAXCatalogCategoriesSDUITaxonomy_0 (copy), v24 (copy), l_normalizeNumber_0 (copy), v135 (ref), l_normalizeBoolean_0 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy)
    if type(v144) ~= "table" then
        return nil, "Config must be a table";
    else
        local v146 = {};
        local v147 = v144.props and v144.props.pillId;
        local v148 = nil;
        local v149 = nil;
        if l_FFlagAXCatalogCategoriesSDUIPillTitleNormalization_0 then
            local v150, v151 = l_normalizeNotEmptyString_0(v147);
            v148 = v150;
            v149 = v151;
        else
            local v152, v153 = l_normalizeString_0(v147);
            v148 = v152;
            v149 = v153;
        end;
        local l_v148_0 = v148;
        local l_v149_0 = v149;
        if l_v149_0 then
            table.insert(v146, "Id: " .. l_v149_0);
        end;
        v149 = v144.props and v144.props.pillTitle;
        local v156 = nil;
        local v157 = nil;
        if l_FFlagAXCatalogCategoriesSDUIPillTitleNormalization_0 then
            local v158, v159 = l_normalizeNotEmptyString_0(v149);
            v156 = v158;
            v157 = v159;
        else
            local v160, v161 = l_normalizeString_0(v149);
            v156 = v160;
            v157 = v161;
        end;
        v147 = v156;
        v148 = v157;
        if v148 then
            table.insert(v146, "Name: " .. v148);
        end;
        v157 = v144.props and v144.props.pillTitle;
        local v162 = nil;
        local v163 = nil;
        if l_FFlagAXCatalogCategoriesSDUIPillTitleNormalization_0 then
            local v164, v165 = l_normalizeNotEmptyString_0(v157);
            v162 = v164;
            v163 = v165;
        else
            local v166, v167 = l_normalizeString_0(v157);
            v162 = v166;
            v163 = v167;
        end;
        v149 = v162;
        v156 = v163;
        if v156 then
            table.insert(v146, "LocalizedTitle: " .. v156);
        end;
        v163 = v144.props and v144.props.pillTitle;
        local v168 = nil;
        local v169 = nil;
        if l_FFlagAXCatalogCategoriesSDUIPillTitleNormalization_0 then
            local v170, v171 = l_normalizeNotEmptyString_0(v163);
            v168 = v170;
            v169 = v171;
        else
            local v172, v173 = l_normalizeString_0(v163);
            v168 = v172;
            v169 = v173;
        end;
        v157 = v168;
        v162 = v169;
        if v162 then
            table.insert(v146, "Title: " .. v162);
        end;
        v163 = l_HttpService_0:GenerateGUID(true);
        v168 = nil;
        if v168 then
            table.insert(v146, "SearchUuid: " .. v168);
        end;
        local v174 = v19(v144);
        local v175 = v174 and v174.assetTypeIds;
        local v176;
        if v175 == nil or v175 == "" then
            v169 = nil;
            v176 = nil;
        else
            local v177, v178 = l_normalizeString_0(v175);
            if v178 then
                v169 = nil;
                v176 = v178;
            else
                v169 = v32(v177);
                v176 = nil;
            end;
        end;
        if v176 then
            table.insert(v146, "AssetTypeIdStrings: " .. v176);
        end;
        local v179 = v19(v144);
        local v180 = v179 and v179.bundleTypeIds;
        if v180 == nil or v180 == "" then
            v174 = nil;
            v175 = nil;
        else
            local v181, v182 = l_normalizeString_0(v180);
            if v182 then
                v174 = nil;
                v175 = v182;
            else
                v174 = v32(v181);
                v175 = nil;
            end;
        end;
        if v175 then
            table.insert(v146, "BundleTypes: " .. v175);
        end;
        v179 = nil;
        v180 = nil;
        if l_FFlagAXCatalogCategoriesSDUITaxonomy_0 then
            local v183 = v19(v144);
            local v184 = v183 and v183.taxonomyId;
            local v185, v186 = l_normalizeNotEmptyString_0(v184);
            local l_v185_0 = v185;
            local l_v186_0 = v186;
            v179 = l_v185_0;
            v180 = l_v186_0;
            if v180 then
                table.insert(v146, "Taxonomy: " .. v180);
            end;
        end;
        local v189 = v24(v144);
        local v190 = nil;
        if v190 then
            table.insert(v146, "WidgetContext: " .. v190);
        end;
        local v191 = v144.props and v144.props.timeToRefresh;
        local v192, v193;
        if v191 == nil or v191 == "" then
            v193 = nil;
            v192 = nil;
        else
            if type(v191) == "string" then
                v191 = tonumber(v191);
            end;
            if v191 == nil then
                v193 = nil;
                v192 = nil;
            else
                local v194, v195 = l_normalizeNumber_0(v191);
                v193 = v194;
                v192 = v195;
            end;
        end;
        if v192 then
            table.insert(v146, "TimeToRefresh: " .. v192);
        end;
        local v196 = v144.props and v144.props.cameraFocus;
        local v197, v198 = l_normalizeNotEmptyString_0(v196);
        v191 = v197;
        local l_v198_0 = v198;
        if l_v198_0 then
            table.insert(v146, "CameraFocus: " .. l_v198_0);
        end;
        v198 = v144.props and v144.props.cameraZoomRadius;
        if v198 == nil or v198 == "" then
            v196 = nil;
            v197 = nil;
        else
            if type(v198) == "string" then
                v198 = tonumber(v198);
            end;
            if v198 == nil then
                v196 = nil;
                v197 = nil;
            else
                local v200, v201 = l_normalizeNumber_0(v198);
                v196 = v200;
                v197 = v201;
            end;
        end;
        if v197 then
            table.insert(v146, "CameraZoomRadius: " .. v197);
        end;
        v198 = nil;
        local v202 = nil;
        if not v145.isSubcategory then
            local v203, v204 = v135(v144);
            v198 = v203;
            v202 = v204;
            if v202 then
                table.insert(v146, "Subcategories: " .. v202);
            end;
        end;
        local v205 = v144.props and v144.props.canAnimateCameraBasedMood;
        local v206, v207;
        if v205 == nil or v205 == "" then
            v207 = nil;
            v206 = nil;
        else
            local v208, v209;
            if type(v205) == "boolean" then
                v209 = v205;
                v208 = nil;
            elseif type(v205) == "string" then
                if v205 == "True" then
                    v209 = true;
                    v208 = nil;
                elseif v205 == "False" then
                    v209 = false;
                    v208 = nil;
                else
                    v209 = nil;
                    v208 = "Invalid boolean string value, expected \"True\" or \"False\"";
                end;
            else
                v209 = nil;
                v208 = "Expected boolean or string";
            end;
            if v208 then
                v207 = nil;
                v206 = v208;
            else
                local v210, v211 = l_normalizeBoolean_0(v209);
                v207 = v210;
                v206 = v211;
            end;
        end;
        if v206 then
            table.insert(v146, "CanAnimateCameraBasedMood: " .. v206);
        end;
        local v212 = v144.props and v144.props.disableFilters;
        local v213;
        if v212 == nil or v212 == "" then
            v205 = nil;
            v213 = nil;
        else
            local v214, v215;
            if type(v212) == "boolean" then
                v215 = v212;
                v214 = nil;
            elseif type(v212) == "string" then
                if v212 == "True" then
                    v215 = true;
                    v214 = nil;
                elseif v212 == "False" then
                    v215 = false;
                    v214 = nil;
                else
                    v215 = nil;
                    v214 = "Invalid boolean string value, expected \"True\" or \"False\"";
                end;
            else
                v215 = nil;
                v214 = "Expected boolean or string";
            end;
            if v214 then
                v205 = nil;
                v213 = v214;
            else
                local v216, v217 = l_normalizeBoolean_0(v215);
                v205 = v216;
                v213 = v217;
            end;
        end;
        if v213 then
            table.insert(v146, "DisableFilters: " .. v213);
        end;
        local v218 = v144.props and v144.props.pageType;
        local v219, v220 = l_normalizeNotEmptyString_0(v218);
        v212 = v219;
        local l_v220_0 = v220;
        if l_v220_0 then
            table.insert(v146, "PageType: " .. l_v220_0);
        end;
        v218 = nil;
        v219 = nil;
        v220 = nil;
        local v222 = nil;
        if l_FFlagAXLooksWidgetContextForOrganicContent_0 then
            local v223 = v19(v144);
            local v224 = v223 and v223.context;
            local v225, v226;
            if v224 == nil or v224 == "" then
                v225 = nil;
                v226 = nil;
            else
                local v227, v228 = l_normalizeString_0(v224);
                v225 = v227;
                v226 = v228;
            end;
            v218 = v225;
            v219 = v226;
            if v219 then
                table.insert(v146, "LooksWidgetContextForOrganicContent: " .. v219);
            end;
        else
            local v229 = v144.props and v144.props.showLooksAsOrganicContent;
            local v230, v231;
            if v229 == nil or v229 == "" then
                v230 = nil;
                v231 = nil;
            else
                local v232, v233;
                if type(v229) == "boolean" then
                    v233 = v229;
                    v232 = nil;
                elseif type(v229) == "string" then
                    if v229 == "True" then
                        v233 = true;
                        v232 = nil;
                    elseif v229 == "False" then
                        v233 = false;
                        v232 = nil;
                    else
                        v233 = nil;
                        v232 = "Invalid boolean string value, expected \"True\" or \"False\"";
                    end;
                else
                    v233 = nil;
                    v232 = "Expected boolean or string";
                end;
                if v232 then
                    v230 = nil;
                    v231 = v232;
                else
                    local v234, v235 = l_normalizeBoolean_0(v233);
                    v230 = v234;
                    v231 = v235;
                end;
            end;
            v220 = v230;
            v222 = v231;
            if v222 then
                table.insert(v146, "ShowLooksAsOrganicContent: " .. v222);
            end;
        end;
        local v236 = v144.props and v144.props.tooltipKey;
        local v237, v238 = l_normalizeNotEmptyString_0(v236);
        local l_v237_0 = v237;
        local l_v238_0 = v238;
        if l_v238_0 then
            table.insert(v146, "TooltipKey: " .. l_v238_0);
        end;
        v238 = v144.props and v144.props.tooltipBody;
        local v241, v242 = l_normalizeNotEmptyString_0(v238);
        v236 = v241;
        v237 = v242;
        if v237 then
            table.insert(v146, "TooltipBody: " .. v237);
        end;
        v242 = v144.props and v144.props.tileType;
        local v243, v244 = l_normalizeNotEmptyString_0(v242);
        v238 = v243;
        v241 = v244;
        if v241 then
            table.insert(v146, "TileType: " .. v241);
        end;
        if #v146 > 0 then
            return nil, (v145.isSubcategory and "Subcategory" or "Category") .. " normalization failed: " .. table.concat(v146, "; ");
        else
            v242 = {
                Id = l_v148_0, 
                Name = v147, 
                LocalizedTitle = v149, 
                Title = v157, 
                SearchUuid = v163, 
                AssetTypeIdStrings = v169, 
                BundleTypes = v174, 
                TaxonomyUuid = if l_FFlagAXCatalogCategoriesSDUITaxonomy_0 then v179 else nil, 
                WidgetContext = v189, 
                TimeToRefresh = v193, 
                CameraFocus = v191, 
                CameraZoomRadius = v196, 
                CanAnimateCameraBasedMood = v207, 
                DisableFilters = v205, 
                PageType = v212, 
                ShowLooksAsOrganicContent = if l_FFlagAXLooksWidgetContextForOrganicContent_0 then nil else v220, 
                LooksWidgetContextForOrganicContent = if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v218 else nil, 
                TooltipKey = l_v237_0, 
                TooltipBody = v236, 
                TileType = v238
            };
            if v145.isSubcategory then
                v242.isSubcategory = true;
            elseif v198 and #v198 > 0 then
                v242.Subcategories = v198;
            end;
            return v242, nil;
        end;
    end;
end;
v134 = function(v246) --[[ Line: 522 ]]
    -- upvalues: v245 (copy)
    return v245(v246, {
        isSubcategory = true
    });
end;
local v247 = nil;
v247 = function(v248) --[[ Line: 528 ]]
    -- upvalues: v245 (copy)
    return v245(v248, {
        isSubcategory = false
    });
end;
local v257 = l_makeNormalizeTableFn_0({
    Configs = {
        fn = function(v249) --[[ Line: 533 ]] --[[ Name: normalizeConfigs ]]
            -- upvalues: v247 (ref)
            if type(v249) ~= "table" then
                return {}, "Configs field must be a table";
            else
                local v250 = {};
                local v251 = {};
                for _, v253 in v249 do
                    local v254, v255 = v247(v253);
                    if v255 then
                        table.insert(v251, v255);
                    end;
                    if v254 and not v255 then
                        table.insert(v250, v254);
                    end;
                end;
                local v256 = nil;
                if next(v251) then
                    v256 = table.concat(v251, " ");
                end;
                return v250, v256;
            end;
        end
    }
});
return function(v258) --[[ Line: 566 ]]
    -- upvalues: v257 (copy)
    if not v258 or type(v258.Configs) ~= "table" then
        return {}, "Configs field is required and must be a table";
    else
        local v259, v260 = v257(v258);
        return v259 and v259.Configs or {}, v260;
    end;
end;