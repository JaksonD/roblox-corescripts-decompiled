local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Content.SduiTileFooter);
local v7 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v7.SduiActionType;
local l_SduiParsers_0 = v7.SduiParsers;
local v10 = require(l_Parent_0.UserProfiles);
local l_useUserProfilesFetch_0 = v10.Hooks.useUserProfilesFetch;
local v12 = require(l_script_FirstAncestor_0.DataStore.SduiInGameFriendsData);
local l_FFlagSduiClientBinding_0 = require(l_Parent_0.SharedFlags).FFlagSduiClientBinding;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local function _(v15, v16) --[[ Line: 61 ]] --[[ Name: getUserIdsForFacePile ]]
    local v17 = {};
    for v18 = 1, v16 do
        v17[v18] = v15[v18].userId;
    end;
    return v17;
end;
local function v25(v20, v21, v22) --[[ Line: 70 ]] --[[ Name: getDisplayText ]]
    local v23 = {};
    for v24 = 1, v22 do
        v23[v24] = v20[v24].displayName;
    end;
    return table.concat(v23, v21);
end;
local function v28(v26, v27) --[[ Line: 79 ]] --[[ Name: alphabeticalSort ]]
    if not v26.displayName then
        return false;
    elseif not v27.displayName then
        return true;
    else
        return v26.displayName:lower() < v27.displayName:lower();
    end;
end;
local function v34(v29, v30) --[[ Line: 89 ]] --[[ Name: getSortedFriendDisplayNames ]]
    -- upvalues: v10 (copy), v28 (copy)
    if not v29 or not v30 or not v30.data then
        return {};
    else
        local v31 = {};
        for _, v33 in v29 do
            table.insert(v31, {
                userId = v33, 
                displayName = v10.Selectors.getCombinedNameFromId(v30.data, v33)
            });
        end;
        table.sort(v31, v28);
        return v31;
    end;
end;
return v2.memo(function(v35) --[[ Line: 108 ]] --[[ Name: SduiGameTileActiveFriendsFooter ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useTokens_0 (copy), v2 (copy), l_SduiParsers_0 (copy), l_SduiActionType_0 (copy), l_useLocalization_0 (copy), l_FFlagSduiClientBinding_0 (copy), v12 (copy), v3 (copy), l_useUserProfilesFetch_0 (copy), v10 (copy), v34 (copy), v25 (copy), v6 (copy)
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    local v41 = nil;
    if l_FFlagSduiServerCompat_0 then
        v36 = v35.layoutOrder;
        v37 = v35.anchorPoint;
        v38 = v35.automaticSize;
        v39 = v35.size;
        v40 = v35.zIndex;
        v41 = v35.position;
    else
        v36 = v35.LayoutOrder;
        v37 = v35.AnchorPoint;
        v38 = v35.AutomaticSize;
        v39 = v35.Size;
        v40 = v35.ZIndex;
        v41 = v35.Position;
    end;
    local v42 = l_useTokens_0();
    local v43 = v35.iconWidth or v42.Size.Size_500;
    local v46 = v2.useCallback(function(v44) --[[ Line: 135 ]]
        -- upvalues: v35 (copy), l_SduiParsers_0 (ref), l_SduiActionType_0 (ref)
        if v35.onActivated then
            v35.onActivated(v44);
            return;
        else
            local v45 = l_SduiParsers_0.safeParseCallback({
                actionType = l_SduiActionType_0.OpenJoinFriends, 
                actionParams = {
                    placeId = v35.placeId, 
                    universeId = v35.universeId
                }
            }, v35.sduiContext, v35.analyticsContext);
            if v45 then
                v45(v44);
            end;
            return;
        end;
    end, {
        v35.placeId, 
        v35.universeId, 
        v35.analyticsContext, 
        v35.onActivated, 
        v35.sduiContext
    });
    local v47 = l_useLocalization_0({
        separator = "Feature.GameDetails.Label.FriendsSeparator"
    });
    local v48 = nil;
    v48 = if l_FFlagSduiClientBinding_0 then v12.getInGameFriendsByGame else v35.sduiContext.dataStore.social.getInGameFriendsByGame;
    local v49 = v3.useSignalState(v48);
    local v54 = v2.useMemo(function() --[[ Line: 165 ]]
        -- upvalues: v49 (copy), v35 (copy)
        local v50 = {};
        local v51 = v49[v35.universeId] or {};
        for v52, _ in v51 do
            table.insert(v50, v52);
        end;
        return v50;
    end, {
        v49, 
        v35.universeId
    });
    local v55 = l_useUserProfilesFetch_0({
        userIds = v54, 
        query = v10.Queries.userProfilesCombinedNameByUserIds, 
        skip = #v54 == 0
    });
    local v56 = v2.useMemo(function() --[[ Line: 179 ]]
        -- upvalues: v34 (ref), v54 (copy), v55 (copy)
        return (v34(v54, v55));
    end, {
        v54, 
        v55
    });
    local v57 = math.min(v35.maxAvatars or 3, #v56);
    local v58 = v25(v56, v47.separator, v57);
    local v59 = {};
    for v60 = 1, v57 do
        v59[v60] = v56[v60].userId;
    end;
    local l_v59_0 = v59;
    v59 = {};
    for v62 = 1, v57 do
        local v63 = l_v59_0[v62];
        v59[("userId_%*"):format(v62)] = v2.createElement("ImageLabel", {
            LayoutOrder = v62, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v42.Color.Content.Muted.Color3, 
            Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=100&h=100"):format(v63), 
            Size = UDim2.fromOffset(v43, v43), 
            Position = UDim2.fromOffset((v62 - 1) * v43 / 2, 0)
        }, {
            BorderRadius = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), 
            Border = if v35.hideBorder then nil else v2.createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = v42.Color.System.Emphasis.Color3, 
                Transparency = 0, 
                Thickness = 1
            })
        });
    end;
    return v2.createElement(v6, {
        Position = if not l_FFlagSduiServerCompat_0 then v41 else nil, 
        AnchorPoint = if not l_FFlagSduiServerCompat_0 then v37 else nil, 
        AutomaticSize = if not l_FFlagSduiServerCompat_0 then v38 else nil, 
        Size = if not l_FFlagSduiServerCompat_0 then v39 else nil, 
        LayoutOrder = if not l_FFlagSduiServerCompat_0 then v36 else nil, 
        ZIndex = if not l_FFlagSduiServerCompat_0 then v40 else nil, 
        position = if l_FFlagSduiServerCompat_0 then v41 else nil, 
        anchorPoint = if l_FFlagSduiServerCompat_0 then v37 else nil, 
        automaticSize = if l_FFlagSduiServerCompat_0 then v38 else nil, 
        size = if l_FFlagSduiServerCompat_0 then v39 else nil, 
        layoutOrder = if l_FFlagSduiServerCompat_0 then v36 else nil, 
        zIndex = if l_FFlagSduiServerCompat_0 then v40 else nil, 
        sduiContext = v35.sduiContext, 
        textIconGap = v42.Gap.Small, 
        leftText = v58, 
        leftTextFlexMode = Enum.UIFlexMode.Shrink, 
        leftIconComponent = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v59), 
        onActivated = v46, 
        testId = v35.testId
    });
end);