local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceCommon);
local v3 = require(script.Parent.getSubstateToTrackForChanges);
local v4 = require(script.Parent.assetOrderRelativelyEqual);
local v5 = require(l_Parent_0.tutils);
local _ = require(l_script_FirstAncestor_0.Context.AvatarSaveContext);
local l_Constants_0 = v2.Constants;
return function(v8, v9) --[[ Line: 15 ]] --[[ Name: shouldReplaceLastHistoryEntry ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy), l_Constants_0 (copy)
    return not v5.deepEqual(v3(v8, false), v3(v9, false)) and v5.deepEqual(v3(v8, true), v3(v9, true)) and v4(v8, v9, l_Constants_0.LAYERED_ASSET_TYPES) and v4(v8, v9, l_Constants_0.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE);
end;