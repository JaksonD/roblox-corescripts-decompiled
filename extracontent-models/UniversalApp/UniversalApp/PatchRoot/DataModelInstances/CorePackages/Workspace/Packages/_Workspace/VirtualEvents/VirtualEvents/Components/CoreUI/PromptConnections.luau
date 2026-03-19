local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_useRoactService_0 = require(l_Parent_1.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_1.RoactServiceTags).RoactNetworking;
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.ReactUtils);
local l_useContext_0 = v4.useContext;
local l_useEventConnection_0 = v5.useEventConnection;
local v8 = require(l_Parent_0.Common.fetchEventDetails);
local v9 = require(l_Parent_0.Components.CoreUI.ServiceOverrideContext);
return function(v10) --[[ Line: 26 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useContext_0 (copy), v9 (copy), v4 (copy), v8 (copy), l_useEventConnection_0 (copy)
    local v11 = l_useRoactService_0(l_RoactNetworking_0);
    local l_socialService_0 = l_useContext_0(v9).socialService;
    local v16 = v4.useCallback(function(v13) --[[ Line: 33 ]]
        -- upvalues: v8 (ref), v11 (copy), v10 (copy), l_socialService_0 (copy)
        v8(v11, v13):andThen(function(v14) --[[ Line: 34 ]]
            -- upvalues: v10 (ref), v13 (copy)
            v10.openRsvpPrompt(v13, v14);
        end, function(v15) --[[ Line: 36 ]]
            -- upvalues: l_socialService_0 (ref), v13 (copy), v10 (ref)
            l_socialService_0:PromptRsvpToEventCompleted(v13, false, Enum.RsvpStatus.None);
            warn("Error fetching event details: ", v15);
            v10.closePrompt();
        end);
    end, {
        v10.openRsvpPrompt, 
        v11
    });
    l_useEventConnection_0(l_socialService_0.ShowPromptRsvpToEvent, v16);
    return v4.createElement(v4.Fragment, {}, {});
end;