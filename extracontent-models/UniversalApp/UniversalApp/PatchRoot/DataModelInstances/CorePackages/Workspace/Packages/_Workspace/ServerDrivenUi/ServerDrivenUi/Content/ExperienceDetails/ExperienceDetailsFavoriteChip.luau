local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.SignalsReact);
local l_Game_0 = require(l_Parent_0.DataHydration).Game;
local v7 = require(l_Parent_0.RoactUtils);
local v8 = require(l_Parent_0.Localization);
local l_SduiChip_0 = require(l_Parent_0.SduiSharedContent).SduiChip;
local v10 = require(l_Parent_0.ToastRodux);
local l_ToastType_0 = v10.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v10.Actions.SetCurrentToastMessage;
local l_gameFavorite_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gameFavorite;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v8.Hooks.useLocalization;
local v16 = require(l_script_FirstAncestor_0.Content.ExperienceDetails.Hooks.useOptimisticUpdateStatus);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v3.memo(function(v18) --[[ Line: 39 ]] --[[ Name: ExperienceDetailsFavoriteChip ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useDispatch_0 (copy), v5 (copy), l_Game_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_Players_0 (copy), l_gameFavorite_0 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), v16 (copy), l_SduiChip_0 (copy), v4 (copy)
    local v19 = nil;
    v19 = if l_FFlagSduiServerCompat_0 then v18.layoutOrder else v18.LayoutOrder;
    local l_universeId_0 = v18.universeId;
    local v21 = l_useDispatch_0();
    local v22 = v5.useSignalState(l_Game_0.getFavoritesStore(false).getAndFetchFavorite(l_universeId_0).data);
    local v23 = v5.useSignalState(l_Game_0.getGameInfoStore(false).getAndFetchGameInfo(l_universeId_0).data);
    local v24 = v23 and v23.rootPlaceId or nil;
    local v25 = l_useLocalization_0({
        favorite = "Feature.Favorites.Label.Favorite"
    });
    local v28 = v3.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v22 (copy), v24 (copy), l_Players_0 (ref), l_gameFavorite_0 (ref), l_Game_0 (ref), l_universeId_0 (copy)
        local v26 = not v22;
        if v24 then
            local v27 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
            l_gameFavorite_0({
                uid = tostring(v27), 
                ctx = "ExperienceDetailsFavoriteChip", 
                placeId = v24, 
                state = v26 and "on" or "off"
            }, "ExperienceDetailsFavoriteChip");
        end;
        return l_Game_0.getFavoritesStore(false).updateFavorite(l_universeId_0, v26);
    end, {
        l_universeId_0, 
        v24, 
        v22
    });
    local v30 = v3.useCallback(function(v29) --[[ Line: 75 ]]
        -- upvalues: v21 (copy), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref)
        if v29 and v29.type == "error" then
            v21(l_SetCurrentToastMessage_0({
                toastType = l_ToastType_0.NetworkingError, 
                toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
            }));
        end;
    end, {
        v21
    });
    local v31 = v16(v28, v30);
    return v3.createElement(l_SduiChip_0, {
        text = v25.favorite, 
        leadingIconName = v4.Enums.IconName.Star, 
        leadingIconVariant = if v22 then v4.Enums.IconVariant.Filled else nil, 
        onActivated = v31, 
        LayoutOrder = if not l_FFlagSduiServerCompat_0 then v19 else nil, 
        layoutOrder = if l_FFlagSduiServerCompat_0 then v19 else nil
    });
end);