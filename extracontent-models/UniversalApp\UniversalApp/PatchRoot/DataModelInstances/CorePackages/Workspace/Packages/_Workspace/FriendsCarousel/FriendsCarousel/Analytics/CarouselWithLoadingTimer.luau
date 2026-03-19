local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.RobloxAppHooks);
local v4 = require(l_Parent_0.SocialLuaAnalytics);
local l_useLocalUserId_0 = v3.useLocalUserId;
local l_useLoadingTimers_0 = v4.Analytics.Timing.useLoadingTimers;
local l_RetrievalStatus_0 = v2.App.Loading.Enum.RetrievalStatus;
local v8 = require(script.Parent.AnalyticsSetup);
local v9 = require(script.Parent.EventNames);
local v10 = require(script.Parent.UILoadingEvents);
return function(v11) --[[ Line: 27 ]] --[[ Name: CarouselWithLoadingTimer ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useLoadingTimers_0 (copy), v1 (copy), v8 (copy), v9 (copy), l_RetrievalStatus_0 (copy), v10 (copy)
    local v12 = l_useLocalUserId_0();
    local v13 = l_useLoadingTimers_0({});
    local v14 = v1.useRef({});
    local v15 = v1.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v8 (ref), v12 (copy)
        return v8({
            infoForAllEvents = {
                uid = if v12 then tostring(v12) else nil
            }
        });
    end, {
        v12
    });
    v1.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v13 (copy)
        v13.start("carouselLoadingTime");
    end, {});
    local function v19(v16, v17) --[[ Line: 44 ]]
        -- upvalues: v15 (copy), v9 (ref), l_RetrievalStatus_0 (ref)
        local v18 = (not (v17 and typeof(v17) == "number") or v17 < 0) and 0 or v17;
        v15.fireAnalyticsEvent(v9.FriendsCarouselUILoadingTime, {
            loadingTime = v18, 
            fetch = v16, 
            status = l_RetrievalStatus_0.Done.rawValue()
        });
    end;
    local function v22(v20) --[[ Line: 57 ]]
        -- upvalues: v14 (copy), v10 (ref), v13 (copy), v19 (copy)
        if v14.current[v10.EmptyHint] or v14.current[("%*%*"):format(v10.EmptyHint, v10.ExperimentSuffix)] then
            return;
        elseif not v20 or v14.current[v20] then
            return;
        else
            v14.current[v20] = true;
            local v21 = v13.getTime("carouselLoadingTime");
            v19(v20, v21);
            return;
        end;
    end;
    return v11.renderComponent({
        onSuccessfulRender = v22
    });
end;