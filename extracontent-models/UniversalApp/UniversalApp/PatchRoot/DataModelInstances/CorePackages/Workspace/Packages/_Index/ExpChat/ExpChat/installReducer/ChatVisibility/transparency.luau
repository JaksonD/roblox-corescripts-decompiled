local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.ChatInputBarConfigurationEnabled);
local v7 = require(l_Actions_0.ChatTopBarButtonActivated);
local v8 = require(l_Actions_0.SetCoreGuiEnabledChanged);
local l_ClientAppLoaded_0 = v2.Actions.ClientAppLoaded;
local v10 = require(l_script_FirstAncestor_0.Actions.UserInteraction);
local v11 = require(l_Actions_0.IncomingMessageReceived);
local v12 = {
    textDurationUntilFadeout = 30, 
    backgroundDurationUntilFadeout = 3.5, 
    lastGeneralActivityTimestamp = 0, 
    lastMessageActivityTimestamp = 0, 
    isTextBoxFocused = false
};
local function v15(v13) --[[ Line: 31 ]] --[[ Name: reset ]]
    -- upvalues: l_Dictionary_0 (copy), v12 (copy)
    local v14 = os.clock();
    return l_Dictionary_0.join(v12, {
        isTextBoxFocused = v13.isTextBoxFocused, 
        lastGeneralActivityTimestamp = v14, 
        lastMessageActivityTimestamp = v14
    });
end;
local function v18(v16) --[[ Line: 41 ]] --[[ Name: resetTextOnly ]]
    -- upvalues: l_Dictionary_0 (copy)
    local v17 = os.clock();
    return l_Dictionary_0.join(v16, {
        isTextBoxFocused = v16.isTextBoxFocused, 
        lastMessageActivityTimestamp = v17
    });
end;
return v3.createReducer(v12, {
    [v6.name] = function(v19, v20) --[[ Line: 51 ]]
        -- upvalues: v15 (copy)
        if v20.enabled then
            return v15(v19);
        else
            return v19;
        end;
    end, 
    [v7.name] = function(v21, v22) --[[ Line: 59 ]]
        -- upvalues: v15 (copy)
        if v22.isVisible then
            return v15(v21);
        else
            return v21;
        end;
    end, 
    [v8.name] = function(v23, v24) --[[ Line: 67 ]]
        -- upvalues: v15 (copy)
        if v24.enabled then
            return v15(v23);
        else
            return v23;
        end;
    end, 
    [l_ClientAppLoaded_0.name] = function(v25, _) --[[ Line: 75 ]]
        -- upvalues: v15 (copy)
        return v15(v25);
    end, 
    [v10.name] = function(v27, v28) --[[ Line: 79 ]]
        -- upvalues: l_Dictionary_0 (copy), v12 (copy), v15 (copy)
        if v28.interaction == "focus" then
            local l_join_0 = l_Dictionary_0.join;
            local v30 = os.clock();
            return l_join_0(l_Dictionary_0.join(v12, {
                isTextBoxFocused = v27.isTextBoxFocused, 
                lastGeneralActivityTimestamp = v30, 
                lastMessageActivityTimestamp = v30
            }), {
                isTextBoxFocused = true
            });
        elseif v28.interaction == "unfocus" then
            local l_join_1 = l_Dictionary_0.join;
            local v32 = os.clock();
            return l_join_1(l_Dictionary_0.join(v12, {
                isTextBoxFocused = v27.isTextBoxFocused, 
                lastGeneralActivityTimestamp = v32, 
                lastMessageActivityTimestamp = v32
            }), {
                isTextBoxFocused = false
            });
        else
            return v15(v27);
        end;
    end, 
    [v11.name] = function(v33, _) --[[ Line: 93 ]]
        -- upvalues: v18 (copy)
        return v18(v33);
    end
});