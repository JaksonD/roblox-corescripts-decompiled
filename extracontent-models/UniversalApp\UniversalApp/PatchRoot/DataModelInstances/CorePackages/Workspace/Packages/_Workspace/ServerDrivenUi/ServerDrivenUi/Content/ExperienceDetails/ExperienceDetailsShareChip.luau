local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.SignalsReact);
local l_Game_0 = require(l_Parent_0.DataHydration).Game;
local v6 = require(l_Parent_0.SduiSharedContent);
local v7 = require(l_Parent_0.Localization);
local l_SduiChip_0 = v6.SduiChip;
local l_useLocalization_0 = v7.Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Content.ExperienceDetails.Hooks.useExperienceDetailsShare);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v2.memo(function(v12) --[[ Line: 26 ]] --[[ Name: ExperienceDetailsShareChip ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_Game_0 (copy), v10 (copy), v2 (copy), l_SduiChip_0 (copy), v3 (copy)
    local v13 = nil;
    v13 = if l_FFlagSduiServerCompat_0 then v12.layoutOrder else v12.LayoutOrder;
    local l_universeId_0 = v12.universeId;
    local v15 = l_useLocalization_0({
        share = "Feature.SocialShare.Action.Share"
    });
    local v16 = v4.useSignalState(l_Game_0.getGameInfoStore(false).getAndFetchGameInfo(l_universeId_0).data);
    local v17 = v16 and v16.rootPlaceId or nil;
    local v18 = v10(l_universeId_0, v17, "ExperienceDetailsShareChip");
    return v2.createElement(l_SduiChip_0, {
        text = v15.share, 
        leadingIconName = v3.Enums.IconName.ArrowThickToRight, 
        onActivated = v18, 
        LayoutOrder = if not l_FFlagSduiServerCompat_0 then v13 else nil, 
        layoutOrder = if l_FFlagSduiServerCompat_0 then v13 else nil
    });
end);