local l_Parent_0 = script.Parent.Parent;
local l_Features_0 = l_Parent_0.Features;
local v2 = require(l_Parent_0.Enums.PlatformEnum);
local v3 = require(l_Features_0.EnableSafetyBubbleDummy);
GetFeatures = function(v4) --[[ Line: 8 ]] --[[ Name: GetFeatures ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v4 == v2.QuestVR then
        v3();
    end;
end;
return GetFeatures;