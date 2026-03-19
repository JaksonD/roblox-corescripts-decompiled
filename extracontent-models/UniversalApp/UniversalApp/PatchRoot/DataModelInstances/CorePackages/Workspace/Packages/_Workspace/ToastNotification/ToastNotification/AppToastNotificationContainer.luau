local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.ExperienceService);
local v4 = require(l_Parent_0.ToastNotificationWrapper);
local l_ExperienceService_0 = v3.ExperienceService;
return function(v6) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), l_ExperienceService_0 (copy), v4 (copy)
    local v7, v8 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: l_ExperienceService_0 (ref), v8 (copy)
        l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 17 ]]
            -- upvalues: v8 (ref)
            v8(true);
        end);
        l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 20 ]]
            -- upvalues: v8 (ref)
            v8(false);
        end);
    end, {});
    return not v7 and v2.createElement(v4, {
        displayOrder = v6.displayOrder, 
        renderLocation = "universalApp"
    });
end;