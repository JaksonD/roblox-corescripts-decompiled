local l_script_FirstAncestor_0 = script:FindFirstAncestor("TnSAvatarIdentification");
local v1 = require(l_script_FirstAncestor_0.Flags.GetFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredths);
local v2 = require(l_script_FirstAncestor_0.Flags.GetFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercent);
local v3 = require(l_script_FirstAncestor_0.Flags.GetFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercent);
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.SharedFlags);
local l_GetFFlagAvatarIdentificationSafeAreaFix_0 = v6.GetFFlagAvatarIdentificationSafeAreaFix;
local l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0 = v6.GetFFlagGetHumanoidDescriptionUpdatesV2E;
local v9 = require(l_Parent_0.GetHumanoidDescription);
local v10 = require(script.Parent.IdentificationUtils);
local v11 = v1() / 100;
local v12 = v3() / 100;
local v13 = v2() / 100;
local v14 = {};
getBBCorners = function(v15, v16) --[[ Line: 29 ]] --[[ Name: getBBCorners ]]
    local v17 = table.create(8);
    local l_XVector_0 = v15.XVector;
    local l_YVector_0 = v15.YVector;
    local l_ZVector_0 = v15.ZVector;
    local v21 = 1;
    for v22 = -0.5, 0.5 do
        local v23 = l_XVector_0 * v22 * v16.X;
        for v24 = -0.5, 0.5 do
            local v25 = l_YVector_0 * v24 * v16.Y;
            for v26 = -0.5, 0.5 do
                local v27 = l_ZVector_0 * v26 * v16.Z;
                v17[v21] = v15.Position + v23 + v25 + v27;
                v21 = v21 + 1;
            end;
        end;
    end;
    return v17;
end;
local v28 = v12 + 1;
local v29 = -v12;
local function _(v30) --[[ Line: 53 ]]
    -- upvalues: v28 (copy), v29 (copy)
    local v31 = true;
    if v30.Y <= v28 then
        v31 = true;
        if v30.Y >= v29 then
            v31 = true;
            if v30.X <= v28 then
                v31 = v30.X < v29;
            end;
        end;
    end;
    return v31;
end;
local v33 = {
    total = 0, 
    offScreenDiscardCount = 0, 
    tooCloseDiscardCount = 0, 
    wasSkipped = false
};
getCoveringPolygon = function(v34, v35, v36) --[[ Line: 74 ]] --[[ Name: getCoveringPolygon ]]
    -- upvalues: v33 (copy), l_GetFFlagAvatarIdentificationSafeAreaFix_0 (copy), v10 (copy), v11 (copy), v28 (copy), v29 (copy), v13 (copy)
    if #v34 == 0 then
        return {}, v33;
    else
        local l_ViewportSize_0 = v35.ViewportSize;
        local v38 = {};
        for _, v40 in ipairs(v34) do
            local l_target_0 = v40.target;
            local l_ExtentsCFrame_0 = l_target_0.ExtentsCFrame;
            local l_ExtentsSize_0 = l_target_0.ExtentsSize;
            for _, v45 in (getBBCorners(l_ExtentsCFrame_0, l_ExtentsSize_0)) do
                table.insert(v38, v45);
            end;
        end;
        local v46 = {};
        local v47 = 0;
        local v48 = 0;
        if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then
            assert(v36, "getCoveringPolygon requires viewportInfo when FFlagAvatarIdentificationSafeAreaFix is enabled");
            for _, v50 in ipairs(v38) do
                local v51, v52, _ = v10.worldToFullViewportPointNormalized(v50, v35, v36);
                if v52 < v11 then
                    v47 = v47 + 1;
                else
                    local v54 = true;
                    if v51.Y <= v28 then
                        v54 = true;
                        if v51.Y >= v29 then
                            v54 = true;
                            if v51.X <= v28 then
                                v54 = v51.X < v29;
                            end;
                        end;
                    end;
                    if v54 then
                        v48 = v48 + 1;
                    else
                        v46[#v46 + 1] = v51;
                    end;
                end;
            end;
        else
            for _, v56 in ipairs(v38) do
                local v57, _ = v35:WorldToViewportPoint(v56);
                local v59 = Vector2.new(v57.X, v57.Y) / l_ViewportSize_0;
                if v57.Z < v11 then
                    v47 = v47 + 1;
                else
                    local v60 = true;
                    if v59.Y <= v28 then
                        v60 = true;
                        if v59.Y >= v29 then
                            v60 = true;
                            if v59.X <= v28 then
                                v60 = v59.X < v29;
                            end;
                        end;
                    end;
                    if v60 then
                        v48 = v48 + 1;
                    else
                        v46[#v46 + 1] = v59;
                    end;
                end;
            end;
        end;
        local v61 = {
            total = #v38, 
            offScreenDiscardCount = v48, 
            tooCloseDiscardCount = v47, 
            wasSkipped = false
        };
        if (v47 + v48) / #v38 > v13 then
            v61.wasSkipped = true;
            return {}, v61;
        else
            return getConvexHull(v46), v61;
        end;
    end;
end;
getDistanceAlongCamLookVector = function(v62, v63) --[[ Line: 149 ]] --[[ Name: getDistanceAlongCamLookVector ]]
    local l_CFrame_0 = v63.CFrame;
    return ((v62.Position - l_CFrame_0.Position):Dot(l_CFrame_0.LookVector));
end;
getVisibleParts = function(v65, v66, v67) --[[ Line: 162 ]] --[[ Name: getVisibleParts ]]
    local l_Position_0 = v65.CFrame.Position;
    local l_Character_0 = v66.Character;
    if not l_Character_0 or not l_Character_0.Parent then
        return 0, {};
    else
        local l_l_Character_0_Children_0 = l_Character_0:GetChildren();
        local v71 = RaycastParams.new();
        v71.FilterType = Enum.RaycastFilterType.Exclude;
        v71.FilterDescendantsInstances = v67;
        v71.IgnoreWater = true;
        local v72 = 0;
        local v73 = {};
        for _, v75 in ipairs(l_l_Character_0_Children_0) do
            if v75:IsA("BasePart") then
                local v76 = v75.CFrame.Position - l_Position_0;
                v72 = v72 + 1;
                local v77 = workspace:Raycast(l_Position_0, v76, v71);
                if v77 and v77.Instance:IsDescendantOf(l_Character_0) then
                    table.insert(v73, {
                        result = v77, 
                        target = v75
                    });
                end;
            end;
        end;
        return v72, v73;
    end;
end;
local function _(v78, v79, v80) --[[ Line: 203 ]] --[[ Name: counterclockwise ]]
    return (v79 - v78):Cross(v80 - v79);
end;
getConvexHull = function(v82) --[[ Line: 207 ]] --[[ Name: getConvexHull ]]
    if #v82 <= 2 then
        return {};
    else
        local v83 = {};
        local v84 = v82[1];
        local v85 = {};
        for v86 = 2, #v82 do
            local v87 = v82[v86];
            if v87.Y < v84.Y or v87.Y == v84.Y and v87.X < v84.X then
                v84 = v87;
            end;
        end;
        table.insert(v83, v84);
        local function _(v88) --[[ Line: 224 ]] --[[ Name: angleFromLowest ]]
            -- upvalues: v84 (ref)
            local v89 = v88 - v84;
            return (math.atan2(v89.Y, v89.X));
        end;
        for _, v92 in ipairs(v82) do
            if v92 ~= v84 then
                local l_X_0 = v92.X;
                local l_Y_0 = v92.Y;
                local v95 = v92 - v84;
                table.insert(v85, (Vector3.new(l_X_0, l_Y_0, (math.atan2(v95.Y, v95.X)))));
            end;
        end;
        local function v98(v96, v97) --[[ Line: 236 ]] --[[ Name: compareByAngle ]]
            -- upvalues: v84 (ref)
            if v96.Z ~= v97.Z then
                return v96.Z < v97.Z;
            else
                return (Vector2.new(v96.X, v96.Y) - v84).Magnitude < (Vector2.new(v97.X, v97.Y) - v84).Magnitude;
            end;
        end;
        table.sort(v85, v98);
        local v99 = {};
        local v100 = v85[1];
        for v101 = 2, #v85 do
            local v102 = v85[v101];
            if v100.Z == v102.Z then
                v100 = v102;
            else
                table.insert(v99, Vector2.new(v100.X, v100.Y));
                v100 = v102;
            end;
        end;
        table.insert(v99, Vector2.new(v100.X, v100.Y));
        if #v99 == 1 then
            return {};
        else
            table.insert(v83, v99[1]);
            table.insert(v83, v99[2]);
            for v103 = 3, #v99 do
                local v104 = v99[v103];
                while #v83 > 1 do
                    local v105 = v83[#v83 - 1];
                    local v106 = v83[#v83];
                    if (v106 - v105):Cross(v104 - v106) <= 0 then
                        table.remove(v83);
                    else
                        break;
                    end;
                end;
                table.insert(v83, v104);
            end;
            return v83;
        end;
    end;
end;
projectVertices = function(v107, v108, v109) --[[ Line: 308 ]] --[[ Name: projectVertices ]]
    local v110 = 1e999;
    local v111 = -1e999;
    for _, v113 in ipairs(v107) do
        local v114 = (v113 * v109):Dot(v108);
        if v114 < v110 then
            v110 = v114;
        end;
        if v111 < v114 then
            v111 = v114;
        end;
    end;
    return v110, v111;
end;
projectCircle = function(v115, v116, v117) --[[ Line: 328 ]] --[[ Name: projectCircle ]]
    local v118 = v117.Unit * v116;
    local v119 = v115 + v118;
    local v120 = v115 - v118;
    local v121 = v119:Dot(v117);
    local v122 = v120:Dot(v117);
    if v122 < v121 then
        local l_v121_0 = v121;
        v121 = v122;
        v122 = l_v121_0;
    end;
    return v121, v122;
end;
getClosestPoint = function(v124, v125, v126) --[[ Line: 347 ]] --[[ Name: getClosestPoint ]]
    local v127 = -1;
    local v128 = 1e999;
    for v129, v130 in ipairs(v125) do
        v130 = v130 * v126;
        local v131 = math.sqrt(math.pow(v130.X - v124.X, 2) + math.pow(v130.Y - v124.Y, 2));
        if v131 < v128 then
            v128 = v131;
            v127 = v129;
        end;
    end;
    return v127;
end;
intersectCirclePolygon = function(v132, v133, v134, v135) --[[ Line: 361 ]] --[[ Name: intersectCirclePolygon ]]
    for v136, _ in ipairs(v134) do
        local v138 = v134[v136] * v135;
        local v139 = v134[v136 % #v134 + 1] * v135 - v138;
        local l_Unit_0 = Vector2.new(v139.Y, -v139.X).Unit;
        local v141, v142 = projectVertices(v134, l_Unit_0, v135);
        local v143, v144 = projectCircle(v132, v133, l_Unit_0);
        if v144 <= v141 or v142 <= v143 then
            return false;
        end;
    end;
    local v145 = getClosestPoint(v132, v134, v135);
    if v145 == -1 then
        return false;
    else
        local l_Unit_1 = (v134[v145] - v132).Unit;
        local v147, v148 = projectVertices(v134, l_Unit_1, v135);
        local v149, v150 = projectCircle(v132, v133, l_Unit_1);
        if v150 <= v147 or v148 <= v149 then
            return false;
        else
            return true;
        end;
    end;
end;
intersectCircleBox = function(v151, v152, v153, v154, _) --[[ Line: 392 ]] --[[ Name: intersectCircleBox ]]
    local l_X_1 = v151.X;
    local l_Y_1 = v151.Y;
    local l_l_X_1_0 = l_X_1;
    local l_l_Y_1_0 = l_Y_1;
    local l_X_2 = v153.X;
    local l_Y_2 = v153.Y;
    local v162 = v154.X - v153.X;
    local v163 = v154.Y - v153.Y;
    if l_X_1 < l_X_2 then
        l_l_X_1_0 = l_X_2;
    elseif l_X_2 + v162 < l_X_1 then
        l_l_X_1_0 = l_X_2 + v162;
    end;
    if l_Y_1 < l_Y_2 then
        l_l_Y_1_0 = l_Y_2;
    elseif l_Y_2 + v163 < l_Y_1 then
        l_l_Y_1_0 = l_Y_2 + v163;
    end;
    local v164 = l_X_1 - l_l_X_1_0;
    local v165 = l_Y_1 - l_l_Y_1_0;
    if math.sqrt(v164 * v164 + v165 * v165) <= v152 then
        return true;
    else
        return false;
    end;
end;
v14.getAvatarsForRegion = function(v166, v167, v168, v169, v170) --[[ Line: 431 ]]
    local v171 = {};
    local v172 = v170 < v169;
    local v173 = if v172 then v169 / v170 else v170 / v169;
    local v174 = nil;
    v174 = if v172 then Vector2.new(v173, 1) else Vector2.new(1, v173);
    for _, v176 in pairs(v166) do
        if intersectCircleBox(v167 * v174, v168 * v173, v176.boundingBox.min * v174, v176.boundingBox.max * v174, v174) and #v176.convexHull >= 3 and intersectCirclePolygon(v167 * v174, v168 * v173, v176.convexHull, v174) then
            v171[v176.player.UserId] = v176.player;
        end;
    end;
    return v171;
end;
v14.getAvatarsForPoint = function(v177, v178) --[[ Line: 478 ]]
    local v179 = {};
    for _, v181 in pairs(v177) do
        local l_boundingBox_0 = v181.boundingBox;
        if v178.X >= l_boundingBox_0.min.X and v178.Y >= l_boundingBox_0.min.Y and v178.X <= l_boundingBox_0.max.X and v178.Y <= l_boundingBox_0.max.Y then
            local l_convexHull_0 = v181.convexHull;
            if #l_convexHull_0 >= 3 then
                local v184 = l_convexHull_0[#l_convexHull_0];
                local v185 = true;
                local v186 = true;
                for _, v188 in ipairs(l_convexHull_0) do
                    local v189 = (v188 - v184):Cross(v178 - v184);
                    v186 = v186 and v189 <= 0;
                    v185 = v185 and v189 >= 0;
                    v184 = v188;
                end;
                if v185 or v186 then
                    v179[v181.player.UserId] = v181.player;
                end;
            end;
        end;
    end;
    return v179;
end;
v14.getVisibleAvatars = function(v190, v191) --[[ Line: 515 ]]
    -- upvalues: l_Players_0 (copy), v10 (copy), l_GetFFlagAvatarIdentificationSafeAreaFix_0 (copy), l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0 (copy), v9 (copy)
    local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
    local v193 = {
        totalPlayers = 0, 
        checkedPlayers = 0, 
        duration = 0
    };
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return {}, v193;
    else
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            return {}, v193;
        else
            local l_Character_1 = l_LocalPlayer_0.Character;
            local v197 = nil;
            local v198 = nil;
            local v199 = {};
            if l_Character_1 then
                v197 = v10.getLocalCharacterPosition(l_Character_1) or l_CurrentCamera_0.CFrame.Position;
                if v10.shouldIgnoreLocalCharacter(l_Character_1) then
                    v199[#v199 + 1] = l_Character_1;
                end;
            else
                v197 = l_CurrentCamera_0.CFrame.Position;
                v198 = false;
            end;
            local v200 = nil;
            if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then
                v200 = v10.getViewportInfo();
                v193.viewportInfo = v200;
            end;
            local v201 = {};
            local v202 = os.clock();
            v193.totalPlayers = #l_l_Players_0_Players_0 - 1;
            local function _() --[[ Line: 559 ]]
                -- upvalues: v193 (copy), v202 (copy)
                v193.duration = os.clock() - v202;
                return v193;
            end;
            local function _() --[[ Line: 563 ]]
                -- upvalues: v191 (copy), v202 (copy)
                return (if v191 then v191 else 0.5) < os.clock() - v202;
            end;
            if v197 then
                table.sort(l_l_Players_0_Players_0, function(v205, v206) --[[ Line: 570 ]]
                    -- upvalues: v197 (ref)
                    return v205:DistanceFromCharacter(v197) < v206:DistanceFromCharacter(v197);
                end);
            end;
            for _, v208 in ipairs(l_l_Players_0_Players_0) do
                if (v208 ~= l_LocalPlayer_0 or v190) and v208.Character then
                    if (v191 or 0.5) < os.clock() - v202 then
                        local l_v201_0 = v201;
                        v193.duration = os.clock() - v202;
                        return l_v201_0, v193;
                    else
                        local l_BoundingBox_0, v211 = v208.Character:GetBoundingBox();
                        local l_Magnitude_0 = (l_BoundingBox_0.Position - v197).Magnitude;
                        if getDistanceAlongCamLookVector(l_BoundingBox_0, l_CurrentCamera_0) < 0 then
                            v193.checkedPlayers = v193.checkedPlayers + 1;
                        else
                            local v213 = getBBCorners(l_BoundingBox_0, v211);
                            local v214, v215 = v10.getViewportCorners(v213, l_CurrentCamera_0, v200);
                            if v215.X == 0 or v215.Y == 0 then
                                v193.checkedPlayers = v193.checkedPlayers + 1;
                            else
                                local v216, v217 = getVisibleParts(l_CurrentCamera_0, v208, v199);
                                if (v191 or 0.5) < os.clock() - v202 then
                                    local l_v201_1 = v201;
                                    v193.duration = os.clock() - v202;
                                    return l_v201_1, v193;
                                else
                                    local v219 = #v217 / v216;
                                    local v220, v221 = getCoveringPolygon(v217, l_CurrentCamera_0, v200);
                                    local v222 = nil;
                                    local v223 = nil;
                                    if l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0() then
                                        local v224, v225 = v9.getHumanoidDescription(v208.UserId);
                                        v222 = v224;
                                        v223 = v225;
                                    end;
                                    v201[v208.UserId] = {
                                        player = v208, 
                                        distance = l_Magnitude_0, 
                                        boundingBox = {
                                            min = v214, 
                                            max = v215
                                        }, 
                                        hitRate = v219, 
                                        convexHull = v220, 
                                        pointProcessingStats = v221, 
                                        humanoidDescription = v222, 
                                        humanoidDescriptionStatus = v223
                                    };
                                    v193.checkedPlayers = v193.checkedPlayers + 1;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            local l_v201_2 = v201;
            v193.duration = os.clock() - v202;
            return l_v201_2, v193;
        end;
    end;
end;
return v14;