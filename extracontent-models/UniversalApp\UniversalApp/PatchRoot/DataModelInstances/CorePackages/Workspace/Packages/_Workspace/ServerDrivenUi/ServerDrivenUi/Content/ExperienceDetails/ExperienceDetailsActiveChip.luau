local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_Parent_0.DataHydration);
local v7 = require(l_Parent_0.SduiSharedContent);
local v8 = require(l_Parent_0.GameTile);
local v9 = require(l_Parent_0.Localization);
local v10 = require(l_Parent_0.DiscoveryAnalytics);
local l_SduiChip_0 = v7.SduiChip;
local l_usePlayerCountText_0 = v8.usePlayerCountText;
local l_useLocalization_0 = v9.Hooks.useLocalization;
local l_gameDetailsSubpage_0 = v10.Events.gameDetailsSubpage;
local v15 = require(l_script_FirstAncestor_0.Content.ExperienceDetails.Hooks.useNavigateToServers);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v3.memo(function(v17) --[[ Line: 30 ]] --[[ Name: ExperienceDetailsActiveCountChip ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v5 (copy), v6 (copy), l_usePlayerCountText_0 (copy), l_useLocalization_0 (copy), v15 (copy), v3 (copy), l_Players_0 (copy), l_gameDetailsSubpage_0 (copy), l_SduiChip_0 (copy), v4 (copy)
    local v18 = nil;
    v18 = if l_FFlagSduiServerCompat_0 then v17.layoutOrder else v17.LayoutOrder;
    local l_universeId_0 = v17.universeId;
    local v20 = v5.useSignalState(v6.Game.getGameInfoStore(false).getAndFetchGameInfo(l_universeId_0).data);
    local v21 = l_usePlayerCountText_0(v20 and v20.playerCount or 0);
    local v22 = l_useLocalization_0({
        numActivePlayers = {
            "Feature.GameDetails.Label.LowercaseNumberPlaying"; 
            numActivePlayers = v21
        }
    });
    local v23 = v15(l_universeId_0);
    local v26 = v3.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v20 (copy), l_Players_0 (ref), l_gameDetailsSubpage_0 (ref), l_universeId_0 (copy), v23 (copy)
        local v24 = v20 and v20.rootPlaceId;
        if v24 then
            local v25 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
            l_gameDetailsSubpage_0({
                uid = tostring(v25), 
                universeId = l_universeId_0, 
                placeId = tostring(v24), 
                subpage = "Servers", 
                action = "open", 
                ctx = "ExperienceDetailsActiveCountChip"
            }, "ExperienceDetailsActiveCountChip");
        end;
        v23();
    end, {
        l_universeId_0, 
        v20, 
        v23
    });
    return v3.createElement(l_SduiChip_0, {
        text = v22.numActivePlayers, 
        LayoutOrder = if not l_FFlagSduiServerCompat_0 then v18 else nil, 
        layoutOrder = if l_FFlagSduiServerCompat_0 then v18 else nil, 
        leadingIconName = v4.Enums.IconName.TwoPeople, 
        onActivated = v26
    });
end);