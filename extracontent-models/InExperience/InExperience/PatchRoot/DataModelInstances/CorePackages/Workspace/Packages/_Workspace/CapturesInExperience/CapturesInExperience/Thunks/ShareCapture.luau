local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_default_0 = require(l_Parent_1.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local v6 = require(l_Parent_1.SocialStopwatch);
local v7 = require(l_Parent_0.Enums.CaptureType);
local v8 = require(l_Parent_0.Constants);
local v9 = require(l_Parent_0.Enums.ServerType);
local v10 = require(l_Parent_0.Analytics.EventNames);
local _ = require(l_Parent_0.Enums.ExternalShareSourceType);
local v12 = require(l_Parent_0.Analytics.FireEvent);
local v13 = require(l_Parent_0.Utils.getPlaceIdFromCapture);
local v14 = require(l_Parent_0.App.Networking);
local _ = require(l_Parent_0.Types);
local v16 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v17 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
local l_ShareLinksNetworking_0 = v14.ShareLinksNetworking;
local l_LinkType_0 = v14.ShareLinksRodux.Enums.LinkType;
local v20 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local function v23(v21, v22) --[[ Line: 33 ]] --[[ Name: shareImage ]]
    -- upvalues: l_default_0 (copy), v8 (copy), v20 (copy)
    if not l_default_0 then
        return;
    else
        assert(l_default_0 ~= nil, "ExternalContentSharingProtocol is required");
        l_default_0:shareImage({
            context = v8.CapturesContext, 
            image = v21, 
            shareSheetTitle = v20:Format("Feature.Captures.Action.ShareYourCapture"), 
            url = v22
        });
        return;
    end;
end;
local function v26(v24, v25) --[[ Line: 48 ]] --[[ Name: shareVideo ]]
    -- upvalues: l_default_0 (copy), v8 (copy), v20 (copy)
    if not l_default_0 then
        return;
    else
        assert(l_default_0 ~= nil, "ExternalContentSharingProtocol is required");
        l_default_0:shareVideo({
            context = v8.CapturesContext, 
            shareSheetTitle = v20:Format("Feature.Captures.Action.ShareYourCapture"), 
            url = v25, 
            video = v24
        });
        return;
    end;
end;
local function v31(v27, v28) --[[ Line: 63 ]] --[[ Name: shareCapture ]]
    -- upvalues: v17 (copy), l_CaptureService_0 (copy), v26 (copy), v23 (copy), v16 (copy), v7 (copy)
    if v17 and v27.CaptureTime ~= nil then
        local v29 = l_CaptureService_0:PreCaptureShared(v27);
        if v27.CaptureType == Enum.CaptureType.Video then
            v26(v29, v28);
        else
            v23(v29, v28);
        end;
        l_CaptureService_0:OnCaptureObjectShared(v27);
        return;
    elseif v16 and v27.type == v7.Video then
        local v30 = l_CaptureService_0:PreVideoCaptureShared(v27.videoCapture);
        v26(v30, v28);
        l_CaptureService_0:OnVideoCaptureShared(v27.videoCapture);
        return;
    else
        v23(v27.filePath, v28);
        l_CaptureService_0:OnCaptureShared(v27.filePath);
        return;
    end;
end;
local function _(v32) --[[ Line: 82 ]] --[[ Name: sendShareLatencyEvent ]]
    -- upvalues: v6 (copy), v12 (copy), v10 (copy)
    local v33 = v6.Stopwatch.stop(v6.Events.CaptureShared);
    v12(v10.CapturesShareLatency, {
        statValue = if v33 then v33.timeElapsed else nil, 
        externalShareSource = v32
    });
end;
return function(v35, v36, v37) --[[ Line: 90 ]]
    -- upvalues: v9 (copy), v17 (copy), v7 (copy), v31 (copy), v12 (copy), v10 (copy), v6 (copy), v13 (copy), l_LinkType_0 (copy), l_ShareLinksNetworking_0 (copy)
    return function(v38) --[[ Line: 95 ]]
        -- upvalues: v9 (ref), v17 (ref), v35 (copy), v7 (ref), v31 (ref), v12 (ref), v10 (ref), v36 (copy), v6 (ref), v13 (ref), v37 (copy), l_LinkType_0 (ref), l_ShareLinksNetworking_0 (ref)
        local v39 = v38:getState().ServerType == v9.StandardServer;
        local v40 = if v17 then v35.CaptureType == Enum.CaptureType.Video else v35.type == v7.Video;
        if not v39 then
            v31(v35);
            v12(v10.CapturesShareFromNonStandardServer);
            local l_v36_0 = v36;
            local v42 = v6.Stopwatch.stop(v6.Events.CaptureShared);
            v12(v10.CapturesShareLatency, {
                statValue = if v42 then v42.timeElapsed else nil, 
                externalShareSource = l_v36_0
            });
            return;
        else
            local v43 = nil;
            local l_PlaceId_0 = game.PlaceId;
            local v45 = if v40 then if v17 then v35.SourcePlaceId else v35.videoCapture.SourcePlaceId else v13(v35);
            if l_PlaceId_0 == v45 then
                v43 = game.JobId;
            end;
            local v46 = {
                instanceId = v43, 
                launchData = v37, 
                linkType = l_LinkType_0.ScreenshotInvite.rawValue(), 
                placeId = v45
            };
            v38:dispatch(l_ShareLinksNetworking_0.GenerateLink.API(v46)):andThen(function(v47) --[[ Line: 129 ]]
                -- upvalues: v31 (ref), v35 (ref), v36 (ref), v6 (ref), v12 (ref), v10 (ref)
                local l_shortUrl_0 = v47.responseBody.shortUrl;
                v31(v35, l_shortUrl_0);
                local l_v36_1 = v36;
                local v50 = v6.Stopwatch.stop(v6.Events.CaptureShared);
                v12(v10.CapturesShareLatency, {
                    statValue = if v50 then v50.timeElapsed else nil, 
                    externalShareSource = l_v36_1
                });
            end):catch(function(v51) --[[ Line: 134 ]]
                -- upvalues: v12 (ref), v10 (ref), v31 (ref), v35 (ref), v36 (ref), v6 (ref)
                warn("GenerateLink failed with error:", v51);
                v12(v10.ShareCaptureGenerateLinkFailed, {
                    httpError = v51.HttpError
                });
                v31(v35);
                local l_v36_2 = v36;
                local v53 = v6.Stopwatch.stop(v6.Events.CaptureShared);
                v12(v10.CapturesShareLatency, {
                    statValue = if v53 then v53.timeElapsed else nil, 
                    externalShareSource = l_v36_2
                });
            end);
            return;
        end;
    end;
end;