local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Components.ProgressCountdown);
local l_createNextOrder_0 = v3.createNextOrder;
return function(v6) --[[ Line: 22 ]] --[[ Name: AudioPlaybackTimeline ]]
    -- upvalues: l_createNextOrder_0 (copy), v1 (copy), v2 (copy), v4 (copy)
    local v7 = l_createNextOrder_0();
    return v1.createElement(v2.View, {
        tag = "size-full-0 auto-y row flex-between align-y-center gap-large", 
        LayoutOrder = v6.LayoutOrder
    }, {
        TimeElapsed = v1.createElement(v4, {
            timeLength = v6.duration, 
            timePosition = v6.elapsed, 
            counterType = "Elapsed", 
            LayoutOrder = v7()
        }), 
        ProgressBar = v1.createElement(v2.View, {
            tag = "size-full-0 auto-y shrink padding-top-xxsmall", 
            LayoutOrder = v7()
        }, {
            Slider = v1.createElement(v2.Slider, {
                value = v6.elapsed:map(function(v8) --[[ Line: 41 ]]
                    -- upvalues: v6 (copy)
                    if v6.duration > 0 then
                        return v8 / v6.duration;
                    else
                        return 0;
                    end;
                end), 
                onValueChanged = v6.onDragTimeline, 
                onDragStarted = v6.onDragTimelineStart, 
                onDragEnded = v6.onDragTimelineEnd, 
                size = v2.Enums.InputSize.Medium, 
                knobVisibility = v2.Enums.ScrollBarVisibility.Auto, 
                variant = v2.Enums.SliderVariant.Standard
            })
        }), 
        TimeRemaining = v1.createElement(v4, {
            timeLength = v6.duration, 
            timePosition = v6.elapsed, 
            LayoutOrder = v7()
        })
    });
end;