local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SocialExperiments);
local v5 = require(l_Parent_0.SquadsCore);
local l_SetSquadPrompt_0 = v5.Actions.SetSquadPrompt;
local l_CloseSquadPrompt_0 = v5.Actions.CloseSquadPrompt;
local l_SquadRootViewType_0 = v5.Enums.SquadRootViewType;
local l_makeSquadContract_0 = v5.SquadExternalContractProvider.makeSquadContract;
local v10 = require(l_script_FirstAncestor_0.App.InExperienceAppChatModal);
local l_SquadCoordinationExperienceJoinExperimentation_0 = v4.SquadCoordinationExperienceJoinExperimentation;
local v12 = require(script.Parent.SquadContract);
return (l_makeSquadContract_0(v2.Dictionary.union(v12, {
    setSquadPrompt = function(v13, v14) --[[ Line: 21 ]]
        -- upvalues: l_SetSquadPrompt_0 (copy)
        v13:dispatch(l_SetSquadPrompt_0(v14));
    end, 
    closeSquadPrompt = l_CloseSquadPrompt_0, 
    useSquadRootView = function() --[[ Line: 25 ]]
        -- upvalues: v3 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), v10 (copy), l_SquadRootViewType_0 (copy)
        local v15, v16 = v3.useState(if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled and v10.default:getVisible() then l_SquadRootViewType_0.InExperienceAppChatModal else l_SquadRootViewType_0.None);
        v3.useEffect(function() --[[ Line: 32 ]]
            -- upvalues: v10 (ref), v16 (copy), l_SquadRootViewType_0 (ref)
            local v18 = v10.default.visibilitySignal.Event:Connect(function(v17) --[[ Line: 33 ]]
                -- upvalues: v16 (ref), l_SquadRootViewType_0 (ref)
                if v17 then
                    v16(l_SquadRootViewType_0.InExperienceAppChatModal);
                    return;
                else
                    v16(l_SquadRootViewType_0.None);
                    return;
                end;
            end);
            return function() --[[ Line: 41 ]]
                -- upvalues: v18 (copy)
                if v18 then
                    v18:Disconnect();
                end;
            end;
        end, {});
        return v15;
    end
})));