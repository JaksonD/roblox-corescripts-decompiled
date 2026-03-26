local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v3 = require(l_Parent_0.Dash);
local _ = require(script.Parent.AbuseSheetFlowTypes);
local function v7(v5, v6) --[[ Line: 31 ]] --[[ Name: getInitialState ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return {
        runId = v5, 
        userId = if l_LocalPlayer_0 then l_LocalPlayer_0.UserId else 0, 
        stack = {
            {
                nodeId = "root", 
                data = {}, 
                context = {}, 
                enterTime = v6
            }
        }, 
        navigationState = "idle", 
        submissionState = "idle", 
        openTime = v6
    };
end;
return {
    getInitialState = v7, 
    getNewRunId = function() --[[ Line: 71 ]] --[[ Name: getNewRunId ]]
        -- upvalues: l_HttpService_0 (copy)
        return l_HttpService_0:GenerateGUID(false);
    end, 
    selectContext = function(v8) --[[ Line: 75 ]] --[[ Name: selectContext ]]
        local v9 = {};
        for _, v11 in v8.stack do
            if v11.context then
                for v12, v13 in v11.context do
                    v9[v12] = v13;
                end;
            end;
        end;
        return v9;
    end, 
    selectFormData = function(v14) --[[ Line: 87 ]] --[[ Name: selectFormData ]]
        local v15 = {};
        for _, v17 in v14.stack do
            if v17.data then
                for v18, v19 in v17.data do
                    v15[v18] = v19;
                end;
            end;
        end;
        return v15;
    end, 
    reducer = function(v20, v21) --[[ Line: 99 ]] --[[ Name: reducer ]]
        -- upvalues: v3 (copy), v7 (copy)
        local v22 = nil;
        if v21.type == "gotoNode" then
            if not v21.payload or not v21.payload.nodeId then
                error((("gotoNode action requires payload.nodeId, got: %*"):format((v3.pretty(v21, {
                    depth = 5
                })))));
            end;
            local v23 = {
                nodeId = v21.payload.nodeId, 
                data = {}, 
                context = {}, 
                enterTime = v21.payload.enterTime
            };
            local v24 = table.clone(v20.stack);
            table.insert(v24, v23);
            return (v3.join(v20, {
                navigationState = "idle", 
                stack = v24
            }));
        elseif v21.type == "goBack" then
            if #v20.stack <= 1 then
                warn("Cannot go back from stack with only one or zero items");
                return v20;
            else
                return (v3.join(v20, {
                    stack = v3.slice(v20.stack, 1, #v20.stack - 1)
                }));
            end;
        elseif v21.type == "updateDataAndNavigateNext" then
            local v25 = v3.last(v20.stack);
            if not v25 then
                error("Stack is empty, cannot update data");
            end;
            local v26 = v3.join(v25, {
                data = v3.join(v25.data, v21.payload.data), 
                context = v3.join(v25.context, v21.payload.context)
            });
            local v27 = v3.slice(v20.stack, 1, #v20.stack - 1);
            table.insert(v27, v26);
            return (v3.join(v20, {
                stack = v27, 
                navigationState = "gotoNext"
            }));
        elseif v21.type == "startedSubmission" then
            return (v3.join(v20, {
                submissionState = "submitting"
            }));
        elseif v21.type == "completedSubmission" then
            return (v3.join(v20, {
                submissionState = "completed"
            }));
        elseif v21.type == "submissionFailed" then
            return (v3.join(v20, {
                submissionState = "failed"
            }));
        elseif v21.type == "reset" then
            return (v7(v21.payload.runId, v21.payload.initialEnterTime));
        else
            error("Unknown action type: " .. tostring(v21.type));
            return v22;
        end;
    end
};