local l_TeleportService_0 = game:GetService("TeleportService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceDetailsPrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Features.InExperienceDetailsPromptContainer);
local l_fireInExperienceDetailsPromptOpenedEvent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.fireInExperienceDetailsPromptOpenedEvent;
local l_FFlagLuaAppIedpOverlayAndNavigationFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix;
return function() --[[ Line: 12 ]] --[[ Name: InExperienceDetailsPromptApp ]]
    -- upvalues: v3 (copy), l_TeleportService_0 (copy), l_fireInExperienceDetailsPromptOpenedEvent_0 (copy), l_FFlagLuaAppIedpOverlayAndNavigationFix_0 (copy), v4 (copy)
    local v7, v8 = v3.useState(nil);
    local v9, v10 = v3.useState(false);
    v3.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: l_TeleportService_0 (ref), v8 (copy), v10 (copy), l_fireInExperienceDetailsPromptOpenedEvent_0 (ref)
        local v12 = l_TeleportService_0.OpenExperienceDetailsPrompt:Connect(function(v11) --[[ Line: 17 ]]
            -- upvalues: v8 (ref), v10 (ref), l_fireInExperienceDetailsPromptOpenedEvent_0 (ref)
            v8((tostring(v11)));
            v10(true);
            l_fireInExperienceDetailsPromptOpenedEvent_0({
                targetUniverseId = tostring(v11)
            });
        end);
        return function() --[[ Line: 24 ]]
            -- upvalues: v12 (copy)
            if v12 then
                v12:Disconnect();
            end;
        end;
    end, {});
    if not v9 or not v7 then
        return nil;
    elseif l_FFlagLuaAppIedpOverlayAndNavigationFix_0 then
        return (v3.createElement(v4, {
            universeId = v7, 
            onClose = function() --[[ Line: 38 ]] --[[ Name: onClose ]]
                -- upvalues: v8 (copy), v10 (copy)
                v8(nil);
                v10(false);
            end
        }));
    else
        return (v3.createElement("ScreenGui", {
            ScreenInsets = Enum.ScreenInsets.None
        }, {
            InExperienceDetailsPrompt = v3.createElement(v4, {
                universeId = v7, 
                onClose = function() --[[ Line: 48 ]] --[[ Name: onClose ]]
                    -- upvalues: v8 (copy), v10 (copy)
                    v8(nil);
                    v10(false);
                end
            })
        }));
    end;
end;