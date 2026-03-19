local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SignalsReact);
local v3 = require(l_script_FirstAncestor_0.Stores.getAvatarSwitcherStore);
local _ = require(l_script_FirstAncestor_0.types);
local v5 = require(l_script_FirstAncestor_0.Enums.ExperienceAvatarSupportType);
local v6 = game:DefineFastInt("AvatarSwitcherShimmerTiles", 12);
return function() --[[ Line: 19 ]] --[[ Name: useOutfitsGridProps ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v6 (copy)
    local v7 = v2.useSignalState(v3);
    local v8 = v2.useSignalState(v7.getOutfits);
    local v9 = v2.useSignalState(v7.getLastPageReached);
    local v10 = v2.useSignalState(v7.getExperienceAvatarSupportType) == v5.NoSupport;
    if #v8 == 0 and not v9 then
        v8 = {};
        for _ = 1, v6 do
            table.insert(v8, {});
        end;
    end;
    return {
        outfits = v8, 
        lastPageReached = v9, 
        fetchNextOutfitsPage = v7.fetchNextOutfitsPage, 
        disabled = v10
    };
end;