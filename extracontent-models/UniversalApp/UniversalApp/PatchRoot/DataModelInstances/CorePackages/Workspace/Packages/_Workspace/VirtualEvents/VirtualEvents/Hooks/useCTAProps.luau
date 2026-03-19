local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
return function(v5, v6, v7, v8) --[[ Line: 33 ]] --[[ Name: useCTAProps ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy)
    local v9 = l_useLocalization_0({
        notifyMe = "Feature.VirtualEvents.NotifyMe", 
        unfollowEvent = "Feature.VirtualEvents.UnfollowEvent", 
        join = "Feature.VirtualEvents.Join", 
        goHome = "Feature.VirtualEvents.GoHome"
    });
    local v10 = v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v5 (copy), v6 (copy), v9 (copy), v8 (copy), v7 (copy)
        if v5.eventStatus ~= "cancelled" and v5.eventStatus ~= "moderated" then
            if v6 == "Upcoming" or v6 == "UpcomingImminent" then
                if v5.userRsvpStatus == "going" then
                    return {
                        text = v9.unfollowEvent, 
                        icon = nil, 
                        variant = "Standard", 
                        onActivated = v8.onRsvpChanged
                    };
                else
                    return {
                        text = v9.notifyMe, 
                        icon = nil, 
                        variant = v7 and "Emphasis" or "Standard", 
                        onActivated = v8.onRsvpChanged
                    };
                end;
            elseif v6 == "Ongoing" or v6 == "ElapsedImminent" then
                return {
                    text = v9.join, 
                    icon = nil, 
                    variant = "Emphasis", 
                    onActivated = v8.onJoinEvent
                };
            else
                return nil;
            end;
        else
            return {
                text = v9.goHome, 
                icon = nil, 
                variant = "Standard", 
                onActivated = v8.onClose
            };
        end;
    end, {
        v5, 
        v6, 
        v8
    });
    local v11 = v2.useMemo(function() --[[ Line: 84 ]]
        -- upvalues: v5 (copy), v6 (copy), v8 (copy)
        if v5.eventStatus ~= "cancelled" and v5.eventStatus ~= "moderated" and v6 ~= "Elapsed" then
            return {
                text = nil, 
                icon = "icons/actions/shareArrowOff", 
                variant = "Standard", 
                onActivated = v8.onShare
            };
        else
            return nil;
        end;
    end, {
        v5, 
        v6, 
        v8
    });
    return (v2.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: v10 (copy), v11 (copy)
        return {
            button = v10, 
            icon = v11
        };
    end, {
        v10, 
        v11
    }));
end;