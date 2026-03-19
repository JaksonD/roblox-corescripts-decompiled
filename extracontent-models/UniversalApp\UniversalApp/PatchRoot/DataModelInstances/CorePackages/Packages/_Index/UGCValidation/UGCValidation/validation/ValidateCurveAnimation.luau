local l_CollectionService_0 = game:GetService("CollectionService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.Constants);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v7 = require(l_util_0.FailureReasonsAccumulator);
local v8 = require(l_util_0.AssetCalculator);
local l_validation_0 = l_Parent_0.validation;
local v10 = require(l_validation_0.validateAttributes);
local v11 = require(l_validation_0.validateTags);
local v12 = require(l_validation_0.ValidatePropertiesSensible);
local l_flags_0 = l_Parent_0.flags;
local v14 = require(l_flags_0.GetFStringUGCValidationMaxAnimationLength);
local v15 = require(l_flags_0.GetFStringUGCValidationMaxAnimationBounds);
local v16 = require(l_flags_0.GetFStringUGCValidationMaxAnimationDeltas);
local v17 = require(l_flags_0.getFFlagUGCValidateAddObjectValueToAcceptableTypes);
local v18 = require(l_flags_0.getFFlagUGCValidateDuplicatesInAnimation);
local v19 = require(l_flags_0.getFFlagUGCValidateMaxTotalInstances);
local v20 = require(l_flags_0.getFIntUGCValidateMaxAnimationFPS);
local v21 = require(l_flags_0.getFIntUGCValidateMaxMarkerCurveValueLength);
local v22 = require(l_flags_0.GetFStringUGCValidateMaxAnimationMovementPerPart);
local v23 = require(l_flags_0.getFFlagUGCValidateStopNaNsInfsInAnimationKeys);
local v24 = require(l_flags_0.getFFlagUGCValidateStopNaNsInfsInCalculatedData);
local v25 = require(l_flags_0.GetFStringUGCValidateFrameDeltaKeyTimeTol);
local v26 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v27 = require(l_flags_0.GetFStringUGCValidateAnimationHeightTol);
local v28 = require(l_flags_0.getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessage);
local v29 = require(l_flags_0.getFFlagUGCValidateCurveAnimRotationSpeed);
local v30 = require(l_flags_0.getFIntUGCValidationMaxAnimationRotationSpeedPerSecond);
local v31 = require(l_flags_0.getFFlagUGCValidateCurveAnimFinalFrameBug);
local v32 = require(l_flags_0.getFFlagUGCValidateCurveAnimMinTimeFix);
local v33 = require(l_flags_0.GetFStringUGCValidateCurveAnimationMinLength);
local v34 = require(l_flags_0.getFFlagUGCValidateCurveAnimTimeErrorMessageFix);
local v35 = require(l_flags_0.getFFlagUGCValidateRestrictNumMarkerCurves);
local v36 = require(l_flags_0.getFIntUGCValidateMaxTotalMarkerCurves);
local v37 = require(l_flags_0.getFFlagUGCValidateRestrictNumFaceControls);
local v38 = require(l_flags_0.getFIntUGCValidateMaxTotalFaceControls);
local v39 = require(l_flags_0.getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurves);
local v40 = require(l_flags_0.getFIntUGCValidateMaxTotalInternalMarkers);
local v41 = {};
local function v45(v42, v43, v44) --[[ Line: 66 ]] --[[ Name: reportFailure ]]
    -- upvalues: v3 (copy)
    v3.reportFailure(v43, nil, v44);
    return false, {
        v42
    };
end;
local v46 = nil;
local function _() --[[ Line: 79 ]] --[[ Name: getBodyPartToParentMap ]]
    -- upvalues: v46 (ref), v8 (copy)
    if not v46 then
        v46 = v8.getBodyPartsToParents();
    end;
    return v46;
end;
local function _(v48) --[[ Line: 87 ]] --[[ Name: isBodyPartFolderNameValid ]]
    -- upvalues: v46 (ref), v8 (copy)
    local v49 = true;
    if not v46 then
        v46 = v8.getBodyPartsToParents();
    end;
    if v46[v48] == nil then
        v49 = v48 == "HumanoidRootPart";
    end;
    return v49;
end;
local function v59(v51, v52) --[[ Line: 91 ]] --[[ Name: areChildrenAcceptable ]]
    if not v51 then
        return true;
    else
        local function v56(v53) --[[ Line: 96 ]] --[[ Name: findAndRemoveMatching ]]
            -- upvalues: v52 (copy)
            for v54, v55 in v52 do
                if v55.ClassName == v53.ClassName and v55.Name == v53.Name then
                    table.remove(v52, v54);
                    return true;
                end;
            end;
            return false;
        end;
        for _, v58 in v51:GetChildren() do
            if not v56(v58) then
                return false;
            end;
        end;
        return true;
    end;
end;
local function v64(v60) --[[ Line: 116 ]] --[[ Name: calculateAcceptableChildBodyPartFolders ]]
    -- upvalues: v46 (ref), v8 (copy)
    local v61 = {};
    if not v46 then
        v46 = v8.getBodyPartsToParents();
    end;
    for v62, v63 in v46 do
        if v63 == v60 then
            table.insert(v61, {
                ClassName = "Folder", 
                Name = v62
            });
        end;
    end;
    return v61;
end;
local function v68(v65, v66) --[[ Line: 130 ]] --[[ Name: calculateAcceptableBodyPartFolderChildrenArray ]]
    -- upvalues: v64 (copy)
    local v67 = v64(v65.Name);
    if v65.Name == "HumanoidRootPart" then
        return v67;
    else
        table.insert(v67, {
            ClassName = "Vector3Curve", 
            Name = "Position"
        });
        table.insert(v67, {
            ClassName = v66 and "EulerRotationCurve" or "RotationCurve", 
            Name = "Rotation"
        });
        if v65.Name ~= "Head" then
            return v67;
        else
            table.insert(v67, {
                ClassName = "Folder", 
                Name = "FaceControls"
            });
            return v67;
        end;
    end;
end;
local function v69() --[[ Line: 161 ]] --[[ Name: calculateAcceptableCurveChildrenArray ]]
    return {
        {
            ClassName = "FloatCurve", 
            Name = "X"
        }, 
        {
            ClassName = "FloatCurve", 
            Name = "Y"
        }, 
        {
            ClassName = "FloatCurve", 
            Name = "Z"
        }
    };
end;
local function _(v70) --[[ Line: 178 ]] --[[ Name: containsGrandChildren ]]
    if not v70 then
        return false;
    else
        return #v70:GetDescendants() > #v70:GetChildren();
    end;
end;
local function v80(v72) --[[ Line: 185 ]] --[[ Name: validateBodyPartFolderChildren ]]
    -- upvalues: v68 (copy), v59 (copy), v69 (copy), v37 (copy), v38 (copy)
    local v73 = v68(v72, true);
    if v59(v72, v73) then
        local v74 = v69();
        if not v59(v72:FindFirstChild("Position"), v74) then
            return false;
        else
            v74 = v69();
            if not v59(v72:FindFirstChild("Rotation"), v74) then
                return false;
            else
                local l_FaceControls_0 = v72:FindFirstChild("FaceControls");
                if l_FaceControls_0 then
                    local l_l_FaceControls_0_Children_0 = l_FaceControls_0:GetChildren();
                    if v37() and #l_l_FaceControls_0_Children_0 > v38() then
                        return false;
                    else
                        for _, v78 in l_l_FaceControls_0_Children_0 do
                            if not v78:IsA("FloatCurve") then
                                return false;
                            end;
                        end;
                    end;
                end;
                local l_Position_0 = v72:FindFirstChild("Position");
                if not not l_Position_0 and #l_Position_0:GetDescendants() > #l_Position_0:GetChildren() then
                    return false;
                else
                    l_Position_0 = v72:FindFirstChild("Rotation");
                    if not not l_Position_0 and #l_Position_0:GetDescendants() > #l_Position_0:GetChildren() then
                        return false;
                    elseif not not l_FaceControls_0 and #l_FaceControls_0:GetDescendants() > #l_FaceControls_0:GetChildren() then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
        end;
    else
        return false;
    end;
end;
local _ = function(v81, v82) --[[ Line: 236 ]] --[[ Name: validateCurveAnimationBodyPartFolder ]]
    -- upvalues: v18 (copy), v80 (copy), v45 (copy), v3 (copy), v46 (ref), v8 (copy)
    local function v83(v84) --[[ Line: 240 ]] --[[ Name: validateBodyPartFolderInternal ]]
        -- upvalues: v18 (ref), v80 (ref), v45 (ref), v3 (ref), v82 (copy), v83 (copy), v46 (ref), v8 (ref)
        if v18() then
            if not v80(v84) then
                return v45(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", v84.Name), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v82);
            else
                for _, v86 in v84:GetChildren() do
                    if v86:IsA("Folder") and v86.Name ~= "FaceControls" then
                        local v87, v88 = v83(v86);
                        if not v87 then
                            return false, v88;
                        end;
                    end;
                end;
                return true;
            end;
        else
            for _, v90 in v84:GetChildren() do
                if v90:IsA("Folder") then
                    if v90.Name == "HumanoidRootPart" then
                        return false;
                    else
                        if not v46 then
                            v46 = v8.getBodyPartsToParents();
                        end;
                        local v91 = v46[v90.Name];
                        if v91 then
                            if v91 ~= v84.Name then
                                return false;
                            else
                                return v83(v90);
                            end;
                        end;
                    end;
                end;
            end;
            return true;
        end;
    end;
    local l_Name_0 = v81.Name;
    local v93 = true;
    if not v46 then
        v46 = v8.getBodyPartsToParents();
    end;
    if v46[l_Name_0] == nil then
        v93 = l_Name_0 == "HumanoidRootPart";
    end;
    if not v93 then
        return true;
    else
        return v83(v81);
    end;
end;
local function v102(v95, v96) --[[ Line: 289 ]] --[[ Name: validateSingleBodyRoot ]]
    -- upvalues: v46 (ref), v8 (copy), v45 (copy), v3 (copy), v18 (copy)
    local v97 = 0;
    for _, v99 in v95:GetChildren() do
        if v99:IsA("Folder") then
            local l_Name_1 = v99.Name;
            local v101 = true;
            if not v46 then
                v46 = v8.getBodyPartsToParents();
            end;
            if v46[l_Name_1] == nil then
                v101 = l_Name_1 == "HumanoidRootPart";
            end;
            if v101 then
                v97 = v97 + 1;
                if v97 > 1 then
                    return v45("CurveAnimation contains more than one body part or HumanoidRootPart Folder children. Please ensure there is only one child Folder named after a body part or HumanoidRootPart.", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v96);
                end;
            end;
        end;
    end;
    if v18() and v97 == 0 then
        return v45("CurveAnimation contains zero body part or HumanoidRootPart Folder children. Please ensure there is one (and only one) child Folder named after a body part or HumanoidRootPart.", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v96);
    else
        return true;
    end;
end;
v41.validateMarkerCurves = function(v103, v104) --[[ Line: 319 ]] --[[ Name: validateMarkerCurves ]]
    -- upvalues: v36 (copy), v45 (copy), v3 (copy)
    local v105 = v36();
    local v106 = 0;
    for _, v108 in v103:GetDescendants() do
        if v108:IsA("MarkerCurve") then
            v106 = v106 + 1;
            if v105 < v106 then
                return v45(("CurveAnimation contains more than %* MarkerCurve(s). Please ensure there is no more than %* MarkerCurve descendant(s)."):format(v105, v105), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v104);
            end;
        end;
    end;
    return true;
end;
v41.validateSingleAnimationRigData = function(v109, v110) --[[ Line: 341 ]] --[[ Name: validateSingleAnimationRigData ]]
    -- upvalues: v45 (copy), v3 (copy)
    local v111 = 0;
    for _, v113 in v109:GetChildren() do
        if v113:IsA("AnimationRigData") then
            v111 = v111 + 1;
            if v111 > 1 then
                return v45("CurveAnimation contains more than one AnimationRigData children. Please ensure there is only one AnimationRigData child.", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v110);
            end;
        end;
    end;
    if v111 == 0 then
        return v45("CurveAnimation contains zero AnimationRigData children. Please ensure there is one (and only one) AnimationRigData children.", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v110);
    else
        return true;
    end;
end;
v41.validateAnimationRigDataInternals = function(v114, v115) --[[ Line: 369 ]] --[[ Name: validateAnimationRigDataInternals ]]
    -- upvalues: v45 (copy), v3 (copy)
    for _, v117 in v114:GetChildren() do
        if v117:IsA("AnimationRigData") and not v117:IsValidR15() then
            return v45("AnimationRigData failed internal validation. Please ensure the AnimationRigData is set up correctly.", v3.ErrorType.validateCurveAnimation_IncorrectAnimationRigData, v115);
        end;
    end;
    return true;
end;
local function _(v118, v119) --[[ Line: 389 ]] --[[ Name: validateAnimationRigData ]]
    -- upvalues: v41 (copy)
    local v120, v121 = v41.validateSingleAnimationRigData(v118, v119);
    if not v120 then
        return false, v121;
    else
        local v122, v123 = v41.validateAnimationRigDataInternals(v118, v119);
        v120 = v122;
        v121 = v123;
        if not v120 then
            return false, v121;
        else
            return true;
        end;
    end;
end;
local function v129(v125, v126) --[[ Line: 405 ]] --[[ Name: validateScripts ]]
    -- upvalues: v45 (copy), v3 (copy)
    for _, v128 in v125:GetDescendants() do
        if v128:IsA("Script") or v128:IsA("ModuleScript") then
            return v45("CurveAnimation hierarchy contains Scripts, LocalScripts, or ModuleScripts. Please remove them.", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v126);
        end;
    end;
    return true;
end;
local v130 = {
    "MarkerCurve", 
    "AnimationRigData", 
    "Folder", 
    "Vector3Curve", 
    "EulerRotationCurve", 
    "FloatCurve"
};
if v17() then
    table.insert(v130, "ObjectValue");
end;
local function v138(v131, v132) --[[ Line: 434 ]] --[[ Name: validateExtraInstances ]]
    -- upvalues: v130 (copy), v45 (copy), v3 (copy)
    for _, v134 in v131:GetDescendants() do
        local v135 = false;
        for _, v137 in v130 do
            if v134:IsA(v137) then
                v135 = true;
                break;
            end;
        end;
        if not v135 then
            return v45(("CurveAnimation hierarchy can only contain %*. Please remove any other Instance types."):format((table.concat(v130, ", "))), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v132);
        end;
    end;
    return true;
end;
v41.validateExtraInstancesUnitTest = function(v139, v140) --[[ Line: 458 ]] --[[ Name: validateExtraInstancesUnitTest ]]
    -- upvalues: v138 (copy)
    return v138(v139, v140);
end;
v41.validateScriptsUnitTest = function(v141, v142) --[[ Line: 465 ]] --[[ Name: validateScriptsUnitTest ]]
    -- upvalues: v129 (copy)
    return v129(v141, v142);
end;
local function v181(v143, v144) --[[ Line: 474 ]] --[[ Name: validateAnimationHierarchy ]]
    -- upvalues: v3 (copy), v19 (copy), v45 (copy), v102 (copy), v41 (copy), v35 (copy), v18 (copy), v46 (ref), v8 (copy), v80 (copy), v7 (copy), v129 (copy), v138 (copy)
    if not v143:IsA("CurveAnimation") then
        v3.reportFailure(v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, v144);
        return false, {
            "Referenced Animation is not a CurveAnimation. Please ensure the animation is uploaded correctly."
        };
    else
        local v145 = #v143:GetDescendants();
        if v19() < v145 then
            return v45(("CurveAnimation has %* descendants. Maximum allowed is %*. Please reduce the number of descendants."):format(v145, (v19())), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v144);
        else
            local v146, v147 = v102(v143, v144);
            if not v146 then
                return false, v147;
            else
                local v148, v149 = v41.validateSingleAnimationRigData(v143, v144);
                local v150, v151;
                if not v148 then
                    v150 = false;
                    v151 = v149;
                else
                    local v152, v153 = v41.validateAnimationRigDataInternals(v143, v144);
                    v148 = v152;
                    v149 = v153;
                    if not v148 then
                        v150 = false;
                        v151 = v149;
                    else
                        v150 = true;
                        v151 = nil;
                    end;
                end;
                v146 = v150;
                v147 = v151;
                if not v146 then
                    return false, v147;
                else
                    if v35() then
                        v150, v151 = v41.validateMarkerCurves(v143, v144);
                        v146 = v150;
                        v147 = v151;
                        if not v146 then
                            return false, v147;
                        end;
                    end;
                    for _, v155 in v143:GetChildren() do
                        if v155:IsA("MarkerCurve") or v155:IsA("AnimationRigData") then
                            if v18() and #v155:GetChildren() > 0 then
                                return v45("CurveAnimation child MarkerCurves and AnimationRigData cannot have children", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v144);
                            end;
                        elseif v155:IsA("Folder") then
                            if v18() then
                                local l_Name_2 = v155.Name;
                                local v157 = true;
                                if not v46 then
                                    v46 = v8.getBodyPartsToParents();
                                end;
                                if v46[l_Name_2] == nil then
                                    v157 = l_Name_2 == "HumanoidRootPart";
                                end;
                                if not v157 then
                                    return v45("CurveAnimation contains unexpected child: " .. v155.Name, v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v144);
                                else
                                    local function v158(v159) --[[ Line: 240 ]] --[[ Name: validateBodyPartFolderInternal ]]
                                        -- upvalues: v18 (ref), v80 (ref), v45 (ref), v3 (ref), v144 (copy), v158 (copy), v46 (ref), v8 (ref)
                                        if v18() then
                                            if not v80(v159) then
                                                return v45(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", v159.Name), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v144);
                                            else
                                                for _, v161 in v159:GetChildren() do
                                                    if v161:IsA("Folder") and v161.Name ~= "FaceControls" then
                                                        local v162, v163 = v158(v161);
                                                        if not v162 then
                                                            return false, v163;
                                                        end;
                                                    end;
                                                end;
                                                return true;
                                            end;
                                        else
                                            for _, v165 in v159:GetChildren() do
                                                if v165:IsA("Folder") then
                                                    if v165.Name == "HumanoidRootPart" then
                                                        return false;
                                                    else
                                                        if not v46 then
                                                            v46 = v8.getBodyPartsToParents();
                                                        end;
                                                        local v166 = v46[v165.Name];
                                                        if v166 then
                                                            if v166 ~= v159.Name then
                                                                return false;
                                                            else
                                                                return v158(v165);
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                            return true;
                                        end;
                                    end;
                                    local l_Name_3 = v155.Name;
                                    local v168 = true;
                                    if not v46 then
                                        v46 = v8.getBodyPartsToParents();
                                    end;
                                    if v46[l_Name_3] == nil then
                                        v168 = l_Name_3 == "HumanoidRootPart";
                                    end;
                                    if not v168 then
                                        v157 = true;
                                        l_Name_2 = nil;
                                    else
                                        v168, l_Name_3 = v158(v155);
                                        v157 = v168;
                                        l_Name_2 = l_Name_3;
                                    end;
                                    v146 = v157;
                                    v147 = l_Name_2;
                                    if not v146 then
                                        return false, v147;
                                    end;
                                end;
                            else
                                local v169 = nil;
                                local l_v169_0 = v169 --[[ copy: 12 -> 15 ]];
                                local function v171(v172) --[[ Line: 240 ]] --[[ Name: validateBodyPartFolderInternal ]]
                                    -- upvalues: v18 (ref), v80 (ref), v45 (ref), v3 (ref), l_v169_0 (copy), v171 (copy), v46 (ref), v8 (ref)
                                    if v18() then
                                        if not v80(v172) then
                                            return v45(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", v172.Name), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, l_v169_0);
                                        else
                                            for _, v174 in v172:GetChildren() do
                                                if v174:IsA("Folder") and v174.Name ~= "FaceControls" then
                                                    local v175, v176 = v171(v174);
                                                    if not v175 then
                                                        return false, v176;
                                                    end;
                                                end;
                                            end;
                                            return true;
                                        end;
                                    else
                                        for _, v178 in v172:GetChildren() do
                                            if v178:IsA("Folder") then
                                                if v178.Name == "HumanoidRootPart" then
                                                    return false;
                                                else
                                                    if not v46 then
                                                        v46 = v8.getBodyPartsToParents();
                                                    end;
                                                    local v179 = v46[v178.Name];
                                                    if v179 then
                                                        if v179 ~= v172.Name then
                                                            return false;
                                                        else
                                                            return v171(v178);
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                        return true;
                                    end;
                                end;
                                local l_Name_4 = v155.Name;
                                v169 = true;
                                if not v46 then
                                    v46 = v8.getBodyPartsToParents();
                                end;
                                if v46[l_Name_4] == nil then
                                    v169 = l_Name_4 == "HumanoidRootPart";
                                end;
                                if not (not v169 or v171(v155)) then
                                    return v45("CurveAnimation contains child body part Folder " .. v155.Name .. " which has an invalid hierarchy", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v144);
                                end;
                            end;
                        else
                            return v45("CurveAnimation contains unexpected child: " .. v155.Name, v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v144);
                        end;
                    end;
                    v150 = v7.new();
                    v150:updateReasons(v129(v143, v144));
                    v150:updateReasons(v138(v143, v144));
                    return v150:getFinalResults();
                end;
            end;
        end;
    end;
end;
local function v186(v182) --[[ Line: 572 ]] --[[ Name: createDefaultCharacter ]]
    -- upvalues: l_Players_0 (copy)
    local v183 = nil;
    v183 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    for _, v185 in v183:GetDescendants() do
        if v185:IsA("Decal") then
            v185.Transparency = 1;
        elseif v185:IsA("MeshPart") then
            v185.Transparency = 1;
            v185.CanCollide = false;
        elseif v185:IsA("Motor6D") and v182 then
            v185:Destroy();
        end;
    end;
    return v183;
end;
local v187 = 1 / v20();
local function v193(v188) --[[ Line: 606 ]] --[[ Name: getBodyPartFolderRoot ]]
    -- upvalues: v46 (ref), v8 (copy)
    for _, v190 in v188:GetChildren() do
        if v190:IsA("Folder") then
            local l_Name_5 = v190.Name;
            local v192 = true;
            if not v46 then
                v46 = v8.getBodyPartsToParents();
            end;
            if v46[l_Name_5] == nil then
                v192 = l_Name_5 == "HumanoidRootPart";
            end;
            if v192 then
                return v190;
            end;
        end;
    end;
    return nil;
end;
local function v199(v194) --[[ Line: 615 ]] --[[ Name: hasFloatCurveKeys ]]
    local l_X_0 = v194:FindFirstChild("X");
    local l_Y_0 = v194:FindFirstChild("Y");
    local l_Z_0 = v194:FindFirstChild("Z");
    local v198 = if l_X_0 then l_X_0:IsA("FloatCurve") and #l_X_0:GetKeys() > 0 else false;
    if not v198 then
        v198 = if l_Y_0 then l_Y_0:IsA("FloatCurve") and #l_Y_0:GetKeys() > 0 else false;
        if not v198 then
            if l_Z_0 then
                v198 = l_Z_0:IsA("FloatCurve");
                if v198 then
                    return #l_Z_0:GetKeys() > 0;
                end;
            else
                v198 = false;
            end;
        end;
    end;
    return v198;
end;
local function _(v200) --[[ Line: 625 ]] --[[ Name: hasPositionKeys ]]
    -- upvalues: v199 (copy)
    if not v200 then
        return false;
    elseif not v200:IsA("Vector3Curve") then
        return false;
    else
        return (v199(v200));
    end;
end;
local function _(v202) --[[ Line: 636 ]] --[[ Name: hasRotationKeys ]]
    -- upvalues: v199 (copy)
    if not v202 then
        return false;
    elseif not v202:IsA("EulerRotationCurve") then
        return false;
    else
        return (v199(v202));
    end;
end;
local function v256(v204) --[[ Line: 648 ]] --[[ Name: calculateAnimFramesAtOriginManual ]]
    -- upvalues: v18 (copy), v193 (copy), v46 (ref), v8 (copy), v199 (copy), v4 (copy), v186 (copy), v31 (copy), v187 (copy)
    local function v212() --[[ Line: 651 ]] --[[ Name: getCurveTracks ]]
        -- upvalues: v18 (ref), v193 (ref), v204 (copy), v46 (ref), v8 (ref), v199 (ref), v4 (ref)
        local v205 = {};
        local v206 = nil;
        if v18() then
            local v207 = v193(v204);
            assert(v207, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.");
            v206 = v207:GetDescendants();
            table.insert(v206, v207);
        else
            v206 = v204:GetDescendants();
        end;
        for _, v209 in v206 do
            if v209:IsA("Folder") then
                if not v46 then
                    v46 = v8.getBodyPartsToParents();
                end;
                if v46[v209.Name] then
                    local l_Position_1 = v209:FindFirstChild("Position");
                    local l_Rotation_0 = v209:FindFirstChild("Rotation");
                    v205[v209.Name] = {
                        pos = if not not l_Position_1 and if l_Position_1:IsA("Vector3Curve") then v199(l_Position_1) else false then l_Position_1 else nil, 
                        rot = if not not l_Rotation_0 and if l_Rotation_0:IsA("EulerRotationCurve") then v199(l_Rotation_0) else false then l_Rotation_0 else nil, 
                        faceControls = if v209.Name == v4.NAMED_R15_BODY_PARTS.Head then v209:FindFirstChild("FaceControls") else nil
                    };
                end;
            end;
        end;
        return v205;
    end;
    local function v223(v213) --[[ Line: 684 ]] --[[ Name: calculateCurveAnimLength ]]
        local v214 = -1;
        local function v220(v215) --[[ Line: 687 ]] --[[ Name: getMaxTimeFromFloatCurveChildren ]]
            -- upvalues: v214 (ref)
            if not v215 then
                return;
            else
                for _, v217 in v215:GetChildren() do
                    if v217:IsA("FloatCurve") then
                        for _, v219 in v217:GetKeys() do
                            v214 = math.max(v214, v219.Time);
                        end;
                    end;
                end;
                return;
            end;
        end;
        for _, v222 in v213 do
            v220(v222.pos);
            v220(v222.rot);
            v220(v222.faceControls);
        end;
        return v214;
    end;
    local function v230(v224, v225) --[[ Line: 710 ]] --[[ Name: calculateTransformsAtTime ]]
        local v226 = {};
        for v227, v228 in v225 do
            local v229 = if v228.pos then Vector3.new(unpack(v228.pos:GetValueAtTime(v224))) else Vector3.new(0, 0, 0, 0);
            v226[v227] = (if v228.rot then v228.rot:GetRotationAtTime(v224) else CFrame.new()) + v229;
        end;
        return v226;
    end;
    local function v236(v231, v232) --[[ Line: 720 ]] --[[ Name: calculatePositionMagnitudeResultsAtTime ]]
        local v233 = {};
        for v234, v235 in v232 do
            if v235.pos then
                v233[v234] = Vector3.new(unpack(v235.pos:GetValueAtTime(v231))).Magnitude;
            end;
        end;
        return v233;
    end;
    local v237 = v186(false);
    local v238 = {};
    for _, v240 in v237:GetChildren() do
        local l_Name_6 = v240.Name;
        local v242 = true;
        if not v46 then
            v46 = v8.getBodyPartsToParents();
        end;
        if v46[l_Name_6] == nil then
            v242 = l_Name_6 == "HumanoidRootPart";
        end;
        if v242 then
            v238[v240.Name] = v240;
        end;
    end;
    local v243 = v212();
    local v244 = v223(v243);
    local v245 = {};
    local v246 = {};
    local function _(v247) --[[ Line: 746 ]] --[[ Name: addData ]]
        -- upvalues: v230 (copy), v243 (copy), v8 (ref), v238 (copy), v245 (copy), v246 (copy), v236 (copy)
        local v248 = v230(v247, v243);
        local v249 = v8.calculateAllTransformsForFullBody(v238, v248);
        table.insert(v245, v249);
        table.insert(v246, (v236(v247, v243)));
    end;
    local v251 = 0;
    while v251 <= v244 do
        if v31() then
            local l_v251_0 = v251;
            local v253 = v230(l_v251_0, v243);
            table.insert(v245, (v8.calculateAllTransformsForFullBody(v238, v253)));
            table.insert(v246, (v236(l_v251_0, v243)));
        else
            local v254 = v230(v251, v243);
            table.insert(v245, (v8.calculateAllTransformsForFullBody(v238, v254)));
            table.insert(v246, (v236(v251, v243)));
        end;
        v251 = v251 + v187;
    end;
    if v31() and v244 >= 0 then
        local v255 = v230(v244, v243);
        table.insert(v245, (v8.calculateAllTransformsForFullBody(v238, v255)));
        table.insert(v246, (v236(v244, v243)));
    end;
    v237:Destroy();
    return v245, v244, v246, v243;
end;
v41.validateAnimationLength = function(v257, v258) --[[ Line: 779 ]] --[[ Name: validateAnimationLength ]]
    -- upvalues: v32 (copy), v33 (copy), v14 (copy), v34 (copy), v45 (copy), v3 (copy)
    local v259 = if v32() then v33.asNumber() else 0;
    if v257 <= v259 or v14.asNumber() < v257 then
        if v34() then
            return v45(("CurveAnimation must be between %* and %* seconds long. Please fix the animation."):format(v259, (v14.asString())), v3.ErrorType.validateCurveAnimation_UnacceptableLength, v258);
        else
            return v45(("CurveAnimation must be between 0 and %* seconds long. Please fix the animation."):format((v14.asString())), v3.ErrorType.validateCurveAnimation_UnacceptableLength, v258);
        end;
    else
        return true;
    end;
end;
v41.validateBounds = function(v260, v261, v262) --[[ Line: 806 ]] --[[ Name: validateBounds ]]
    -- upvalues: v34 (copy), v27 (copy), v15 (copy), v187 (copy), v45 (copy), v3 (copy), v7 (copy)
    local v263 = 1e999;
    local v264 = 0;
    local v265 = nil;
    local v266 = nil;
    if v34() then
        v265 = v27.asNumber();
        v266 = v15.asNumber();
    end;
    for v267, v268 in v260 do
        for v269, v270 in v268 do
            if v34() then
                if v270.Position.Y < v265 then
                    local v271 = string.format("In CurveAnimation at time %.2f seconds, body part %s is at height %.2f studs from the HumanoidRootPart. Body parts cannot be lower than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(v262, (v267 - 1) * v187), v269, v270.Position.Y, v27.asString());
                    return v45(v271, v3.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, v261);
                elseif v266 < v270.Position.Magnitude then
                    local v272 = string.format("In CurveAnimation at time %.2f seconds, body part %s is %.2f studs from the HumanoidRootPart. Body parts cannot be more than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(v262, (v267 - 1) * v187), v269, v270.Position.Magnitude, v15.asString());
                    return v45(v272, v3.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, v261);
                end;
            else
                v264 = math.max(v264, v270.Position.Magnitude);
                v263 = math.min(v263, v270.Position.Y);
            end;
        end;
    end;
    if not v34() then
        local v273 = v7.new();
        v273:updateReasons(v27.asNumber() <= v263, {
            (("Body parts in a CurveAnimation cannot be lower than %* studs from the HumanoidRootPart. Please fix the animation."):format((v27.asString())))
        });
        v273:updateReasons(v264 <= v15.asNumber(), {
            (("Body parts in a CurveAnimation cannot get more than %* studs from the HumanoidRootPart. Please fix the animation."):format((v15.asString())))
        });
        if not v273:getFinalResults() then
            v3.reportFailure(v3.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, nil, v261);
        end;
        return v273:getFinalResults();
    else
        return true;
    end;
end;
v41.validateFrameDeltas = function(v274, v275) --[[ Line: 884 ]] --[[ Name: validateFrameDeltas ]]
    -- upvalues: v187 (copy), v16 (copy), v28 (copy), v45 (copy), v3 (copy)
    local v276 = v187 / 0.03333333333333333;
    local v277 = v16.asNumber() * v276;
    local v278 = nil;
    if v28() then
        v278 = v16.asNumber() * 30;
    end;
    local v279 = {};
    for v280, v281 in v274 do
        for v282, v283 in v281 do
            local v284 = v279[v282];
            if v284 then
                local l_Magnitude_0 = (v283.Position - v284.Position).Magnitude;
                if v277 < l_Magnitude_0 then
                    if v28() then
                        local v286 = (v280 - 1) * v187;
                        local v287 = l_Magnitude_0 / v276 * 30;
                        local v288 = string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a speed of %.2f studs/second. %.2f is the maximum studs/second speed. Please fix the animation.", v286, v282, v287, v278);
                        return v45(v288, v3.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, v275);
                    else
                        return v45(("Body part %* in CurveAnimation moves more than %* studs between frames. Please fix the animation."):format(v282, (v16.asString())), v3.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, v275);
                    end;
                end;
            end;
        end;
        v279 = v281;
    end;
    return true;
end;
v41.validateFrameRotationDeltas = function(v289, v290) --[[ Line: 942 ]] --[[ Name: validateFrameRotationDeltas ]]
    -- upvalues: v187 (copy), v20 (copy), v30 (copy), v45 (copy), v3 (copy)
    assert(math.abs(1 / v187 - v20()) < 1.0E-5, "frameDelta should be calculated as 1 / getFIntUGCValidateMaxAnimationFPS()");
    local v291 = v30();
    local v292 = v291 / v20();
    local v293 = {};
    for v294, v295 in v289 do
        for v296, v297 in v295 do
            local v298 = v293[v296];
            if v298 then
                local v299 = math.deg((math.abs((v297:AngleBetween(v298)))));
                if v292 < v299 then
                    local v300 = (v294 - 1) * v187;
                    local v301 = v299 * v20();
                    local v302 = string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a rotation speed of %.2f degrees/second. %.2f is the maximum degrees/second speed. Please fix the animation.", v300, v296, v301, v291);
                    return v45(v302, v3.ErrorType.validateCurveAnimation_UnacceptableFrameRotationDelta, v290);
                end;
            end;
        end;
        v293 = v295;
    end;
    return true;
end;
v41.validateMinimumTransformations = function(v303, v304) --[[ Line: 991 ]] --[[ Name: validateMinimumTransformations ]]
    -- upvalues: v45 (copy), v3 (copy)
    for _, v306 in v303 do
        if v306.pos or v306.rot then
            return true;
        end;
    end;
    return v45("CurveAnimation does not contain any joint manipulation.", v3.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, v304);
end;
v41.validateContainsJointManipulation = function(v307, v308) --[[ Line: 1008 ]] --[[ Name: validateContainsJointManipulation ]]
    -- upvalues: v18 (copy), v193 (copy), v46 (ref), v8 (copy), v45 (copy), v3 (copy)
    local v309 = nil;
    if v18() then
        local v310 = v193(v307);
        assert(v310, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.");
        v309 = v310:GetDescendants();
        table.insert(v309, v310);
    else
        v309 = v307:GetDescendants();
    end;
    for _, v312 in v309 do
        if v312:IsA("Folder") then
            if not v46 then
                v46 = v8.getBodyPartsToParents();
            end;
            if v46[v312.Name] then
                local l_Position_2 = v312:FindFirstChild("Position");
                local l_Rotation_1 = v312:FindFirstChild("Rotation");
                if l_Position_2 and l_Position_2:IsA("Vector3Curve") and l_Rotation_1 and l_Rotation_1:IsA("EulerRotationCurve") then
                    return true;
                end;
            end;
        end;
    end;
    return v45("CurveAnimation does not contain any joint manipulation.", v3.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, v308);
end;
local function _(v315) --[[ Line: 1045 ]] --[[ Name: isTimeStamp ]]
    if #v315 > 30 then
        return false;
    else
        return string.match(v315, "^[0-9]+$") ~= nil;
    end;
end;
v41.validateAllowedTags = function(v317, v318) --[[ Line: 1053 ]] --[[ Name: validateAllowedTags ]]
    -- upvalues: v11 (copy), l_CollectionService_0 (copy), v45 (copy), v3 (copy)
    local v319 = false;
    for _, v321 in v317:GetChildren() do
        local v322, v323 = v11(v321, v318);
        if not v322 then
            return v322, v323;
        end;
    end;
    local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v317);
    local v325 = #l_l_CollectionService_0_Tags_0;
    if v325 > 0 then
        if v325 <= 1 then
            local v326 = l_l_CollectionService_0_Tags_0[1];
            v319 = #v326 <= 30 and string.match(v326, "^[0-9]+$") ~= nil;
        end;
        if not v319 then
            return v45("CurveAnimation can only contain a single timestamp tag. Please remove all other tags.", v3.ErrorType.validateTags, v318);
        end;
    end;
    v319 = false;
    return true;
end;
v41.validateStructure = function(v327, v328) --[[ Line: 1080 ]] --[[ Name: validateStructure ]]
    -- upvalues: v181 (copy)
    return v181(v327, v328);
end;
local function v337(...) --[[ Line: 1087 ]] --[[ Name: areNumbersGood ]]
    local function _(v329) --[[ Line: 1088 ]] --[[ Name: isNaN ]]
        return v329 ~= v329;
    end;
    local function _(v331) --[[ Line: 1092 ]] --[[ Name: isInfinite ]]
        local v332 = true;
        if v331 ~= 1e999 then
            v332 = v331 == -1e999;
        end;
        return v332;
    end;
    for _, v335 in {
        ...
    } do
        if v335 ~= v335 then
            return false;
        else
            local v336 = true;
            if v335 ~= 1e999 then
                v336 = v335 == -1e999;
            end;
            if v336 then
                return false;
            end;
        end;
    end;
    return true;
end;
v41.validateData = function(v338, v339) --[[ Line: 1107 ]] --[[ Name: validateData ]]
    -- upvalues: v187 (copy), v25 (copy), v14 (copy), v39 (copy), v40 (copy), v45 (copy), v3 (copy), v23 (copy), v337 (copy), v21 (copy), v20 (copy)
    local function _(v340) --[[ Line: 1111 ]] --[[ Name: isNaN ]]
        return v340 ~= v340;
    end;
    local v342 = v187 * v25.asNumber();
    local v343 = math.ceil(1 / v342 * v14.asNumber());
    for _, v345 in v338:GetDescendants() do
        if v345:IsA("MarkerCurve") then
            local l_v345_Markers_0 = v345:GetMarkers();
            if v39() then
                local v347 = math.min(v40(), v343);
                if v347 < #l_v345_Markers_0 then
                    return v45(("CurveAnimation contains a MarkerCurve with %* Markers. %* is the maximum per MarkerCurve. Please fix the animation."):format(#l_v345_Markers_0, v347), v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v339);
                end;
            elseif v343 < #l_v345_Markers_0 then
                return v45(("CurveAnimation contains MarkerCurve with too many markers. %* is the maximum per MarkerCurve. Please fix the animation."):format(v343), v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v339);
            end;
            for _, v349 in l_v345_Markers_0 do
                if v349.Time then
                    local v350;
                    if v23() then
                        v350 = not v337(v349.Time);
                    else
                        local l_Time_0 = v349.Time;
                        v350 = l_Time_0 ~= l_Time_0;
                    end;
                    if not v350 and v349.Value and #v349.Value <= v21() then
                        continue;
                    end;
                end;
                return v45("CurveAnimation contains MarkerCurves with invalid Time or Value, or Value is too long. Please fix the animation.", v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v339);
            end;
        elseif v345:IsA("FloatCurve") then
            local l_v345_Keys_0 = v345:GetKeys();
            if v343 < #l_v345_Keys_0 then
                return v45(("CurveAnimation contains Curves with too many keys. %* is the maximum per Curve. Please fix the animation."):format(v343), v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v339);
            else
                local v353 = nil;
                for _, v355 in l_v345_Keys_0 do
                    if v355.Time then
                        local v356;
                        if v23() then
                            v356 = not v337(v355.Time);
                        else
                            local l_Time_1 = v355.Time;
                            v356 = l_Time_1 ~= l_Time_1;
                        end;
                        if not v356 and v355.Value then
                            if v23() then
                                v356 = not v337(v355.Value);
                            else
                                local l_Value_0 = v355.Value;
                                v356 = l_Value_0 ~= l_Value_0;
                            end;
                            if not v356 then
                                if v353 then
                                    if v353 + v342 > v355.Time then
                                        local v359 = if v345.Parent.Parent then v345.Parent.Parent.Name else "-";
                                        return v45(("CurveAnimation contains Curve %*.%*.%* with keys that are too close together in time for a maximum %* fps animation. Please fix the animation."):format(v359, v345.Parent.Name, v345.Name, (v20())), v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v339);
                                    end;
                                elseif v355.Time < 0 then
                                    v356 = if v345.Parent.Parent then v345.Parent.Parent.Name else "-";
                                    return v45(("CurveAnimation contains Curve %*.%*.%* with a key that has a negative time. Please fix the animation."):format(v356, v345.Parent.Name, v345.Name), v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v339);
                                end;
                                v353 = v355.Time;
                                continue;
                            end;
                        end;
                    end;
                    return v45("CurveAnimation contains Curves with invalid Time or Value. Please fix the animation.", v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v339);
                end;
            end;
        end;
    end;
    return true;
end;
v41.validateCalculatedData = function(v360, v361, v362) --[[ Line: 1218 ]] --[[ Name: validateCalculatedData ]]
    -- upvalues: v337 (copy), v45 (copy), v3 (copy)
    for _, v364 in v360 do
        for _, v366 in v364 do
            if not v337(v366:GetComponents()) then
                return v45("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v362);
            end;
        end;
    end;
    for _, v368 in v361 do
        for _, v370 in v368 do
            if not v337(v370) then
                return v45("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v362);
            end;
        end;
    end;
    return true;
end;
v41.calculateAnimFramesAtOrigin = function(v371) --[[ Line: 1249 ]] --[[ Name: calculateAnimFramesAtOrigin ]]
    -- upvalues: v256 (copy)
    return v256(v371);
end;
v41.validatePositionMagnitudes = function(v372, v373) --[[ Line: 1255 ]] --[[ Name: validatePositionMagnitudes ]]
    -- upvalues: v4 (copy), v22 (copy), v45 (copy), v3 (copy)
    local v374 = {};
    for _, v376 in v372 do
        for v377, v378 in v376 do
            if v377 ~= v4.NAMED_R15_BODY_PARTS.LowerTorso then
                if not v374[v377] then
                    v374[v377] = v22.asNumber(v377);
                end;
                if v374[v377] < v378 then
                    return v45(("CurveAnimation contains positional separation of body parts. Only LowerTorso can change position. All other body parts can only change their orientation. %* moves more than %* studs from its parent. Please fix the animation."):format(v377, v374[v377]), v3.ErrorType.validateCurveAnimation_PositionalMovement, v373);
                end;
            end;
        end;
    end;
    return true;
end;
v41.validateFrames = function(v379, v380) --[[ Line: 1283 ]] --[[ Name: validateFrames ]]
    -- upvalues: v41 (copy), v24 (copy), v7 (copy), v29 (copy)
    local v381, v382, v383, v384 = v41.calculateAnimFramesAtOrigin(v379);
    if v24() then
        local v385, v386 = v41.validateCalculatedData(v381, v383, v380);
        if not v385 then
            return v385, v386;
        end;
    end;
    local v387 = v7.new();
    v387:updateReasons(v41.validateMinimumTransformations(v384, v380));
    v387:updateReasons(v41.validatePositionMagnitudes(v383, v380));
    v387:updateReasons(v41.validateAnimationLength(v382, v380));
    v387:updateReasons(v41.validateBounds(v381, v380, v382));
    v387:updateReasons(v41.validateFrameDeltas(v381, v380));
    if v29() then
        v387:updateReasons(v41.validateFrameRotationDeltas(v381, v380));
    end;
    return v387:getFinalResults();
end;
v41.validate = function(v388, v389) --[[ Line: 1317 ]] --[[ Name: validate ]]
    -- upvalues: v41 (copy), v26 (copy), v12 (copy), v7 (copy), v10 (copy)
    local v390, v391 = v41.validateStructure(v388, v389);
    if not v390 then
        return v390, v391;
    else
        if v26() then
            local v392, v393 = v12.validate(v388, v389);
            if not v392 then
                return false, v393;
            end;
        end;
        local v394, v395 = v41.validateData(v388, v389);
        if not v394 then
            return v394, v395;
        else
            v394 = v7.new();
            v394:updateReasons(v10(v388, v389));
            v394:updateReasons(v41.validateAllowedTags(v388, v389));
            v394:updateReasons(v41.validateFrames(v388, v389));
            return v394:getFinalResults();
        end;
    end;
end;
return v41;