local l_Parent_0 = script:FindFirstAncestor("PageLoadTracker").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.Parent.PageTrackerContext);
local _ = require(script.Parent.Parent.createPageTracker);
local l_Signal_0 = require(script.Parent.Parent.Parent.AppCommonLib).Signal;
local l_FFlagLuaAppEnableChatMilestones_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableChatMilestones;
local function v6() --[[ Line: 11 ]] --[[ Name: createNoOpTracker ]]
    -- upvalues: l_Signal_0 (copy)
    return {
        pageName = "", 
        startTime = 0, 
        lastActivityTime = 0, 
        timeoutThread = nil, 
        isActive = false, 
        numLoads = 0, 
        onCompleteSignal = l_Signal_0.new(), 
        sentMilestones = {}, 
        start = function() --[[ Line: 22 ]] --[[ Name: start ]]

        end, 
        logMilestone = function() --[[ Line: 23 ]] --[[ Name: logMilestone ]]

        end, 
        stop = function() --[[ Line: 24 ]] --[[ Name: stop ]]

        end, 
        onComponentAdded = function() --[[ Line: 25 ]] --[[ Name: onComponentAdded ]]

        end, 
        complete = function() --[[ Line: 26 ]] --[[ Name: complete ]]

        end, 
        sendMilestone = function() --[[ Line: 27 ]] --[[ Name: sendMilestone ]]

        end
    };
end;
return function() --[[ Line: 31 ]] --[[ Name: usePageTracker ]]
    -- upvalues: v1 (copy), v2 (copy), l_FFlagLuaAppEnableChatMilestones_0 (copy), v6 (copy)
    local v7 = v1.useContext(v2);
    if v7 == nil then
        if l_FFlagLuaAppEnableChatMilestones_0 then
            return v1.useMemo(function() --[[ Line: 36 ]]
                -- upvalues: v6 (ref)
                return (v6());
            end, {});
        else
            error("usePageTracker must be used within a PageTrackerContext.Provider");
        end;
    end;
    return v7;
end;