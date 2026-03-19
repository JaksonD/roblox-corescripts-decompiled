local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_LaunchGame_0 = require(l_CorePackages_0.Workspace.Packages.GameLaunch).LaunchGame;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics);
local v7 = require(l_CorePackages_0.Workspace.Packages.Localization);
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local v9 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local v11 = require(l_CorePackages_0.Packages.Foundation);
local _ = require(script.Parent.useNextUpSort);
local v13 = require(script.Parent.Parent.Parent.leaveGame);
local v14 = require(script.Parent.ImageOrSkeleton);
local v15 = require(script.Parent.Telemetry);
local v16 = game:DefineFastFlag("AddSponsoredFooterOnNextUp", false);
local v17 = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry);
local v18 = game:DefineFastFlag("EnableNextUpTileLeaveGameOnTileJoin", false);
local v19 = if v16 then require(script.Parent.SponsoredFooter) else nil;
local l_AppEventIngestService_0 = v9.AppEventIngestService;
local l_useLocalization_0 = v7.Hooks.useLocalization;
local l_gamePlayIntent_0 = v6.Events.gamePlayIntent;
local l_useRoactService_0 = v8.useRoactService;
local l_LoadableImage_0 = v10.App.Loading.LoadableImage;
local l_View_0 = v11.View;
local l_Text_0 = v11.Text;
local l_Skeleton_0 = v11.Skeleton;
local l_useTokens_0 = v11.Hooks.useTokens;
local function _(v29) --[[ Line: 39 ]] --[[ Name: getRatingText ]]
    if not v29 then
        return "--";
    else
        local v30 = v29.upVotes + v29.downVotes;
        if v30 == 0 then
            return "--";
        else
            return (tostring((math.floor(v29.upVotes / v30 * 100))));
        end;
    end;
end;
return v5.memo(function(v32) --[[ Line: 60 ]] --[[ Name: NextUpTile ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v17 (copy), v5 (copy), l_ContentProvider_0 (copy), v15 (copy), l_HttpService_0 (copy), l_gamePlayIntent_0 (copy), v18 (copy), l_RunService_0 (copy), l_LaunchGame_0 (copy), v13 (copy), l_View_0 (copy), v14 (copy), l_LoadableImage_0 (copy), l_Skeleton_0 (copy), l_Text_0 (copy), v16 (copy), v19 (copy)
    local v33 = l_useRoactService_0(l_AppEventIngestService_0);
    local v34 = l_useTokens_0();
    local l_l_useLocalization_0_0 = l_useLocalization_0;
    local v36 = {};
    local v37 = {
        "Feature.GameDetails.RatingPercentOnly"
    };
    local l_entryData_0 = v32.entryData;
    local v39;
    if not l_entryData_0 then
        v39 = "--";
    else
        local v40 = l_entryData_0.upVotes + l_entryData_0.downVotes;
        v39 = v40 == 0 and "--" or tostring((math.floor(l_entryData_0.upVotes / v40 * 100)));
    end;
    v37.percentRating = v39;
    v36.RatingText = v37;
    l_l_useLocalization_0_0 = l_l_useLocalization_0_0(v36);
    if not v17 then
        v5.useEffect(function() --[[ Line: 72 ]]
            -- upvalues: v32 (copy), l_ContentProvider_0 (ref)
            if not v32.entryData or not v32.attemptPreloadImage then
                return;
            else
                local l_image_0 = v32.entryData.image;
                if l_image_0 and l_image_0 ~= "" then
                    l_ContentProvider_0:PreloadAsync({
                        l_image_0
                    });
                end;
                return;
            end;
        end, {
            v32.entryData, 
            v32.attemptPreloadImage
        });
    end;
    v36 = function() --[[ Line: 84 ]] --[[ Name: onJoinGame ]]
        -- upvalues: v32 (copy), v17 (ref), v15 (ref), l_HttpService_0 (ref), l_gamePlayIntent_0 (ref), v33 (copy), v18 (ref), l_RunService_0 (ref), l_LaunchGame_0 (ref), v13 (ref)
        if not v32.entryData then
            return;
        else
            if v17 then
                v15.logNextUpExitModalAction(v15.NextUpSortViewActionType.JoinGame);
            end;
            local v42 = l_HttpService_0:GenerateGUID(false):lower();
            l_gamePlayIntent_0(v33, "InGameExitPage", {
                placeId = v32.entryData.placeId, 
                rootPlaceId = tonumber(v32.entryData.placeId), 
                universeId = v32.entryData.universeId, 
                sortEntryIndex = tostring(v32.positionIndex), 
                gameSetTypeId = v32.topicId, 
                joinAttemptId = v42
            });
            if v18 then
                if not l_RunService_0:IsStudio() then
                    l_LaunchGame_0(v32.entryData.placeId, nil, {
                        joinAttemptId = v42
                    }, nil);
                end;
                v13(false);
                return;
            elseif l_RunService_0:IsStudio() then
                v13(true);
                return;
            else
                l_LaunchGame_0(v32.entryData.placeId, nil, {
                    joinAttemptId = v42
                }, nil);
                return;
            end;
        end;
    end;
    v37 = if v17 then v5.useCallback(function(v43) --[[ Line: 122 ]]
        -- upvalues: v32 (copy)
        if v43 and v32.onTileImageLoaded then
            v32.onTileImageLoaded();
        end;
    end, {
        v32.onTileImageLoaded
    }) else nil;
    return v5.createElement(l_View_0, {
        tag = "size-0-0 auto-y col gap-small align-x-center", 
        LayoutOrder = v32.positionIndex
    }, {
        thumbnail = if v17 then v5.createElement(v14, {
            LayoutOrder = 1, 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            Size = UDim2.fromScale(1, 0.5625), 
            tag = "radius-medium", 
            onActivated = v36, 
            Image = if v32.entryData then v32.entryData.image else nil, 
            onImageStateChanged = v37
        }) else nil, 
        thumbnailContainer = if not v17 then v5.createElement(l_View_0, {
            LayoutOrder = 1, 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            Size = UDim2.fromScale(1, 0.5625), 
            onActivated = v36
        }, {
            image = if v32.entryData then v5.createElement(l_LoadableImage_0, {
                BackgroundTransparency = 1, 
                cornerRadius = UDim.new(0, v34.Radius.Medium), 
                Image = v32.entryData.image, 
                Size = UDim2.fromScale(1, 1), 
                useShimmerAnimationWhileLoading = true, 
                showFailedStateWhenLoadingFailed = true
            }) else v5.createElement(l_Skeleton_0, {
                tag = "size-full-full radius-medium"
            })
        }) else nil, 
        titleContainer = v5.createElement(l_View_0, {
            tag = "size-full-0 auto-y col", 
            LayoutOrder = 2
        }, {
            title = v5.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-no-wrap text-title-medium content-emphasis text-align-x-left text-truncate-end", 
                LayoutOrder = 2, 
                Text = if v32.entryData then v32.entryData.name else ""
            }), 
            rating = if not v16 then v5.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-no-wrap text-body-medium content-default text-align-x-left", 
                LayoutOrder = 3, 
                Text = if v32.entryData then l_l_useLocalization_0_0.RatingText else ""
            }) else nil, 
            footer = if v16 then if v32.entryData and v32.entryData.isSponsored then v5.createElement(v19, {
                LayoutOrder = 3
            }) else v5.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-no-wrap text-body-medium content-default text-align-x-left", 
                LayoutOrder = 3, 
                Text = if v32.entryData then l_l_useLocalization_0_0.RatingText else ""
            }) else nil
        })
    });
end);