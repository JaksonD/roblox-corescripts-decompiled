local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_ApiFetchGameMedia_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Thunks.Games.ApiFetchGameMedia;
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local l_GameMediaImageType_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).GameMediaImageType;
local l_reportWarning_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics).Points.reportWarning;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v11 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_useIsVideoEligible_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).useIsVideoEligible;
local l_useCanDevicePlayVideoPreview_0 = require(l_CorePackages_0.Workspace.Packages.VideoUtils).useCanDevicePlayVideoPreview;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_SystemInfoProtocol_0 = require(l_CorePackages_0.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v19 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v24 = game:DefineFastFlag("LuaAppEdpVideoManufacturerDeny2", false);
local v25 = game:DefineFastFlag("LuaAppEdpVideoDeviceDeny", false);
local v26 = game:DefineFastFlag("LuaAppEdpVideoMaxMemoryDeny", false);
local v27 = game:DefineFastInt("LuaAppEdpVideoMaxMemoryThresholdMb", -1);
local v28 = game:DefineFastFlag("LuaAppEdpVideoAvailableRamDeny", false);
local v29 = game:DefineFastInt("LuaAppEdpVideoAvailableRamThresholdMb", -1);
local v30 = game:DefineFastInt("EdpVideoBlockingTelemetryThrottleHundredthsPercent", 0);
local v31 = game:DefineFastString("LuaAppEdpVideoDevicePipeDenyList", "");
local v32 = game:DefineFastString("LuaAppEdpVideoManufacturerPipeDenyList", "");
local l_FFlagLuaAppRefactorEdpVideoBlockingChecks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRefactorEdpVideoBlockingChecks;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
if not l_FFlagLuaAppRefactorEdpVideoBlockingChecks_0 then
    if v24 or v25 or v26 then
        pcall(function() --[[ Line: 61 ]]
            -- upvalues: v24 (copy), l_SystemInfoProtocol_0 (copy), v25 (copy), v26 (copy), v32 (copy), v34 (ref), v31 (copy), v35 (ref), v27 (copy), v36 (ref)
            local v38 = {};
            if v24 then
                table.insert(v38, l_SystemInfoProtocol_0.InfoNames.MANUFACTURER);
            end;
            if v25 then
                table.insert(v38, l_SystemInfoProtocol_0.InfoNames.DEVICE_NAME);
            end;
            if v26 then
                table.insert(v38, l_SystemInfoProtocol_0.InfoNames.MAX_MEMORY);
            end;
            local v39 = l_SystemInfoProtocol_0.default:getSystemInfo(v38);
            if v24 and typeof(v39.manufacturer) == "string" then
                for v40 in v32:gmatch("([^|]+)") do
                    if typeof(v40) == "string" and string.lower(v40) == string.lower(v39.manufacturer) then
                        v34 = true;
                        break;
                    end;
                end;
            end;
            if v25 and typeof(v39.deviceName) == "string" then
                for v41 in v31:gmatch("([^|]+)") do
                    if typeof(v41) == "string" and string.lower(v41) == string.lower(v39.deviceName) then
                        v35 = true;
                        break;
                    end;
                end;
            end;
            if v26 and v27 > 0 and typeof(v39.maxMemory) == "string" then
                local v42 = tonumber(v39.maxMemory:match("(%d+)"));
                if v42 and v42 < v27 then
                    v36 = true;
                end;
            end;
        end);
    end;
    v37 = {
        eventName = "EdpVideoPreviewBlockingStatus", 
        backends = {
            "Points", 
            "EventIngest"
        }, 
        lastUpdated = {
            25, 
            10, 
            20
        }, 
        description = "Telemetry about whether or not the video is blocked by manufacturer/device/max memory", 
        throttlingPercentage = v30
    };
end;
local v43 = nil;
if l_FFlagLuaAppRefactorEdpVideoBlockingChecks_0 then
    v43 = {
        enableManufacturerDeny = v24, 
        enableDeviceDeny = v25, 
        enableMaxMemoryDeny = v26, 
        enableAvailableRamDeny = v28, 
        manufacturerDenyList = v32, 
        deviceDenyList = v31, 
        maxMemoryThresholdMb = v27, 
        availableRamThresholdMb = v29
    };
end;
local function _(v44) --[[ Line: 140 ]] --[[ Name: getDefaultMediaEntry ]]
    -- upvalues: l_GameMediaImageType_0 (copy), l_Url_0 (copy)
    return {
        mediaType = l_GameMediaImageType_0.Image, 
        imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v44, 640, 360)
    };
end;
local function v52(v46, v47, v48) --[[ Line: 147 ]] --[[ Name: processedMediaEntry ]]
    -- upvalues: l_GameMediaImageType_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy)
    local l_assetTypeId_0 = v46.assetTypeId;
    local v50 = nil;
    if l_assetTypeId_0 == l_GameMediaImageType_0.YouTubeVideo then
        if not v47 then
            return nil;
        else
            v50 = string.format("https://img.youtube.com/vi/%s/hqdefault.jpg", v46.youTubeVideoHash);
        end;
    else
        v50 = "http://www.roblox.com/asset/?id=" .. tostring(v46.imageId);
    end;
    local v51 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v48 and (not (l_assetTypeId_0 ~= l_GameMediaImageType_0.Video) or l_assetTypeId_0 == l_GameMediaImageType_0.GamePreviewVideo) and v46.videoId then ("rbxassetid://%*"):format(v46.videoId) else nil;
    return {
        mediaType = v46.assetTypeId, 
        imageId = v50, 
        youTubeVideoHash = v46.youTubeVideoHash, 
        youTubeVideoTitle = v46.youTubeVideoTitle, 
        videoId = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v48 then v51 else nil
    };
end;
return function(v53, v54, v55, v56, v57) --[[ Line: 177 ]] --[[ Name: useSelectedGameMediaEntries ]]
    -- upvalues: l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), l_useAppPolicy_0 (copy), l_useSelector_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameInfosReducer_0 (copy), v19 (copy), l_ApiFetchGameMedia_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_useIsVideoEligible_0 (copy), l_FFlagLuaAppRefactorEdpVideoBlockingChecks_0 (copy), l_useCanDevicePlayVideoPreview_0 (copy), v43 (ref), l_AppPage_0 (copy), v2 (copy), l_RetrievalStatus_0 (copy), l_GameMediaImageType_0 (copy), l_Url_0 (copy), v28 (copy), v29 (copy), l_SystemInfoProtocol_0 (copy), l_reportWarning_0 (copy), v11 (copy), v52 (copy), v4 (copy), l_TelemetryService_0 (copy), v37 (ref), v24 (copy), v34 (ref), v25 (copy), v35 (ref), v26 (copy), v36 (ref)
    local v58 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then not l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 or v56 else nil;
    local v60 = l_useAppPolicy_0(function(v59) --[[ Line: 188 ]]
        return v59.getShowVideoThumbnails();
    end);
    local v64 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then nil else l_useSelector_0(function(v61) --[[ Line: 194 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v57 (copy), v53 (copy), l_GameInfosReducer_0 (ref)
        local v62 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v57 then v61.GameDetailsV2[v53] else v61.GameDetails[v53];
        local v63 = v61.Personalization[l_GameInfosReducer_0.key][v53];
        return v62 and v62.rootPlaceId or v63 and v63.placeId;
    end);
    local v66 = l_useSelector_0(function(v65) --[[ Line: 204 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v57 (copy), v19 (ref), v53 (copy), l_ApiFetchGameMedia_0 (ref)
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v57 then
            return v19.GetFetchingStatus(v65, v53);
        else
            return l_ApiFetchGameMedia_0.GetFetchingStatus(v65, v53);
        end;
    end);
    local v68 = l_useSelector_0(function(v67) --[[ Line: 215 ]]
        -- upvalues: v53 (copy)
        return v67.GameMedia[v53];
    end);
    local v69 = nil;
    local v70 = nil;
    if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then
        v69 = l_useSelector_0(function(v71) --[[ Line: 223 ]]
            -- upvalues: l_FetchGamePlayabilityAndProductInfo_0 (ref), v53 (copy)
            return l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v71, v53);
        end);
        v70 = l_useIsVideoEligible_0(v53);
    end;
    local v72 = nil;
    if l_FFlagLuaAppRefactorEdpVideoBlockingChecks_0 then
        v72 = l_useCanDevicePlayVideoPreview_0(v43, v53, l_AppPage_0.ExperienceDetail);
    end;
    return (v2.useMemo(function() --[[ Line: 237 ]]
        -- upvalues: v68 (copy), v66 (copy), l_RetrievalStatus_0 (ref), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), v54 (copy), v64 (copy), l_GameMediaImageType_0 (ref), l_Url_0 (ref), v58 (copy), l_FFlagLuaAppRefactorEdpVideoBlockingChecks_0 (ref), v28 (ref), v29 (ref), l_SystemInfoProtocol_0 (ref), l_reportWarning_0 (ref), v11 (ref), v52 (ref), v60 (copy), v4 (ref), v69 (ref), v70 (ref), v72 (ref), l_TelemetryService_0 (ref), v37 (ref), v53 (copy), v24 (ref), v34 (ref), v25 (ref), v35 (ref), v26 (ref), v36 (ref), v55 (copy)
        if not v68 then
            if v66 == l_RetrievalStatus_0.Done then
                local v73 = {};
                local v74 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v54 else v64;
                v73[1] = {
                    mediaType = l_GameMediaImageType_0.Image, 
                    imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v74, 640, 360)
                };
                return v73;
            else
                return {};
            end;
        else
            local v75 = {};
            if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v58 then
                local v76 = nil;
                for _, v78 in ipairs(v68) do
                    if v78.assetTypeId == l_GameMediaImageType_0.Video or v78.assetTypeId == l_GameMediaImageType_0.GamePreviewVideo then
                        v76 = true;
                        break;
                    end;
                end;
                local v79 = nil;
                local v80 = nil;
                do
                    local l_v80_0 = v80;
                    if not l_FFlagLuaAppRefactorEdpVideoBlockingChecks_0 and v28 and v29 > 0 and v76 then
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 274 ]]
                            -- upvalues: l_SystemInfoProtocol_0 (ref), l_v80_0 (ref), v29 (ref)
                            local v82 = l_SystemInfoProtocol_0.default:getSystemInfo({
                                l_SystemInfoProtocol_0.InfoNames.AVAIL_RAM
                            });
                            if typeof(v82.availRAM) == "string" then
                                local v83 = tonumber(v82.availRAM);
                                l_v80_0 = v83;
                                if v83 and v83 < v29 then
                                    return true;
                                end;
                            end;
                            return false;
                        end);
                        if not l_status_0 then
                            l_reportWarning_0(v11.default, "EdpVideoPreviewBlocking", (("Error retrieving available RAM for video preview blocking check: %*"):format(l_result_0)));
                        else
                            v79 = l_result_0;
                        end;
                    end;
                    local v86 = nil;
                    for _, v88 in ipairs(v68) do
                        local v89 = v52(v88, v60, true);
                        if v89 then
                            if v89.mediaType == l_GameMediaImageType_0.Video or v89.mediaType == l_GameMediaImageType_0.GamePreviewVideo then
                                v4.assert(v76);
                                if v69 == l_RetrievalStatus_0.Done and v70 then
                                    if l_FFlagLuaAppRefactorEdpVideoBlockingChecks_0 then
                                        if not v72() then
                                            continue;
                                        end;
                                    else
                                        l_TelemetryService_0:LogEvent(v37, {
                                            standardizedFields = {
                                                "addOSInfo", 
                                                "addSessionInfo"
                                            }, 
                                            customFields = {
                                                universeId = v53, 
                                                isBlockedByManufacturer = if v24 then v34 or false else nil, 
                                                isBlockedByDevice = if v25 then v35 or false else nil, 
                                                isBlockedByMaxMemory = if v26 then v36 or false else nil, 
                                                isBlockedByAvailableRam = if v28 then v79 or false else nil, 
                                                availableRam = if v28 then l_v80_0 else nil
                                            }
                                        });
                                        if v24 and v34 or v25 and v35 or v26 and v36 or v28 and v79 then
                                            continue;
                                        end;
                                    end;
                                    v4.assert(not v86);
                                    table.insert(v75, 1, v89);
                                    v86 = true;
                                end;
                            elseif v89.mediaType == l_GameMediaImageType_0.YouTubeVideo then
                                if not v76 or v69 == l_RetrievalStatus_0.Done and not v70 then
                                    if v55 then
                                        table.insert(v75, 1, v89);
                                    else
                                        table.insert(v75, v89);
                                    end;
                                end;
                            elseif v89.mediaType == l_GameMediaImageType_0.Image then
                                table.insert(v75, v89);
                            else
                                warn("Unknown media type: " .. tostring(v89.mediaType));
                            end;
                        end;
                    end;
                end;
            else
                for _, v91 in ipairs(v68) do
                    local v92 = v52(v91, v60);
                    if v92 then
                        if v92.mediaType == l_GameMediaImageType_0.YouTubeVideo then
                            if v55 then
                                table.insert(v75, 1, v92);
                            else
                                table.insert(v75, v92);
                            end;
                        elseif v92.mediaType == l_GameMediaImageType_0.Image then
                            table.insert(v75, v92);
                        else
                            warn("Unknown media type: " .. tostring(v92.mediaType));
                        end;
                    end;
                end;
            end;
            return {
                unpack(v75, 1, 10)
            };
        end;
    end, {
        v60, 
        v55, 
        if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v56 else nil, 
        if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v58 else nil, 
        v53, 
        if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v54 else v64, 
        v66, 
        v68, 
        if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v69 else nil, 
        if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v70 else nil, 
        if l_FFlagLuaAppRefactorEdpVideoBlockingChecks_0 then v72 else nil
    }));
end;