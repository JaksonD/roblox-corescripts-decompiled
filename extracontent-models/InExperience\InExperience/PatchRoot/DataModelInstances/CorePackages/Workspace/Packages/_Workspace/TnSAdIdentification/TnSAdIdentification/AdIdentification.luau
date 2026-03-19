local l_AdService_0 = game:GetService("AdService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TnSAdIdentification");
local v3 = require(l_script_FirstAncestor_0.Flags.GetFIntAdIdentificationMinimumAreaPerMyriad);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFIntAdIdentifiedTelemetryThrottleHundredthsPercent);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.LoggingProtocol);
local l_default_0 = v6.default;
local l_GetFFlagAvatarIdentificationSafeAreaFix_0 = require(l_Parent_0.SharedFlags).GetFFlagAvatarIdentificationSafeAreaFix;
local l_IdentificationUtils_0 = require(l_Parent_0.AvatarIdentification).IdentificationUtils;
local v10 = math.max(v3() / 10000, 0);
local v11 = {};
getLocalCharacterPosition = function(v12) --[[ Line: 33 ]] --[[ Name: getLocalCharacterPosition ]]
    local l_HumanoidRootPart_0 = v12:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_0 then
        return nil;
    else
        return l_HumanoidRootPart_0.Position;
    end;
end;
checkVisibility = function(v14, v15, v16, v17) --[[ Line: 45 ]] --[[ Name: checkVisibility ]]
    local l_Position_0 = v14.CFrame.Position;
    local l_ViewportSize_0 = v14.ViewportSize;
    local v20 = RaycastParams.new();
    v20.FilterType = Enum.RaycastFilterType.Exclude;
    v20.FilterDescendantsInstances = v17;
    v20.IgnoreWater = true;
    local v21 = 0;
    local v22 = 0;
    local v23 = v16[2] - v16[1];
    local v24 = v16[3] - v16[1];
    for v25 = 1, 4 do
        local v26 = v23 * (v25 - 0.5) / 4;
        for v27 = 1, 4 do
            local v28 = v16[1] + v26 + v24 * (v27 - 0.5) / 4;
            local v29 = v28 - l_Position_0;
            v21 = v21 + 1;
            local v30, _ = v14:WorldToViewportPoint(v28);
            if v30.Z >= 0 and v30.X >= 0 and v30.Y >= 0 and v30.X <= l_ViewportSize_0.X and v30.Y <= l_ViewportSize_0.Y then
                local v32 = workspace:Raycast(l_Position_0, v29 * 1.1, v20);
                if v32 and v32.Instance == v15 then
                    v22 = v22 + 1;
                end;
            end;
        end;
    end;
    return v22 / v21;
end;
createSingleVisibleRegionFromWorldSpaceCorners = function(v33, v34, v35) --[[ Line: 93 ]] --[[ Name: createSingleVisibleRegionFromWorldSpaceCorners ]]
    -- upvalues: l_GetFFlagAvatarIdentificationSafeAreaFix_0 (copy), l_IdentificationUtils_0 (copy)
    local l_ViewportSize_1 = v34.ViewportSize;
    local v37 = table.create(#v33);
    for v38, v39 in ipairs(v33) do
        if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then
            local v40, _, _ = l_IdentificationUtils_0.worldToFullViewportPointNormalized(v39, v34, v35);
            v37[v38] = Vector2.new(v40.X, v40.Y);
        else
            local v43, _ = v34:WorldToViewportPoint(v39);
            v37[v38] = Vector2.new(v43.X, v43.Y) / l_ViewportSize_1;
        end;
    end;
    return {
        convexHull = {
            v37[1], 
            v37[2], 
            v37[4], 
            v37[3]
        }, 
        id = 1
    };
end;
getAdCenterAndScreenArea = function(v45, v46) --[[ Line: 117 ]] --[[ Name: getAdCenterAndScreenArea ]]
    local l_ViewportSize_2 = v46.ViewportSize;
    local v48 = Vector3.new(0, 0, 0, 0);
    local v49 = 0;
    local v50 = {};
    for _, v52 in ipairs(v45) do
        v48 = v48 + v52;
        local v53, _ = v46:WorldToViewportPoint(v52);
        table.insert(v50, Vector2.new(v53.X, v53.Y) / l_ViewportSize_2);
    end;
    return v48 / 4, (v49 + math.abs(((v50[2] - v50[1]):Cross(v50[3] - v50[1]))) + math.abs(((v50[2] - v50[4]):Cross(v50[3] - v50[4])))) / 2;
end;
v11.getAdsForPoint = function(v55, v56) --[[ Line: 185 ]]
    local v57 = {};
    for v58, v59 in pairs(v55) do
        local l_boundingBox_0 = v59.boundingBox;
        if v56.X >= l_boundingBox_0.min.X and v56.Y >= l_boundingBox_0.min.Y and v56.X <= l_boundingBox_0.max.X and v56.Y <= l_boundingBox_0.max.Y then
            for _, v62 in ipairs(v59.visibleRegions) do
                local l_convexHull_0 = v62.convexHull;
                if #l_convexHull_0 >= 3 then
                    local v64 = l_convexHull_0[#l_convexHull_0];
                    local v65 = true;
                    local v66 = true;
                    for _, v68 in ipairs(l_convexHull_0) do
                        local v69 = (v68 - v64):Cross(v56 - v64);
                        v66 = v66 and v69 <= 0;
                        v65 = v65 and v69 >= 0;
                        v64 = v68;
                    end;
                    if v65 or v66 then
                        v57[v58] = v59;
                        break;
                    end;
                end;
            end;
        end;
    end;
    return v57;
end;
v11.getVisibleAds = function() --[[ Line: 221 ]]
    -- upvalues: l_AdService_0 (copy), l_Players_0 (copy), l_GetFFlagAvatarIdentificationSafeAreaFix_0 (copy), l_IdentificationUtils_0 (copy), v10 (copy), l_default_0 (copy), v6 (copy), v4 (copy)
    local v70 = {};
    local v71 = {
        totalAds = 0, 
        checkedAds = 0, 
        duration = 0
    };
    local l_l_AdService_0_ReportAdInfo_0 = l_AdService_0:GetReportAdInfo();
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return v70, v71;
    else
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            return v70, v71;
        else
            local l_Character_0 = l_LocalPlayer_0.Character;
            local v76 = nil;
            local v77 = {};
            v76 = if l_Character_0 then getLocalCharacterPosition(l_Character_0) or l_CurrentCamera_0.CFrame.Position else l_CurrentCamera_0.CFrame.Position;
            local v78 = nil;
            if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then
                v78 = l_IdentificationUtils_0.getViewportInfo();
                v71.viewportInfo = v78;
            end;
            local v79 = os.clock();
            v71.totalAds = #l_l_AdService_0_ReportAdInfo_0;
            local function _() --[[ Line: 260 ]]
                -- upvalues: v71 (copy), v79 (copy)
                v71.duration = os.clock() - v79;
                return v71;
            end;
            local function _() --[[ Line: 265 ]]
                -- upvalues: v79 (copy)
                return os.clock() - v79 > 0.2;
            end;
            local v82 = 1;
            for _, v84 in ipairs(l_l_AdService_0_ReportAdInfo_0) do
                if os.clock() - v79 > 0.2 then
                    local l_v70_0 = v70;
                    v71.duration = os.clock() - v79;
                    return l_v70_0, v71;
                else
                    local l_basePart_0 = v84.basePart;
                    local l_adUnitName_0 = v84.adUnitName;
                    local l_assetId_0 = v84.assetId;
                    local l_encryptedAdTrackingData_0 = v84.encryptedAdTrackingData;
                    local l_encryptionMetadata_0 = v84.encryptionMetadata;
                    if l_encryptedAdTrackingData_0 == "" or l_encryptionMetadata_0 == "" or l_assetId_0 == "11307989327" then
                        v71.checkedAds = v71.checkedAds + 1;
                    else
                        local l_assetCorners_0 = v84.assetCorners;
                        if not l_assetCorners_0 or #l_assetCorners_0 < 4 then
                            v71.checkedAds = v71.checkedAds + 1;
                        else
                            local v92, v93 = getAdCenterAndScreenArea(l_assetCorners_0, l_CurrentCamera_0);
                            local l_Magnitude_0 = (v92 - v76).Magnitude;
                            if (v92 - l_CurrentCamera_0.CFrame.Position):Dot(l_CurrentCamera_0.CFrame.LookVector) < 0 then
                                v71.checkedAds = v71.checkedAds + 1;
                            else
                                local l_Unit_0 = (l_assetCorners_0[1] - l_assetCorners_0[2]):Cross(l_assetCorners_0[1] - l_assetCorners_0[3]).Unit;
                                if l_Unit_0:Dot(v92 - l_basePart_0.Position) < 0 then
                                    l_Unit_0 = -l_Unit_0;
                                end;
                                if (l_CurrentCamera_0.CFrame.Position - v92):Dot(l_Unit_0) < 0 then
                                    v71.checkedAds = v71.checkedAds + 1;
                                else
                                    local v96, v97 = l_IdentificationUtils_0.getViewportCorners(l_assetCorners_0, l_CurrentCamera_0, v78);
                                    if v96 == l_IdentificationUtils_0.defaultMin then
                                        v71.checkedAds = v71.checkedAds + 1;
                                    elseif v93 < v10 then
                                        v71.checkedAds = v71.checkedAds + 1;
                                    else
                                        local v98 = checkVisibility(l_CurrentCamera_0, l_basePart_0, l_assetCorners_0, v77);
                                        if v98 < 0.3 then
                                            v71.checkedAds = v71.checkedAds + 1;
                                        elseif os.clock() - v79 > 0.2 then
                                            local l_v70_1 = v70;
                                            v71.duration = os.clock() - v79;
                                            return l_v70_1, v71;
                                        else
                                            v70[v82] = {
                                                distance = l_Magnitude_0, 
                                                boundingBox = {
                                                    min = v96, 
                                                    max = v97
                                                }, 
                                                hitRate = v98, 
                                                visibleRegions = {
                                                    createSingleVisibleRegionFromWorldSpaceCorners(l_assetCorners_0, l_CurrentCamera_0, v78)
                                                }, 
                                                adUnitName = l_adUnitName_0, 
                                                assetId = l_assetId_0, 
                                                encryptedAdTrackingData = l_encryptedAdTrackingData_0, 
                                                encryptionMetadata = l_encryptionMetadata_0
                                            };
                                            l_default_0:logRobloxTelemetryEvent({
                                                eventName = "AdIdentifiedInAbuseReport", 
                                                backends = {
                                                    v6.TelemetryBackends.Points
                                                }, 
                                                throttlingPercentage = v4(), 
                                                lastUpdated = {
                                                    24, 
                                                    6, 
                                                    25
                                                }, 
                                                description = "Ad Identified in Report Anything Screenshot"
                                            }, nil, {
                                                assetId = l_assetId_0, 
                                                encryptedAdTrackingData = l_encryptedAdTrackingData_0, 
                                                encryptionMetadata = l_encryptionMetadata_0
                                            });
                                            v71.checkedAds = v71.checkedAds + 1;
                                            v82 = v82 + 1;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            local l_v70_2 = v70;
            v71.duration = os.clock() - v79;
            return l_v70_2, v71;
        end;
    end;
end;
return v11;