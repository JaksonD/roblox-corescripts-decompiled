local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Toast_0 = v3.App.Dialog.Toast;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Colors_0 = v3.App.Style.Colors;
local v7 = require(l_Parent_0.Cryo);
local l_CoPlayFooter_0 = v3.App.Tile.ExperienceTileMetadata.CoPlayFooter;
local l_getLocalizedStrings_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper.getLocalizedStrings;
local v10 = require(l_script_FirstAncestor_0.Enums.SocialContextToastAnalyticsActionTypes);
local v11 = require(l_script_FirstAncestor_0.SocialContextToastEvents);
local l_GetFFlagSocialContextToastEventStream_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialContextToastEventStream;
local v13 = Vector2.new(48, 48);
local v14 = Vector2.new(36, 36);
local function _(v15, v16, v17) --[[ Line: 34 ]] --[[ Name: makeCoPlayFooter ]]
    -- upvalues: v2 (copy), l_CoPlayFooter_0 (copy), l_Colors_0 (copy)
    return function(v18) --[[ Line: 35 ]]
        -- upvalues: v15 (copy), v2 (ref), l_CoPlayFooter_0 (ref), v17 (copy), v16 (copy), l_Colors_0 (ref)
        local l_Offset_0 = v18.Size.X.Offset;
        local v20 = if #v15 == 1 then l_Offset_0 else (l_Offset_0 - -9) / 2;
        return v2.createElement(l_CoPlayFooter_0, {
            users = v15, 
            size = v18.Size, 
            faceGroupCount = 1, 
            showEmphasisBorder = v17, 
            styleProps = {
                faceWidth = v20, 
                faceHeight = v20, 
                faceGroupGap = -9, 
                badgeHeight = v20, 
                badgeBorderColor = v16.Theme.SystemPrimaryContent, 
                faceBorderColor = v16.Theme.SystemPrimaryContent, 
                faceBackgroundColor = {
                    l_Colors_0.Smoke; 
                    Transparency = 0
                }, 
                showEmphasisBorder = v17
            }
        });
    end;
end;
local v22 = {
    areUsersActive = true
};
return function(v23) --[[ Line: 62 ]] --[[ Name: ToastWrapper ]]
    -- upvalues: v7 (copy), v22 (copy), l_GetFFlagSocialContextToastEventStream_0 (copy), v2 (copy), v11 (copy), v10 (copy), l_useStyle_0 (copy), l_getLocalizedStrings_0 (copy), l_Toast_0 (copy), l_CoPlayFooter_0 (copy), l_Colors_0 (copy), v13 (copy), v14 (copy)
    local v24 = false;
    local v25 = v7.Dictionary.join(v22, v23);
    local v26 = nil;
    if l_GetFFlagSocialContextToastEventStream_0() then
        local l_analyticsProps_0 = v25.analyticsProps;
        local l_l_analyticsProps_0_0 = l_analyticsProps_0 --[[ copy: 3 -> 12 ]];
        v26 = v2.useCallback(function() --[[ Line: 68 ]]
            -- upvalues: v25 (copy), v11 (ref), l_l_analyticsProps_0_0 (copy), v10 (ref)
            local v29 = nil;
            if v25.userIdList then
                v29 = table.concat(v25.userIdList);
            end;
            v11(l_l_analyticsProps_0_0.eventIngest, {
                toastType = l_l_analyticsProps_0_0.toastType, 
                friendId = v29, 
                universeId = l_l_analyticsProps_0_0.gameId, 
                placeId = l_l_analyticsProps_0_0.placeId, 
                actionType = v10.ForceDismissed
            });
        end);
    end;
    if v25.onActivated == nil then
        if l_GetFFlagSocialContextToastEventStream_0() then
            v25.onActivated = v26;
        else
            v25.onActivated = function() --[[ Line: 89 ]]

            end;
        end;
    end;
    local v30 = l_useStyle_0();
    local v31 = l_getLocalizedStrings_0(v25.toastStrings);
    local l_userIdList_0 = v25.userIdList;
    local l_createElement_0 = v2.createElement;
    local l_l_Toast_0_0 = l_Toast_0;
    local v35 = {
        duration = 6
    };
    local v36 = {};
    local v37;
    if l_userIdList_0 then
        local l_areUsersActive_0 = v25.areUsersActive;
        v37 = function(v39) --[[ Line: 35 ]]
            -- upvalues: l_userIdList_0 (copy), v2 (ref), l_CoPlayFooter_0 (ref), l_areUsersActive_0 (copy), v30 (copy), l_Colors_0 (ref)
            local l_Offset_1 = v39.Size.X.Offset;
            local v41 = if #l_userIdList_0 == 1 then l_Offset_1 else (l_Offset_1 - -9) / 2;
            return v2.createElement(l_CoPlayFooter_0, {
                users = l_userIdList_0, 
                size = v39.Size, 
                faceGroupCount = 1, 
                showEmphasisBorder = l_areUsersActive_0, 
                styleProps = {
                    faceWidth = v41, 
                    faceHeight = v41, 
                    faceGroupGap = -9, 
                    badgeHeight = v41, 
                    badgeBorderColor = v30.Theme.SystemPrimaryContent, 
                    faceBorderColor = v30.Theme.SystemPrimaryContent, 
                    faceBackgroundColor = {
                        l_Colors_0.Smoke; 
                        Transparency = 0
                    }, 
                    showEmphasisBorder = l_areUsersActive_0
                }
            });
        end;
        v24 = v37;
    end;
    if not v24 then
        v37 = nil;
    end;
    v24 = false;
    v36.iconImage = v37;
    v36.toastTitle = v31.label;
    v36.iconSize = if l_userIdList_0 and #l_userIdList_0 > 1 then v13 else v14;
    v36.onActivated = v25.onActivated;
    v36.buttonText = v31.button;
    v36.buttonType = v25.buttonType;
    v36.onTouchSwipeUp = if l_GetFFlagSocialContextToastEventStream_0() then v26 else nil;
    v35.toastContent = v36;
    return l_createElement_0(l_l_Toast_0_0, v35);
end;