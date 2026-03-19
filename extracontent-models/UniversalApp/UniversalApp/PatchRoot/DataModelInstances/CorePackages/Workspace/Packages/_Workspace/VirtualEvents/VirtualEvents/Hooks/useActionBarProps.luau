local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
return function(v8, v9, v10, v11) --[[ Line: 59 ]] --[[ Name: useActionBarProps ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), l_ButtonType_0 (copy), l_Images_0 (copy)
    local v12 = l_useLocalization_0({
        notifyMe = "Feature.VirtualEvents.NotifyMe", 
        unfollowEvent = "Feature.VirtualEvents.UnfollowEvent", 
        joinEvent = "Feature.VirtualEvents.JoinEvent", 
        goHome = "Feature.VirtualEvents.GoHome"
    });
    local v13 = v2.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v8 (copy), v9 (copy), l_ButtonType_0 (ref), v12 (copy), l_Images_0 (ref), v10 (copy), v11 (copy)
        if v8.eventStatus ~= "cancelled" and v8.eventStatus ~= "moderated" then
            if v9 == "Upcoming" or v9 == "UpcomingImminent" then
                if v8.userRsvpStatus == "going" then
                    return {
                        props = {
                            buttonType = l_ButtonType_0.Secondary, 
                            text = v12.unfollowEvent, 
                            icon = l_Images_0["icons/actions/favoriteOn"], 
                            onActivated = v10.onRsvpChanged, 
                            buttonRef = v11
                        }
                    };
                else
                    return {
                        props = {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            text = v12.notifyMe, 
                            icon = l_Images_0["icons/actions/favoriteOff"], 
                            onActivated = v10.onRsvpChanged, 
                            buttonRef = v11
                        }
                    };
                end;
            elseif v9 == "Ongoing" or v9 == "ElapsedImminent" then
                return {
                    props = {
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        text = v12.joinEvent, 
                        onActivated = v10.onJoinEvent, 
                        buttonRef = v11
                    }
                };
            else
                return nil;
            end;
        else
            return {
                props = {
                    buttonType = l_ButtonType_0.Secondary, 
                    text = v12.goHome, 
                    onActivated = v10.onClose, 
                    buttonRef = v11
                }
            };
        end;
    end, {
        v8, 
        v9, 
        v10, 
        v11
    });
    local v14 = v2.useMemo(function() --[[ Line: 128 ]]
        -- upvalues: v8 (copy), v9 (copy), l_Images_0 (ref), v10 (copy)
        if v8.eventStatus ~= "cancelled" and v8.eventStatus ~= "moderated" and v9 ~= "Elapsed" then
            return {
                props = {
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    position = UDim2.fromScale(0.5, 0.5), 
                    icon = l_Images_0["icons/actions/share"], 
                    userInteractionEnabled = true, 
                    onActivated = v10.onShare
                }
            };
        else
            return nil;
        end;
    end, {
        v8, 
        v9, 
        v10
    });
    return (v2.useMemo(function() --[[ Line: 148 ]]
        -- upvalues: v13 (copy), v14 (copy)
        return {
            button = v13, 
            icons = {
                v14
            }
        };
    end, {
        v13, 
        v14
    }));
end;