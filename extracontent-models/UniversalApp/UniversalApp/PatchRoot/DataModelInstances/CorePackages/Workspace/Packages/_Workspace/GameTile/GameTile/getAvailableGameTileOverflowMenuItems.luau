local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.GameTileConstants);
local v3 = require(l_Parent_0.SharedFlags);
local l_TileOverflowMenuItems_0 = v2.TileOverflowMenuItems;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = v3.FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v3.FFlagLuaAppSupportSponsoredExplicitFeedback;
local v7 = game:DefineFastFlag("LuaAppEnableSponsoredExplicitFeedback", false) and l_FFlagLuaAppSupportSponsoredExplicitFeedback_0;
local v8 = game:DefineFastFlag("LuaAppForceSponsoredExplicitFeedback", false) and l_FFlagLuaAppSupportSponsoredExplicitFeedback_0;
return function(v9) --[[ Line: 15 ]] --[[ Name: getAvailableGameTileOverflowMenuItems ]]
    -- upvalues: l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_TileOverflowMenuItems_0 (copy), v8 (copy), v7 (copy)
    local v10 = {};
    if l_FFlagLuaAppEnableSponsoredReportAd_0 then
        if v9.isSponsored then
            if v9.enableSponsoredFeedback then
                v10[l_TileOverflowMenuItems_0.WhyThisAd] = true;
            end;
            if v9.enableReportAd then
                v10[l_TileOverflowMenuItems_0.ReportAd] = true;
            end;
        end;
    elseif v9.enableSponsoredFeedback and v9.isSponsored then
        v10[l_TileOverflowMenuItems_0.WhyThisAd] = true;
    end;
    if v9.enableExplicitFeedback and (v8 or not v9.isSponsored or v7 and v9.enableSponsoredFeedback and v9.isSponsored) then
        v10[l_TileOverflowMenuItems_0.NotInterested] = true;
    end;
    return v10;
end;