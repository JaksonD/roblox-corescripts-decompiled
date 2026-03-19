local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_EnumIgrsRating_0 = require(l_Parent_0.DiscoveryTypes).EnumIgrsRating;
local v3 = require(l_Parent_0.SharedFlags);
local v4 = game:DefineFastFlag("LuaAppCompressIgrsImages", false);
local l_FFlagLuaAppAllowNoIgrsImage_0 = v3.FFlagLuaAppAllowNoIgrsImage;
local l_FFlagLuaAppAddUnratedIgrsImage_0 = v3.FFlagLuaAppAddUnratedIgrsImage;
local v7 = {
    [l_EnumIgrsRating_0.IgrsThirteenPlus] = v4 and "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-13.png" or "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs13.png", 
    [l_EnumIgrsRating_0.IgrsFifteenPlus] = v4 and "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-15.png" or "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs15.png", 
    [l_EnumIgrsRating_0.IgrsEighteenPlus] = v4 and "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-18.png" or "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs18.png"
};
if l_FFlagLuaAppAddUnratedIgrsImage_0 and l_EnumIgrsRating_0.IgrsUnrated then
    v7[l_EnumIgrsRating_0.IgrsUnrated] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-pending.png";
end;
return {
    getIgrsImage = function(v8) --[[ Line: 32 ]] --[[ Name: getIgrsImage ]]
        -- upvalues: v7 (copy), l_FFlagLuaAppAllowNoIgrsImage_0 (copy), l_FFlagLuaAppAddUnratedIgrsImage_0 (copy), l_EnumIgrsRating_0 (copy), l_DiscoveryEventErrorLogger_0 (copy)
        if not v7[v8] then
            if l_FFlagLuaAppAllowNoIgrsImage_0 then
                if l_FFlagLuaAppAddUnratedIgrsImage_0 or v8 ~= l_EnumIgrsRating_0.IgrsUnrated then
                    l_DiscoveryEventErrorLogger_0.reportError("getIgrsImage", (("Invalid IGRS rating: %*"):format(v8)));
                end;
                return nil;
            else
                l_DiscoveryEventErrorLogger_0.reportError("getIgrsImage", (("Invalid IGRS rating: %*"):format(v8)));
                return v7[l_EnumIgrsRating_0.IgrsThirteenPlus];
            end;
        else
            return v7[v8];
        end;
    end
};