local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local v3 = require(l_script_FirstAncestor_0.Utils.isMakeupAssetType);
local v4 = require(script.Parent.selectTryOnItems);
local v5 = require(script.Parent.selectEquippedLayeredMakeupAssets);
local l_FFlagAXMakeupEquipping_0 = v2.FFlagAXMakeupEquipping;
return function(v7) --[[ Line: 15 ]] --[[ Name: selectTotalLayeredMakeupAssets ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), v5 (copy), v4 (copy), v3 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return 0;
    else
        local v8 = #v5(v7);
        local v9 = 0;
        for _, v11 in v4(v7) do
            if v11.selectedInTryOnManager and v11.itemType and v3(v11.itemSubType) then
                v9 = v9 + 1;
            end;
        end;
        return v8 + v9;
    end;
end;