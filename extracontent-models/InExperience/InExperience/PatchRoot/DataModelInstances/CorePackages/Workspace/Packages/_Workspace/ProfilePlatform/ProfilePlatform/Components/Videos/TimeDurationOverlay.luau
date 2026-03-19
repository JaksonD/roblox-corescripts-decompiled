local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local function v8(v5) --[[ Line: 13 ]] --[[ Name: formatTime ]]
    local v6 = math.floor(v5 / 60);
    local v7 = math.floor(v5 % 60);
    return string.format("%02d:%02d", v6, v7);
end;
return function(v9) --[[ Line: 19 ]] --[[ Name: TimeDurationOverlay ]]
    -- upvalues: v1 (copy), v8 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v10 = v1.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v8 (ref), v9 (copy)
        return v8(v9.timeLength);
    end, {
        v9.timeLength
    });
    return v1.createElement(l_View_0, {
        tag = "position-bottom-right anchor-bottom-right padding-bottom-medium padding-right-medium auto-xy", 
        ZIndex = 20
    }, {
        v1.createElement(l_View_0, {
            tag = "bg-over-media-100 radius-small size-1000-500", 
            ZIndex = 21
        }, {
            DurationText = v1.createElement(l_Text_0, {
                tag = "text-label-small anchor-center-center position-center-center color-content-emphasis", 
                Text = v10
            })
        })
    });
end;