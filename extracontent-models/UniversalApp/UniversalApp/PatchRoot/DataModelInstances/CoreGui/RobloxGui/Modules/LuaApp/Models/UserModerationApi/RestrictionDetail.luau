local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Result);
local v4 = {
    new = function() --[[ Line: 21 ]] --[[ Name: new ]]
        return {};
    end, 
    validateJson = v1.interface({
        restriction = v1.optional(v1.table)
    }), 
    validateModel = v1.interface({
        restriction = v1.table
    })
};
v4.fromJsonData = function(v5) --[[ Line: 43 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v4 (copy), v3 (copy)
    if not v4.validateJson(v5) then
        return v3.error("ModerationDetail.fromJsonData expects a valid moderation JSON response");
    else
        local v6 = v4.new();
        if v5.restriction then
            v6.restriction = {
                source = v5.restriction.source, 
                moderationStatus = v5.restriction.moderationStatus, 
                startTime = v5.restriction.startTime, 
                endTime = v5.restriction.endTime, 
                durationSeconds = v5.restriction.durationSeconds
            };
        end;
        return v3.success(v6);
    end;
end;
return v4;