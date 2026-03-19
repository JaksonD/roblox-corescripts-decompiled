local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local l_useCallback_0 = v2.useCallback;
local v5 = {
    counterType = "Remaining"
};
local function v10(v6) --[[ Line: 24 ]] --[[ Name: secondsToHHM ]]
    local v7 = math.floor(v6 / 3600);
    local v8 = math.floor(v6 % 3600 / 60);
    local v9 = v6 % 60;
    if v7 > 0 then
        return string.format("%i:%02i:%02i", v7, v8, v9);
    else
        return string.format("%i:%02i", v8, v9);
    end;
end;
return function(v11) --[[ Line: 36 ]] --[[ Name: ProgressCountdown ]]
    -- upvalues: v1 (copy), v5 (copy), l_useCallback_0 (copy), v10 (copy), v2 (copy), v3 (copy)
    local v12 = v1.Dictionary.join(v5, v11);
    local v15 = l_useCallback_0(function(v13) --[[ Line: 39 ]]
        -- upvalues: v12 (copy), v10 (ref)
        if v12.counterType == "Remaining" then
            local v14 = math.floor(v12.timeLength - v13);
            return "-" .. v10(v14);
        else
            return v10((math.ceil(v13)));
        end;
    end, {
        v12.timeLength
    });
    return v2.createElement(v3.Text, {
        tag = {
            ["auto-xy text-label-medium content-muted"] = true, 
            ["align-x-right"] = v12.counterType == "Remaining"
        }, 
        Text = v12.timePosition:map(v15), 
        LayoutOrder = v12.LayoutOrder
    });
end;