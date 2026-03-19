local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local _ = require(l_script_FirstAncestor_0.Analysis.Types);
local v3 = require(l_script_FirstAncestor_0.Flags.GetFIntIGARRaycastTargetCount);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFIntIGARSubtreeDivergenceThresholdPerMille);
local v5 = require(l_script_FirstAncestor_0.Analysis.extractAssetIdsFromInstance);
local v6 = Random.new();
getRandomSampleUniformDisk = function(v7, v8, v9) --[[ Line: 70 ]] --[[ Name: getRandomSampleUniformDisk ]]
    -- upvalues: v6 (ref)
    local v10 = nil;
    local v11 = nil;
    local v12 = 0;
    while true do
        local v13 = v6:NextNumber() * 2 * 3.141592653589793;
        local v14 = math.sqrt((v6:NextNumber())) * v8;
        local v15 = math.cos(v13) * v14;
        local v16 = math.sin(v13) * v14;
        v10 = v7.X + v15;
        v11 = v7.Y + v16;
        v12 = v12 + 1;
        if v12 > 6 then
            return v7;
        elseif v10 >= 0 and v10 <= v9.X and v11 >= 0 and v11 <= v9.Y then
            return Vector2.new(v10, v11);
        end;
    end;
end;
interpretAnnotation = function(v17, v18, v19) --[[ Line: 89 ]] --[[ Name: interpretAnnotation ]]
    -- upvalues: v3 (copy), l_Players_0 (copy)
    local v20 = false;
    local v21 = {
        hitCountMap = {}, 
        stats = {
            targetCount = v3(), 
            completedCount = 0, 
            hitCount = 0, 
            resumptionCount = 0, 
            wallTime = 0, 
            computeTime = 0
        }, 
        highlights = {}, 
        topLevelObjects = {}, 
        errorReason = nil, 
        cancel = function() --[[ Line: 110 ]] --[[ Name: cancel ]]
            -- upvalues: v20 (ref)
            v20 = true;
        end
    };
    v21.raycastComputation = coroutine.create(function() --[[ Line: 116 ]]
        -- upvalues: v19 (copy), v21 (copy)
        v19(v21);
    end);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 == nil then
        v21.errorReason = "No camera";
        return v21;
    else
        local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
        if v17.X < 0 or v17.X > l_ViewportSize_0.X or v17.Y < 0 or v17.Y > l_ViewportSize_0.Y then
            v21.errorReason = "Coordinates out of bounds";
            return v21;
        elseif v18 <= 0 or math.max(l_ViewportSize_0.X, l_ViewportSize_0.Y) < v18 then
            v21.errorReason = "Invalid radius";
            return v21;
        else
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if l_LocalPlayer_0 == nil then
                v21.errorReason = "No local player";
                return v21;
            else
                local v25 = {
                    l_LocalPlayer_0.Character
                };
                v21.raycastComputation = coroutine.create(function() --[[ Line: 147 ]]
                    -- upvalues: v25 (copy), v21 (copy), v20 (ref), v17 (copy), v18 (copy), l_ViewportSize_0 (copy), l_CurrentCamera_0 (copy), v19 (copy)
                    local v26 = RaycastParams.new();
                    v26.FilterType = Enum.RaycastFilterType.Exclude;
                    v26.FilterDescendantsInstances = v25;
                    v26.IgnoreWater = true;
                    local v27 = os.clock();
                    local v28 = os.clock();
                    for _ = 1, v21.stats.targetCount do
                        if not v20 then
                            if v28 + 0.011111111111111112 < os.clock() then
                                local l_stats_0 = v21.stats;
                                l_stats_0.computeTime = l_stats_0.computeTime + (os.clock() - v28);
                                task.wait();
                                v28 = os.clock();
                                l_stats_0 = v21.stats;
                                l_stats_0.resumptionCount = l_stats_0.resumptionCount + 1;
                                if v20 then
                                    break;
                                end;
                            end;
                            local v31 = getRandomSampleUniformDisk(v17, v18, l_ViewportSize_0);
                            local v32 = l_CurrentCamera_0:ViewportPointToRay(v31.X, v31.Y);
                            local v33 = nil;
                            for _ = 1, 5 do
                                v33 = workspace:Raycast(v32.Origin, v32.Direction * 5000, v26);
                                if v33 ~= nil then
                                    local l_Instance_0 = v33.Instance;
                                    if (1 - l_Instance_0.Transparency) * (1 - l_Instance_0.LocalTransparencyModifier) <= 0.05 then
                                        table.insert(v25, l_Instance_0);
                                        v26.FilterDescendantsInstances = v25;
                                        v33 = nil;
                                    else
                                        break;
                                    end;
                                else
                                    break;
                                end;
                            end;
                            if v33 then
                                local l_Instance_1 = v33.Instance;
                                if l_Instance_1 ~= nil then
                                    local l_stats_1 = v21.stats;
                                    l_stats_1.hitCount = l_stats_1.hitCount + 1;
                                end;
                                local v38 = nil;
                                while l_Instance_1 ~= nil and (l_Instance_1:IsA("PVInstance") or l_Instance_1:IsA("Accessory")) and l_Instance_1 ~= workspace do
                                    if not v21.hitCountMap[l_Instance_1] then
                                        v21.hitCountMap[l_Instance_1] = {
                                            raycastHits = 0, 
                                            children = {}
                                        };
                                    end;
                                    local v39 = v21.hitCountMap[l_Instance_1];
                                    v39.raycastHits = v39.raycastHits + 1;
                                    if v38 then
                                        v21.hitCountMap[l_Instance_1].children[v38] = true;
                                    end;
                                    v38 = l_Instance_1;
                                    l_Instance_1 = l_Instance_1.Parent;
                                end;
                                if v38 then
                                    v21.topLevelObjects[v38] = (v21.topLevelObjects[v38] or 0) + 1;
                                end;
                            end;
                            local l_stats_2 = v21.stats;
                            l_stats_2.completedCount = l_stats_2.completedCount + 1;
                        else
                            break;
                        end;
                    end;
                    v21.stats.wallTime = os.clock() - v27;
                    local l_stats_3 = v21.stats;
                    l_stats_3.computeTime = l_stats_3.computeTime + (os.clock() - v28);
                    v19(v21);
                end);
                return v21;
            end;
        end;
    end;
end;
createPlayerCharacterReferenceToPlayerMap = function(v42) --[[ Line: 238 ]] --[[ Name: createPlayerCharacterReferenceToPlayerMap ]]
    local v43 = {};
    for _, v45 in ipairs(v42) do
        local l_Character_0 = v45.Character;
        if l_Character_0 then
            v43[l_Character_0] = v45;
        end;
    end;
    return v43;
end;
descendingOrderBySecondElement = function(v47, v48) --[[ Line: 249 ]] --[[ Name: descendingOrderBySecondElement ]]
    return v47[2] > v48[2];
end;
createTraversalTaskList = function(v49, v50) --[[ Line: 256 ]] --[[ Name: createTraversalTaskList ]]
    -- upvalues: l_Players_0 (copy), v4 (copy)
    local v51 = {};
    local v52 = {};
    local v53 = createPlayerCharacterReferenceToPlayerMap(l_Players_0:GetPlayers());
    local v54 = {};
    for v55, v56 in pairs(v50) do
        table.insert(v54, {
            v55, 
            v56
        });
    end;
    table.sort(v54, descendingOrderBySecondElement);
    local v57 = v4() / 1000;
    for _, v59 in ipairs(v54) do
        local v60 = v59[1];
        local v61 = v59[2];
        if v53[v60] ~= nil then
            table.insert(v52, {
                player = v53[v60], 
                count = v61
            });
        else
            local v62 = 0;
            local l_v60_0 = v60;
            while v49[l_v60_0] do
                local v64 = v49[l_v60_0];
                local l_raycastHits_0 = v64.raycastHits;
                local l_children_0 = v64.children;
                local v67 = 0;
                for v68, _ in pairs(l_children_0) do
                    if v49[v68] then
                        v67 = v67 + 1;
                    end;
                end;
                if v67 ~= 0 then
                    local v70 = 0;
                    for v71, _ in pairs(l_children_0) do
                        if v49[v71] then
                            v70 = math.max(v70, v49[v71].raycastHits);
                        end;
                    end;
                    if v70 / l_raycastHits_0 >= v57 then
                        local v73 = nil;
                        local v74 = 0;
                        for v75, _ in pairs(l_children_0) do
                            if v49[v75] and v74 < v49[v75].raycastHits then
                                v73 = v75;
                                v74 = v49[v75].raycastHits;
                            end;
                        end;
                        l_v60_0 = v73;
                        v62 = v62 + 1;
                    else
                        break;
                    end;
                else
                    break;
                end;
            end;
            table.insert(v51, {
                instance = l_v60_0, 
                count = v61
            });
            if l_v60_0 ~= v60 then
                table.insert(v51, {
                    instance = v60, 
                    count = v61
                });
            end;
        end;
    end;
    return v51, v52;
end;
mutateMergeExtractedAssets = function(v77, v78, v79) --[[ Line: 344 ]] --[[ Name: mutateMergeExtractedAssets ]]
    for _, v81 in ipairs(v79.Image) do
        if not v77[v81] then
            v77[v81] = true;
            table.insert(v78.Image, v81);
        end;
    end;
    for _, v83 in ipairs(v79.Mesh) do
        if not v77[v83] then
            v77[v83] = true;
            table.insert(v78.Mesh, v83);
        end;
    end;
    for _, v85 in ipairs(v79.Video) do
        if not v77[v85] then
            v77[v85] = true;
            table.insert(v78.Video, v85);
        end;
    end;
    for _, v87 in ipairs(v79.Model) do
        if not v77[v87] then
            v77[v87] = true;
            table.insert(v78.Model, v87);
        end;
    end;
    for _, v89 in ipairs(v79.Package) do
        if not v77[v89.id] then
            v77[v89.id] = true;
            table.insert(v78.Package, v89);
        end;
    end;
    if game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
        for _, v91 in ipairs(v79.Text) do
            if not v77[v91] then
                v77[v91] = true;
                table.insert(v78.Text, v91);
            end;
        end;
    end;
end;
interpretInstanceListForGUIObjects = function(v92) --[[ Line: 396 ]] --[[ Name: interpretInstanceListForGUIObjects ]]
    local v93 = {
        hitCountMap = {}, 
        stats = {
            targetCount = 0, 
            completedCount = 0, 
            hitCount = 0, 
            resumptionCount = 0, 
            wallTime = 0, 
            computeTime = 0
        }, 
        highlights = {}, 
        topLevelObjects = {}, 
        errorReason = nil, 
        cancel = function() --[[ Line: 410 ]] --[[ Name: cancel ]]

        end
    };
    for _, v95 in ipairs(v92) do
        local v96 = nil;
        while v95 ~= nil and v95:IsA("GuiObject") do
            if not v93.hitCountMap[v95] then
                v93.hitCountMap[v95] = {
                    raycastHits = 0, 
                    children = {}
                };
            end;
            local v97 = v93.hitCountMap[v95];
            v97.raycastHits = v97.raycastHits + 1;
            if v96 then
                v93.hitCountMap[v95].children[v96] = true;
            end;
            v96 = v95;
            v95 = v95.Parent;
        end;
        if v96 then
            v93.topLevelObjects[v96] = (v93.topLevelObjects[v96] or 0) + 1;
        end;
    end;
    return v93;
end;
interpretAndExtractItemsFromInstanceForPreciseSelection = function(v98) --[[ Line: 439 ]] --[[ Name: interpretAndExtractItemsFromInstanceForPreciseSelection ]]
    -- upvalues: v5 (copy), l_Players_0 (copy)
    local v99 = {
        extractedAssets = {
            Package = {}, 
            Model = {}, 
            Image = {}, 
            Mesh = {}, 
            Text = {}, 
            Video = {}
        }, 
        extractedPlayers = {}, 
        cancel = function() --[[ Line: 450 ]] --[[ Name: cancel ]]

        end, 
        stats = {
            hitCountMapSize = 0, 
            topLevelObjectsSize = 0, 
            instancesTraversed = 0, 
            traversalTaskListSize = 0, 
            traversalTasksCompleted = 0, 
            playersCount = 0, 
            resumptionCount = 0, 
            wallTime = 0, 
            computeTime = 0, 
            raycastTargetCount = 0, 
            raycastCompletedCount = 0, 
            raycastResumptionCount = 0, 
            raycastComputeTime = 0
        }, 
        computation = coroutine.create(function() --[[ Line: 469 ]]

        end)
    };
    if not v98 then
        return v99;
    else
        local v100 = {};
        local function _(v101) --[[ Line: 476 ]]
            -- upvalues: v5 (ref), v100 (copy), v99 (copy)
            local v102 = v5(v101);
            if v102 then
                mutateMergeExtractedAssets(v100, v99.extractedAssets, v102);
            end;
            local l_stats_4 = v99.stats;
            l_stats_4.instancesTraversed = l_stats_4.instancesTraversed + 1;
        end;
        local v105 = createPlayerCharacterReferenceToPlayerMap(l_Players_0:GetPlayers());
        local l_v98_0 = v98;
        while true do
            if l_v98_0 ~= nil and (l_v98_0:IsA("PVInstance") or l_v98_0:IsA("Accessory") or l_v98_0:IsA("GuiObject") or l_v98_0:IsA("FaceInstance")) and l_v98_0 ~= workspace then
                if v105[l_v98_0] ~= nil then
                    table.insert(v99.extractedPlayers, {
                        player = v105[l_v98_0], 
                        count = 1
                    });
                    return v99;
                else
                    local v107 = v5(l_v98_0);
                    if v107 then
                        mutateMergeExtractedAssets(v100, v99.extractedAssets, v107);
                    end;
                    local l_stats_5 = v99.stats;
                    l_stats_5.instancesTraversed = l_stats_5.instancesTraversed + 1;
                    l_v98_0 = l_v98_0.Parent;
                end;
            else
                local l_v98_Children_0 = v98:GetChildren();
                for _, v111 in ipairs(l_v98_Children_0) do
                    local v112 = v5(v111);
                    if v112 then
                        mutateMergeExtractedAssets(v100, v99.extractedAssets, v112);
                    end;
                    local l_stats_6 = v99.stats;
                    l_stats_6.instancesTraversed = l_stats_6.instancesTraversed + 1;
                end;
                return v99;
            end;
        end;
    end;
end;
extractItemsFromInterpretations = function(v114, v115) --[[ Line: 516 ]] --[[ Name: extractItemsFromInterpretations ]]
    -- upvalues: v5 (copy)
    local v116 = false;
    local v117 = {
        extractedAssets = {
            Package = {}, 
            Model = {}, 
            Image = {}, 
            Mesh = {}, 
            Text = {}, 
            Video = {}
        }, 
        extractedPlayers = {}, 
        cancel = function() --[[ Line: 532 ]] --[[ Name: cancel ]]
            -- upvalues: v116 (ref)
            v116 = true;
        end, 
        stats = {
            hitCountMapSize = 0, 
            topLevelObjectsSize = 0, 
            instancesTraversed = 0, 
            traversalTaskListSize = 0, 
            traversalTasksCompleted = 0, 
            playersCount = 0, 
            resumptionCount = 0, 
            wallTime = 0, 
            computeTime = 0, 
            raycastTargetCount = 0, 
            raycastCompletedCount = 0, 
            raycastResumptionCount = 0, 
            raycastComputeTime = 0
        }
    };
    v117.computation = coroutine.create(function() --[[ Line: 551 ]]
        -- upvalues: v115 (copy), v117 (copy)
        v115(v117);
    end);
    for _, v119 in ipairs(v114) do
        v119.cancel();
        local l_stats_7 = v117.stats;
        l_stats_7.raycastTargetCount = l_stats_7.raycastTargetCount + v119.stats.targetCount;
        l_stats_7 = v117.stats;
        l_stats_7.raycastCompletedCount = l_stats_7.raycastCompletedCount + v119.stats.completedCount;
        l_stats_7 = v117.stats;
        l_stats_7.raycastResumptionCount = l_stats_7.raycastResumptionCount + v119.stats.resumptionCount;
        l_stats_7 = v117.stats;
        l_stats_7.raycastComputeTime = l_stats_7.raycastComputeTime + v119.stats.computeTime;
    end;
    local v121 = os.clock();
    local v122 = {};
    local v123 = {};
    for _, v125 in ipairs(v114) do
        for v126, v127 in pairs(v125.hitCountMap) do
            if not v122[v126] then
                v122[v126] = {
                    raycastHits = 0, 
                    children = {}
                };
                local l_stats_8 = v117.stats;
                l_stats_8.hitCountMapSize = l_stats_8.hitCountMapSize + 1;
            end;
            local v129 = v122[v126];
            v129.raycastHits = v129.raycastHits + v127.raycastHits;
            for v130, _ in pairs(v127.children) do
                v122[v126].children[v130] = true;
            end;
        end;
        for v132, v133 in pairs(v125.topLevelObjects) do
            local v134 = v123[v132];
            if not v134 then
                local l_stats_9 = v117.stats;
                l_stats_9.topLevelObjectsSize = l_stats_9.topLevelObjectsSize + 1;
            end;
            v123[v132] = (v134 or 0) + v133;
        end;
    end;
    local v136, v137 = createTraversalTaskList(v122, v123);
    v117.extractedPlayers = v137;
    v117.stats.playersCount = #v137;
    v117.stats.wallTime = os.clock() - v121;
    v117.stats.traversalTaskListSize = #v136;
    v117.computation = coroutine.create(function() --[[ Line: 599 ]]
        -- upvalues: v117 (copy), v136 (copy), v116 (ref), v115 (copy), v122 (copy), v5 (ref)
        local v138 = false;
        local v139 = os.clock();
        local v140 = os.clock();
        local function _() --[[ Line: 602 ]]
            -- upvalues: v140 (ref)
            return v140 + 0.011111111111111112 < os.clock();
        end;
        local function _() --[[ Line: 605 ]]
            -- upvalues: v117 (ref), v140 (ref)
            local l_stats_10 = v117.stats;
            l_stats_10.computeTime = l_stats_10.computeTime + (os.clock() - v140);
            task.wait();
            v140 = os.clock();
            l_stats_10 = v117.stats;
            l_stats_10.resumptionCount = l_stats_10.resumptionCount + 1;
        end;
        local v144 = {};
        local v145 = {};
        for _, v147 in ipairs(v136) do
            local v148 = {};
            local v149 = {};
            table.insert(v148, v147.instance);
            repeat
                if #v148 > 0 then
                    if v140 + 0.011111111111111112 < os.clock() then
                        local l_stats_11 = v117.stats;
                        l_stats_11.computeTime = l_stats_11.computeTime + (os.clock() - v140);
                        task.wait();
                        v140 = os.clock();
                        l_stats_11 = v117.stats;
                        l_stats_11.resumptionCount = l_stats_11.resumptionCount + 1;
                        if v116 then
                            l_stats_11 = v117.stats;
                            l_stats_11.wallTime = l_stats_11.wallTime + (os.clock() - v139);
                            v115(v117);
                            return;
                        end;
                    end;
                    local v151 = table.remove(v148);
                    if not v145[v151] then
                        table.insert(v149, v151);
                        local l_v151_Children_0 = v151:GetChildren();
                        local v153 = {};
                        for _, v155 in pairs(l_v151_Children_0) do
                            table.insert(v153, {
                                v155, 
                                if v122[v155] then v122[v155].raycastHits else 0
                            });
                        end;
                        table.sort(v153, descendingOrderBySecondElement);
                        for _, v157 in ipairs(v153) do
                            table.insert(v148, v157[1]);
                        end;
                        v145[v151] = true;
                    end;
                else
                    repeat
                        if #v149 > 0 then
                            if v140 + 0.011111111111111112 < os.clock() then
                                local l_stats_12 = v117.stats;
                                l_stats_12.computeTime = l_stats_12.computeTime + (os.clock() - v140);
                                task.wait();
                                v140 = os.clock();
                                l_stats_12 = v117.stats;
                                l_stats_12.resumptionCount = l_stats_12.resumptionCount + 1;
                                if v116 then
                                    l_stats_12 = v117.stats;
                                    l_stats_12.wallTime = l_stats_12.wallTime + (os.clock() - v139);
                                    v115(v117);
                                    return;
                                end;
                            end;
                            local v159 = table.remove(v149);
                            local v160 = v5(v159);
                            if v160 then
                                mutateMergeExtractedAssets(v144, v117.extractedAssets, v160);
                            end;
                            local l_stats_13 = v117.stats;
                            l_stats_13.instancesTraversed = l_stats_13.instancesTraversed + 1;
                        else
                            local l_stats_14 = v117.stats;
                            l_stats_14.traversalTasksCompleted = l_stats_14.traversalTasksCompleted + 1;
                            v138 = true;
                        end;
                    until v138;
                end;
            until v138;
            v138 = false;
        end;
        local l_stats_15 = v117.stats;
        l_stats_15.wallTime = l_stats_15.wallTime + (os.clock() - v139);
        l_stats_15 = v117.stats;
        l_stats_15.computeTime = l_stats_15.computeTime + (os.clock() - v140);
        v115(v117);
    end);
    return v117;
end;
return {
    interpretAnnotation = interpretAnnotation, 
    extractItemsFromInterpretations = extractItemsFromInterpretations, 
    interpretInstanceListForGUIObjects = interpretInstanceListForGUIObjects, 
    interpretAndExtractItemsFromInstanceForPreciseSelection = interpretAndExtractItemsFromInstanceForPreciseSelection, 
    __setRandomGenerator = function(v164) --[[ Line: 698 ]] --[[ Name: __setRandomGenerator ]]
        -- upvalues: v6 (ref)
        v6 = v164;
    end
};