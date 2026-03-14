local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local v3 = require(l_script_FirstAncestor_0.Utils.isMakeupAssetType);
local v4 = require(script.Parent.selectTryOnItems);
local l_FFlagAXMakeupEquipping_0 = v2.FFlagAXMakeupEquipping;
return function(v6) --[[ Line: 14 ]] --[[ Name: selectHasMakeupTryOn ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), v4 (copy), v3 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return false;
    else
        for _, v8 in v4(v6) do
            if v8.selectedInTryOnManager and v8.itemType and v3(v8.itemSubType) then
                return true;
            end;
        end;
        return false;
    end;
end;