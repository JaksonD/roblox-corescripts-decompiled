local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_React_0 = v1.React;
local _ = require(l_Parent_1.UserList);
local l_useSelector_0 = v1.Hooks.useSelector;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_FFlagHomepagePYMKPresence_0 = require(l_Parent_1.SharedFlags).FFlagHomepagePYMKPresence;
return function(v8) --[[ Line: 18 ]] --[[ Name: useUserPresence ]]
    -- upvalues: l_FFlagHomepagePYMKPresence_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_React_0 (copy)
    if not l_FFlagHomepagePYMKPresence_0 then
        return nil;
    else
        local v10 = l_useSelector_0(function(v9) --[[ Line: 22 ]]
            -- upvalues: l_getDeepValue_0 (ref), v8 (copy)
            return l_getDeepValue_0(v9, string.format("PYMKCarousel.Presence.byUserId.%s", v8.userId)) or {};
        end);
        return (l_React_0.useMemo(function() --[[ Line: 25 ]]
            -- upvalues: v10 (copy)
            if v10 and v10.userPresenceType then
                local v11 = tostring(v10.userPresenceType);
                return (string.gsub(v11, "PresenceType%.", ""));
            else
                return "Offline";
            end;
        end, {
            v10
        }));
    end;
end;