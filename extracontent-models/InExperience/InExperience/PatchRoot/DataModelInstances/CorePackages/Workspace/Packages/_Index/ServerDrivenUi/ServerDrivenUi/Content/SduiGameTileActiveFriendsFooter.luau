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
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local function _(v14, v15) --[[ Line: 60 ]] --[[ Name: getUserIdsForFacePile ]]
    local v16 = {};
    for v17 = 1, v15 do
        v16[v17] = v14[v17].userId;
    end;
    return v16;
end;
local function v24(v19, v20, v21) --[[ Line: 69 ]] --[[ Name: getDisplayText ]]
    local v22 = {};
    for v23 = 1, v21 do
        v22[v23] = v19[v23].displayName;
    end;
    return table.concat(v22, v20);
end;
local function v27(v25, v26) --[[ Line: 78 ]] --[[ Name: alphabeticalSort ]]
    if not v25.displayName then
        return false;
    elseif not v26.displayName then
        return true;
    else
        return v25.displayName:lower() < v26.displayName:lower();
    end;
end;
local function v33(v28, v29) --[[ Line: 88 ]] --[[ Name: getSortedFriendDisplayNames ]]
    -- upvalues: v10 (copy), v27 (copy)
    if not v28 or not v29 or not v29.data then
        return {};
    else
        local v30 = {};
        for _, v32 in v28 do
            table.insert(v30, {
                userId = v32, 
                displayName = v10.Selectors.getCombinedNameFromId(v29.data, v32)
            });
        end;
        table.sort(v30, v27);
        return v30;
    end;
end;
return v2.memo(function(v34) --[[ Line: 107 ]] --[[ Name: SduiGameTileActiveFriendsFooter ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useTokens_0 (copy), v2 (copy), l_SduiParsers_0 (copy), l_SduiActionType_0 (copy), l_useLocalization_0 (copy), v12 (copy), v3 (copy), l_useUserProfilesFetch_0 (copy), v10 (copy), v33 (copy), v24 (copy), v6 (copy)
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    if l_FFlagSduiServerCompat_0 then
        v35 = v34.layoutOrder;
        v36 = v34.anchorPoint;
        v37 = v34.automaticSize;
        v38 = v34.size;
        v39 = v34.zIndex;
        v40 = v34.position;
    else
        v35 = v34.LayoutOrder;
        v36 = v34.AnchorPoint;
        v37 = v34.AutomaticSize;
        v38 = v34.Size;
        v39 = v34.ZIndex;
        v40 = v34.Position;
    end;
    local v41 = l_useTokens_0();
    local v42 = v34.iconWidth or v41.Size.Size_500;
    local v45 = v2.useCallback(function(v43) --[[ Line: 134 ]]
        -- upvalues: v34 (copy), l_SduiParsers_0 (ref), l_SduiActionType_0 (ref)
        if v34.onActivated then
            v34.onActivated(v43);
            return;
        else
            local v44 = l_SduiParsers_0.safeParseCallback({
                actionType = l_SduiActionType_0.OpenJoinFriends, 
                actionParams = {
                    placeId = v34.placeId, 
                    universeId = v34.universeId
                }
            }, v34.sduiContext, v34.analyticsContext);
            if v44 then
                v44(v43);
            end;
            return;
        end;
    end, {
        v34.placeId, 
        v34.universeId, 
        v34.analyticsContext, 
        v34.onActivated, 
        v34.sduiContext
    });
    local v46 = l_useLocalization_0({
        separator = "Feature.GameDetails.Label.FriendsSeparator"
    });
    local l_getInGameFriendsByGame_0 = v12.getInGameFriendsByGame;
    local v48 = v3.useSignalState(l_getInGameFriendsByGame_0);
    local v53 = v2.useMemo(function() --[[ Line: 158 ]]
        -- upvalues: v48 (copy), v34 (copy)
        local v49 = {};
        local v50 = v48[v34.universeId] or {};
        for v51, _ in v50 do
            table.insert(v49, v51);
        end;
        return v49;
    end, {
        v48, 
        v34.universeId
    });
    local v54 = l_useUserProfilesFetch_0({
        userIds = v53, 
        query = v10.Queries.userProfilesCombinedNameByUserIds, 
        skip = #v53 == 0
    });
    local v55 = v2.useMemo(function() --[[ Line: 172 ]]
        -- upvalues: v33 (ref), v53 (copy), v54 (copy)
        return (v33(v53, v54));
    end, {
        v53, 
        v54
    });
    local v56 = math.min(v34.maxAvatars or 3, #v55);
    local v57 = v24(v55, v46.separator, v56);
    local v58 = {};
    for v59 = 1, v56 do
        v58[v59] = v55[v59].userId;
    end;
    local l_v58_0 = v58;
    v58 = {};
    for v61 = 1, v56 do
        local v62 = l_v58_0[v61];
        v58[("userId_%*"):format(v61)] = v2.createElement("ImageLabel", {
            LayoutOrder = v61, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v41.Color.Content.Muted.Color3, 
            Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=100&h=100"):format(v62), 
            Size = UDim2.fromOffset(v42, v42), 
            Position = UDim2.fromOffset((v61 - 1) * v42 / 2, 0)
        }, {
            BorderRadius = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), 
            Border = if v34.hideBorder then nil else v2.createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = v41.Color.System.Emphasis.Color3, 
                Transparency = 0, 
                Thickness = 1
            })
        });
    end;
    return v2.createElement(v6, {
        Position = if not l_FFlagSduiServerCompat_0 then v40 else nil, 
        AnchorPoint = if not l_FFlagSduiServerCompat_0 then v36 else nil, 
        AutomaticSize = if not l_FFlagSduiServerCompat_0 then v37 else nil, 
        Size = if not l_FFlagSduiServerCompat_0 then v38 else nil, 
        LayoutOrder = if not l_FFlagSduiServerCompat_0 then v35 else nil, 
        ZIndex = if not l_FFlagSduiServerCompat_0 then v39 else nil, 
        position = if l_FFlagSduiServerCompat_0 then v40 else nil, 
        anchorPoint = if l_FFlagSduiServerCompat_0 then v36 else nil, 
        automaticSize = if l_FFlagSduiServerCompat_0 then v37 else nil, 
        size = if l_FFlagSduiServerCompat_0 then v38 else nil, 
        layoutOrder = if l_FFlagSduiServerCompat_0 then v35 else nil, 
        zIndex = if l_FFlagSduiServerCompat_0 then v39 else nil, 
        sduiContext = v34.sduiContext, 
        textIconGap = v41.Gap.Small, 
        leftText = v57, 
        leftTextFlexMode = Enum.UIFlexMode.Shrink, 
        leftIconComponent = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v58), 
        onActivated = v45, 
        testId = v34.testId
    });
end);