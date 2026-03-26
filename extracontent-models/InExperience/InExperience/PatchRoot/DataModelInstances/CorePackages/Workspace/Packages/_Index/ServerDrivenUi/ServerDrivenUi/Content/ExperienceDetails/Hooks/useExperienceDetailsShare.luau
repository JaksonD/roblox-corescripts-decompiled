local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactUtils);
local v3 = require(l_Parent_0.UniversalAppPolicy);
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local v7 = require(l_Parent_0.UrlBuilder);
local v8 = require(l_Parent_0.RobloxAppEnums);
local v9 = require(l_Parent_0.NavigationRodux);
local v10 = require(l_Parent_0.ToastRodux);
local v11 = require(l_Parent_0.HttpRequest);
local _ = require(l_Parent_0.LuauPolyfill);
local v13 = require(l_Parent_0.DiscoveryAnalytics);
local v14 = require(l_Parent_0.DiscoveryUtils);
local l_useDispatch_0 = v2.Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = v3.useAppPolicy;
local l_UrlBuilder_0 = v7.UrlBuilder;
local l_UrlBase_0 = v7.UrlBase;
local l_AppPage_0 = v8.AppPage;
local l_NavigateDown_0 = v9.Thunks.NavigateDown;
local l_ToastType_0 = v10.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v10.Actions.SetCurrentToastMessage;
local l_gameCopyExperienceLink_0 = v13.Events.gameCopyExperienceLink;
local l_gameShareExperienceLink_0 = v13.Events.gameShareExperienceLink;
local l_logResponseError_0 = v14.logResponseError;
local l_DiscoveryEventErrorLogger_0 = v14.DiscoveryEventErrorLogger;
local function v39(v27) --[[ Line: 40 ]] --[[ Name: fetchShareLinkId ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), l_HttpService_0 (copy), v11 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_logResponseError_0 (copy)
    local v28 = l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = "sharelinks/v1/get-or-create-link"
    })();
    local v29 = {
        linkType = "ExperienceDetails", 
        data = {
            universeId = v27
        }
    };
    local v30 = l_HttpService_0:JSONEncode(v29.data);
    local v31 = l_HttpService_0:JSONEncode({
        linkType = v29.linkType, 
        data = v30
    });
    return v11.config({
        requestFunction = function(v32, v33, v34) --[[ Line: 59 ]] --[[ Name: requestFunction ]]
            -- upvalues: v11 (ref)
            return v11.requestFunctions.RequestInternal(v32, v33, v34);
        end
    })(v28, "POST", {
        postBody = v31
    }):andThen(function(v35) --[[ Line: 67 ]]
        -- upvalues: l_DiscoveryEventErrorLogger_0 (ref), v27 (copy)
        local v36 = v35.responseBody or v35.result;
        if v36 and v36.linkId then
            return v36.linkId;
        else
            l_DiscoveryEventErrorLogger_0.reportError("FetchShareLinkIdInvalidResponse", "Share link response missing linkId", {
                universeId = v27, 
                responseBody = v35.responseBody or v35.result
            });
            error("Failed to fetch share link id");
            return;
        end;
    end):catch(function(v37) --[[ Line: 83 ]]
        -- upvalues: l_logResponseError_0 (ref), l_DiscoveryEventErrorLogger_0 (ref), v27 (copy)
        local v38 = if type(v37) == "table" and v37.StatusCode then v37.StatusCode else nil;
        l_logResponseError_0("sharelinks/v1/get-or-create-link", {
            StatusCode = v38
        });
        l_DiscoveryEventErrorLogger_0.reportError("FetchShareLinkIdFailed", "Failed to fetch share link id", {
            universeId = v27, 
            statusCode = v38, 
            error = tostring(v37)
        });
        error(v37);
    end);
end;
local function v45(v40, v41, v42) --[[ Line: 95 ]] --[[ Name: generateExperienceDetailsShareLinkUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy)
    local _ = nil;
    local v44 = nil;
    if v40 then
        v44 = tostring(DateTime.now().UnixTimestampMillis);
        return l_UrlBuilder_0.sharelinks.shortUrl({
            linkId = v40, 
            type = "ExperienceDetails", 
            stamp = v44
        }), v44;
    else
        return l_UrlBuilder_0.game.info.appsflyer({
            universeId = v41, 
            placeId = v42
        }), v44;
    end;
end;
local function v55(v46, v47, v48, v49) --[[ Line: 113 ]] --[[ Name: handleCopyLink ]]
    -- upvalues: v39 (copy), v45 (copy), l_Players_0 (copy), l_gameCopyExperienceLink_0 (copy), l_default_0 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy)
    v39(v46):andThen(function(v50) --[[ Line: 115 ]]
        -- upvalues: v45 (ref), v46 (copy), v47 (copy), l_Players_0 (ref), l_gameCopyExperienceLink_0 (ref), v48 (copy), l_default_0 (ref), v49 (copy), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref)
        local v51, v52 = v45(v50, v46, v47);
        local v53 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
        l_gameCopyExperienceLink_0({
            ctx = v48, 
            uid = tostring(v53), 
            placeId = v47, 
            stamp = v52
        }, v48);
        l_default_0:shareUrl({
            context = "GameDetailsMoreWebURL", 
            url = v51
        });
        v49(l_SetCurrentToastMessage_0({
            toastMessage = "Feature.GameDetails.Toast.LinkCopied", 
            toastType = l_ToastType_0.SuccessConfirmation
        }));
    end):catch(function(_) --[[ Line: 136 ]]
        -- upvalues: v49 (copy), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref)
        v49(l_SetCurrentToastMessage_0({
            toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong", 
            toastType = l_ToastType_0.NetworkingError
        }));
    end);
end;
return function(v56, v57, v58) --[[ Line: 149 ]] --[[ Name: useExperienceDetailsShare ]]
    -- upvalues: l_useDispatch_0 (copy), l_useAppPolicy_0 (copy), v1 (copy), v55 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v39 (copy), v45 (copy), l_Players_0 (copy), l_gameShareExperienceLink_0 (copy), l_default_0 (copy), l_UrlBuilder_0 (copy)
    local v59 = l_useDispatch_0();
    local v61 = l_useAppPolicy_0(function(v60) --[[ Line: 155 ]]
        return v60.shouldShareToAccountProvider();
    end);
    return v1.useCallback(function() --[[ Line: 159 ]]
        -- upvalues: v57 (copy), v61 (copy), v55 (ref), v56 (copy), v58 (copy), v59 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v39 (ref), v45 (ref), l_Players_0 (ref), l_gameShareExperienceLink_0 (ref), l_default_0 (ref), l_UrlBuilder_0 (ref)
        if not v57 then
            return;
        elseif not v61 then
            v55(v56, v57, v58, v59);
            return;
        elseif v61 then
            v59(l_NavigateDown_0({
                name = l_AppPage_0.SdkShare, 
                extraProps = {
                    universeId = v56, 
                    context = "GameDetailsMoreWebURL"
                }
            }));
            return;
        else
            v39(v56):andThen(function(v62) --[[ Line: 182 ]]
                -- upvalues: v45 (ref), v56 (ref), v57 (ref), l_Players_0 (ref), l_gameShareExperienceLink_0 (ref), v58 (ref), l_default_0 (ref)
                local v63, v64 = v45(v62, v56, v57);
                local v65 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
                l_gameShareExperienceLink_0({
                    ctx = v58, 
                    uid = tostring(v65), 
                    placeId = v57, 
                    shortShareLinkFailed = not v62, 
                    shareToAppsflyer = true, 
                    stamp = v64, 
                    linkId = v62
                }, v58);
                l_default_0:shareUrl({
                    url = v63, 
                    context = "GameDetailsMoreWebURL"
                });
            end):catch(function(_) --[[ Line: 204 ]]
                -- upvalues: v56 (ref), v57 (ref), l_UrlBuilder_0 (ref), l_Players_0 (ref), l_gameShareExperienceLink_0 (ref), v58 (ref), l_default_0 (ref)
                local l_v56_0 = v56;
                local l_v57_0 = v57;
                local _ = nil;
                local v70 = nil;
                local v71 = l_UrlBuilder_0.game.info.appsflyer({
                    universeId = l_v56_0, 
                    placeId = l_v57_0
                });
                local l_v70_0 = v70;
                l_v56_0 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
                l_gameShareExperienceLink_0({
                    ctx = v58, 
                    uid = tostring(l_v56_0), 
                    placeId = v57, 
                    shortShareLinkFailed = true, 
                    shareToAppsflyer = true, 
                    stamp = l_v70_0, 
                    linkId = nil
                }, v58);
                l_default_0:shareUrl({
                    url = v71, 
                    context = "GameDetailsMoreWebURL"
                });
            end);
            return;
        end;
    end, {
        v56, 
        v57, 
        v61, 
        v59, 
        v58
    });
end;