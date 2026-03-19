local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactRoblox);
local v5 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v6 = require(l_script_FirstAncestor_0.Parent.Localization);
local v7 = require(l_script_FirstAncestor_0.Components.CustomFoundationChip);
local v8 = require(l_script_FirstAncestor_0.Analytics.AnalyticActions);
local v9 = require(l_script_FirstAncestor_0.Analytics.sendAudioPlayerAnalytics);
local _ = require(l_script_FirstAncestor_0.types);
local v11 = require(l_script_FirstAncestor_0.Components.ReportSongDialog);
local l_GetFFlagSongDetailsInAppReportingFlow_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagSongDetailsInAppReportingFlow;
local l_GetFFlagSongDetailsPageDesignPass_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagSongDetailsPageDesignPass;
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_useCallback_0 = v2.useCallback;
local l_useState_0 = v2.useState;
local l_createNextOrder_0 = v3.createNextOrder;
return function(v18) --[[ Line: 43 ]] --[[ Name: AudioPlayerActions ]]
    -- upvalues: l_useLocalization_0 (copy), l_GetFFlagSongDetailsInAppReportingFlow_0 (copy), l_useState_0 (copy), l_GetFFlagSongDetailsPageDesignPass_0 (copy), l_createNextOrder_0 (copy), l_useCallback_0 (copy), v9 (copy), v8 (copy), v2 (copy), v5 (copy), v7 (copy), v4 (copy), v11 (copy), l_CoreGui_0 (copy)
    local v19 = l_useLocalization_0({
        favorite = "Feature.SongDetails.Action.Favorite", 
        report = "Feature.SongDetails.Action.Report"
    });
    local v20 = nil;
    local v21 = nil;
    if l_GetFFlagSongDetailsInAppReportingFlow_0() then
        local v22, v23 = l_useState_0(false);
        v20 = v22;
        v21 = v23;
    end;
    local v24 = if not not l_GetFFlagSongDetailsInAppReportingFlow_0() or l_GetFFlagSongDetailsPageDesignPass_0() then l_createNextOrder_0() else nil;
    local v28 = l_useCallback_0(function(v25) --[[ Line: 58 ]]
        -- upvalues: v18 (copy), v9 (ref)
        local v26 = v18.audio.assetId:gsub("rbxassetid://", "");
        local v27 = if v18.audio.thumbnailAssetId then v18.audio.thumbnailAssetId:gsub("rbxassetid://", "") else nil;
        v9({
            action = v25, 
            songId = v26, 
            thumbnailId = v27 or "-1", 
            source = v18.analyticsSource
        });
    end, {
        v18.audio.assetId, 
        v18.audio.thumbnail, 
        v18.audio.thumbnailAssetId, 
        v18.analyticsSource
    });
    local v29 = l_useCallback_0(function() --[[ Line: 83 ]]
        -- upvalues: v18 (copy), v28 (copy), v8 (ref)
        if v18.audio.isLiked then
            if v18.onUnlike then
                v28(v8.Unlike);
                v18.onUnlike();
                return;
            end;
        elseif v18.onLike then
            v28(v8.Like);
            v18.onLike();
        end;
    end, {
        v18.audio.isLiked, 
        v18.onLike, 
        v18.onUnlike, 
        v28
    });
    local v30 = if l_GetFFlagSongDetailsInAppReportingFlow_0() then nil else l_useCallback_0(function() --[[ Line: 106 ]]
        -- upvalues: v18 (copy), v28 (copy), v8 (ref)
        if v18.onReport then
            v28(v8.StartAudioReport);
            v18.onReport();
        end;
    end, {
        v18.onReport
    });
    local v31 = if l_GetFFlagSongDetailsInAppReportingFlow_0() then l_useCallback_0(function() --[[ Line: 114 ]]
        -- upvalues: v28 (copy), v8 (ref), v21 (ref)
        v28(v8.StartAudioReport);
        v21(true);
    end, {}) else nil;
    local v32 = l_useCallback_0(function() --[[ Line: 120 ]]
        -- upvalues: v21 (ref)
        v21(false);
    end, {});
    if l_GetFFlagSongDetailsInAppReportingFlow_0() then
        return v2.createElement(v5.View, {
            tag = "auto-xy row gap-small", 
            LayoutOrder = v18.LayoutOrder
        }, {
            Favorite = if l_GetFFlagSongDetailsPageDesignPass_0() then v2.createElement(v5.Chip, {
                text = v19.favorite, 
                leading = {
                    iconName = v5.Enums.IconName.Star, 
                    iconVariant = if v18.audio.isLiked then v5.Enums.IconVariant.Filled else nil
                }, 
                onActivated = v29, 
                LayoutOrder = v24()
            }) else v2.createElement(v7, {
                LayoutOrder = v24(), 
                text = v19.favorite, 
                icon = v18.audio.isLiked and "icons/actions/favoriteOn" or "icons/actions/favoriteOff", 
                onActivated = v29
            }), 
            Report = if l_GetFFlagSongDetailsPageDesignPass_0() then v2.createElement(v5.Chip, {
                text = v19.report, 
                leading = {
                    iconName = v5.Enums.IconName.Flag
                }, 
                onActivated = v31, 
                LayoutOrder = v24()
            }) else v2.createElement(v7, {
                LayoutOrder = v24(), 
                text = v19.report, 
                icon = "icons/actions/feedback", 
                onActivated = v31
            }), 
            ReportDialog = v20 and v4.createPortal(v2.createElement("ScreenGui", {
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = 2
            }, {
                Background = v2.createElement(v5.View, {
                    tag = "size-full row align-y-center align-x-center bg-over-media-100", 
                    stateLayer = {
                        affordance = v5.Enums.StateLayerAffordance.None
                    }, 
                    onActivated = v32
                }, {
                    Dialog = v2.createElement(v11, {
                        audio = v18.audio, 
                        analyticsSource = v18.analyticsSource or "unknown", 
                        onClose = v32
                    })
                })
            }), l_CoreGui_0)
        });
    else
        return v2.createElement(v5.View, {
            tag = "auto-xy row gap-small", 
            LayoutOrder = v18.LayoutOrder
        }, if l_GetFFlagSongDetailsPageDesignPass_0() then {
            Favorite = v2.createElement(v5.Chip, {
                text = v19.favorite, 
                leading = {
                    iconName = v5.Enums.IconName.Star, 
                    iconVariant = if v18.audio.isLiked then v5.Enums.IconVariant.Filled else nil
                }, 
                onActivated = v29, 
                LayoutOrder = v24()
            }), 
            Report = v2.createElement(v5.Chip, {
                text = v19.report, 
                leading = {
                    iconName = v5.Enums.IconName.Flag
                }, 
                onActivated = v30, 
                LayoutOrder = v24()
            })
        } else {
            Favorite = v2.createElement(v7, {
                text = v19.favorite, 
                icon = v18.audio.isLiked and "icons/actions/favoriteOn" or "icons/actions/favoriteOff", 
                onActivated = v29
            }), 
            Report = v2.createElement(v7, {
                text = v19.report, 
                icon = "icons/actions/feedback", 
                onActivated = v30
            })
        });
    end;
end;