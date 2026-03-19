local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.Cryo);
local l_useNavigation_0 = v2.useNavigation;
local v7 = require(script.Parent.SquadVoiceChangers);
local v8 = {
    fillListWithExtraVoicePacks = false, 
    enableTestingTheme = false
};
SquadVoiceChangerOverlay = function(v9) --[[ Line: 25 ]] --[[ Name: SquadVoiceChangerOverlay ]]
    -- upvalues: v5 (copy), v8 (copy), l_useNavigation_0 (copy), v3 (copy), v4 (copy), v7 (copy)
    local v10 = v5.Dictionary.join(v8, v9);
    local v11 = l_useNavigation_0();
    local v12 = v3.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v11 (copy)
        if v11 and v11.pop then
            v11.pop();
        end;
    end, {
        v11
    });
    local v13 = v11.getScreenProps("wideMode", false);
    return v3.createElement(v3.Fragment, nil, {
        AbsorbInput = v3.createElement(v4.View, {
            tag = {
                ["size-full anchor-center-center position-center-center"] = true, 
                ["bg-action-subtle"] = not v10.enableTestingTheme, 
                ["bg-action-soft-emphasis"] = v10.enableTestingTheme
            }, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            stateLayer = {
                affordance = v4.Enums.StateLayerAffordance.None
            }, 
            onActivated = v12, 
            ZIndex = 1
        }), 
        OverlayContainer = v3.createElement(v4.View, {
            tag = {
                ["bg-action-subtle no-clip"] = true, 
                ["anchor-center-center position-center-center"] = v13, 
                ["anchor-bottom-center position-bottom-center"] = not v13
            }, 
            Size = if v13 then UDim2.new(0.75, 0, 0.9, 0) else UDim2.new(1, 0, 0.9, 0), 
            BorderSizePixel = 0, 
            Selectable = true, 
            onActivated = function() --[[ Line: 62 ]] --[[ Name: onActivated ]]

            end, 
            ZIndex = 2
        }, {
            SquadVoiceChangers = v3.createElement(v7, {
                closeSquadVoiceChangers = v12, 
                fillListWithExtraVoicePacks = v10.fillListWithExtraVoicePacks, 
                enableTestingTheme = v10.enableTestingTheme
            })
        })
    });
end;
return SquadVoiceChangerOverlay;