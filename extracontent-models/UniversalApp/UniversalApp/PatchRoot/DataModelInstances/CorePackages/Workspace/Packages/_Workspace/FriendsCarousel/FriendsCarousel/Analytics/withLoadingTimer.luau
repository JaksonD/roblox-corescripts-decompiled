local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
return function(v4, v5) --[[ Line: 20 ]]
    -- upvalues: l_Roact_0 (copy), l_llama_0 (copy)
    local v6 = l_Roact_0.PureComponent:extend("LoadingTimer");
    v6.init = function(v7) --[[ Line: 24 ]] --[[ Name: init ]]
        -- upvalues: v5 (copy)
        v7.loadingTime = {
            startTime = nil, 
            endTime = nil, 
            thresholdCanceled = false
        };
        v7.startThresholdTimer = function() --[[ Line: 31 ]]
            -- upvalues: v5 (ref), v7 (copy)
            if not v5.loadingThreshold then
                return;
            else
                delay(v5.loadingThreshold, function() --[[ Line: 36 ]]
                    -- upvalues: v5 (ref), v7 (ref)
                    if v5.onReachingThreshold and not v7.thresholdCanceled and not v7.loadingTime.endTime and v7.loadingTime.startTime then
                        v7.stopTimer(true);
                        v5.onReachingThreshold(v7.getLoadingTime(), v7.props);
                    end;
                end);
                return;
            end;
        end;
        v7.resetTimer = function() --[[ Line: 49 ]]
            -- upvalues: v7 (copy)
            v7.loadingTime = {
                startTime = nil, 
                endTime = nil
            };
        end;
        v7.startTimer = function() --[[ Line: 56 ]]
            -- upvalues: v7 (copy)
            v7.loadingTime.startTime = os.clock();
            v7.startThresholdTimer();
        end;
        v7.stopTimer = function(v8) --[[ Line: 62 ]]
            -- upvalues: v7 (copy), v5 (ref)
            if v7.loadingTime.endTime then
                return;
            else
                v7.loadingTime.endTime = os.clock();
                if v5.onLoaded and not v8 then
                    v5.onLoaded(v7.getLoadingTime(), v7.props);
                end;
                return;
            end;
        end;
        v7.getLoadingTime = function() --[[ Line: 74 ]]
            -- upvalues: v7 (copy)
            if v7.loadingTime.endTime and v7.loadingTime.startTime then
                return v7.loadingTime.endTime - v7.loadingTime.startTime;
            else
                return -1;
            end;
        end;
        v7.cancelThreshold = function() --[[ Line: 82 ]]
            -- upvalues: v7 (copy)
            v7.thresholdCanceled = true;
        end;
    end;
    v6.render = function(v9) --[[ Line: 87 ]] --[[ Name: render ]]
        -- upvalues: l_Roact_0 (ref), v4 (copy), l_llama_0 (ref)
        return l_Roact_0.createElement(v4, l_llama_0.Dictionary.join(v9.props, {
            loadingTimerProps = {
                startTimer = v9.startTimer, 
                stopTimer = v9.stopTimer, 
                resetTimer = v9.resetTimer, 
                getLoadingTime = v9.getLoadingTime, 
                cancelThreshold = v9.cancelThreshold
            }
        }));
    end;
    return v6;
end;