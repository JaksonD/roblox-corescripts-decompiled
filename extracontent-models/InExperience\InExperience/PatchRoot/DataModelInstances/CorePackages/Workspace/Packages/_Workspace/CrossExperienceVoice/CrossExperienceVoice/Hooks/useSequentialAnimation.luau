local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v1.React;
local l_ReactOtter_0 = v1.ReactOtter;
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v5) --[[ Line: 11 ]]
    -- upvalues: l_React_0 (copy), l_ReactOtter_0 (copy)
    local v6 = l_React_0.useRef(nil);
    local v7, v8 = l_ReactOtter_0.useAnimatedBinding(v5, function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy)
        if v6.current then
            v6.current();
            v6.current = nil;
        end;
    end);
    return v7, (l_React_0.useCallback(function(v9, v10) --[[ Line: 20 ]]
        -- upvalues: v6 (copy), v8 (copy), l_ReactOtter_0 (ref)
        local function _(v11, v12) --[[ Line: 21 ]] --[[ Name: animateStep ]]
            -- upvalues: v6 (ref), v8 (ref), l_ReactOtter_0 (ref)
            v6.current = v12;
            v8(l_ReactOtter_0.ease(v11.value, {
                duration = v11.durationInMs / 1000, 
                easingStyle = v11.easingStyle
            }));
        end;
        local function v14(v15, v16, v17) --[[ Line: 29 ]] --[[ Name: animateImpl ]]
            -- upvalues: v14 (copy), v6 (ref), v8 (ref), l_ReactOtter_0 (ref)
            local v18 = v15[v16];
            if v18 ~= nil then
                v6.current = function() --[[ Line: 32 ]]
                    -- upvalues: v17 (copy), v16 (copy), v14 (ref), v15 (copy)
                    if v17 then
                        v17(v16);
                    end;
                    v14(v15, v16 + 1, v17);
                end;
                v8(l_ReactOtter_0.ease(v18.value, {
                    duration = v18.durationInMs / 1000, 
                    easingStyle = v18.easingStyle
                }));
            end;
        end;
        return v14(v9, 1, v10);
    end, {}));
end;