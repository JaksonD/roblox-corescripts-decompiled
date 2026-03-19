local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
return {
    get = function(v2) --[[ Line: 10 ]] --[[ Name: get ]]
        -- upvalues: v1 (copy)
        local v3 = v1.get(v2);
        return {
            inviteePageLoad = function(v4, v5) --[[ Line: 15 ]] --[[ Name: inviteePageLoad ]]
                -- upvalues: v3 (copy)
                v3.EventStream:setRBXEventStream("profileShareLink", "luaPageLoad", {
                    target = "mobile", 
                    referringUserId = v4, 
                    page = v5
                });
            end, 
            inviterButtonClick = function(v6) --[[ Line: 25 ]] --[[ Name: inviterButtonClick ]]
                -- upvalues: v3 (copy)
                v3.EventStream:setRBXEventStream("profileShareLink", "buttonClick", {
                    btn = "userShareProfileLink", 
                    target = "mobile", 
                    page = v6
                });
            end
        };
    end
};