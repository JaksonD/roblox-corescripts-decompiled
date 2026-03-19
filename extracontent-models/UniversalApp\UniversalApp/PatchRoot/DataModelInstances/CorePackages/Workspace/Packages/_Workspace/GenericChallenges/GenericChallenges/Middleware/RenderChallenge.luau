local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local _ = require(l_script_FirstAncestor_0.Types.ChallengeParameters);
local v2 = require(script.Parent.BuildHybridCallback);
local v3 = require(l_script_FirstAncestor_0.Utils.getLocalizedTitle);
local v4 = require(script.Parent.ChallengeWebView);
local v5 = require(script.Parent.ChallengeError);
local v6 = require(script.Parent.InitializeHybridCallback);
local v7 = require(l_script_FirstAncestor_0.Utils.constants);
local v8 = require(script.Parent.Hooks.BuildCredentialsProtocolHook);
local v9 = require(l_script_FirstAncestor_0.Types.ErrorKind);
local v10 = require(l_script_FirstAncestor_0.Utils.completionDataToRawHeaders);
local v11 = game:DefineFastFlag("EnableRejectPromiseOnWebviewClosed", false);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
return function(v14) --[[ Line: 41 ]]
    -- upvalues: v4 (copy), v3 (copy), v11 (copy), v7 (copy), v2 (copy), v8 (copy), v5 (copy), v9 (copy), v10 (copy), v6 (copy)
    if v14.rawResponseHeaders ~= nil then
        assert(v14.retryRequestCallback ~= nil, "Retry request callback must be defined for generic handling");
        assert(v14.resolve ~= nil, "Promise resolution method must be provided for generic handling");
        assert(v14.reject ~= nil, "Promise rejection method must be provided for generic handling");
        local v15 = v4.new({
            title = v3(v14.title), 
            rawResponseHeaders = v14.rawResponseHeaders, 
            modal = v14.renderWebViewInModal
        });
        if v11 then
            local v16 = v14.rawResponseHeaders[v7.challengeTypeHeader];
            local v17 = v14.rawResponseHeaders[v7.challengeIdHeader];
            local v18 = false;
            do
                local l_v18_0 = v18;
                v15:setHybridCallback(v2({
                    Hooks = {
                        v8()
                    }, 
                    OnChallengeLoadFailed = function(_) --[[ Line: 61 ]] --[[ Name: OnChallengeLoadFailed ]]
                        -- upvalues: v14 (copy), v5 (ref), v9 (ref), v16 (copy), v15 (copy)
                        if v14.challengeErrorCallback ~= nil then
                            v14.challengeErrorCallback();
                        end;
                        v14.reject(v5.new(v9.LoadFailed, {
                            challengeType = v16
                        }));
                        v15:close();
                    end, 
                    OnChallengeInvalidated = function(v21) --[[ Line: 70 ]] --[[ Name: OnChallengeInvalidated ]]
                        -- upvalues: v14 (copy), v5 (ref), v9 (ref), v15 (copy)
                        if v14.challengeErrorCallback ~= nil and v21.data ~= nil then
                            v14.challengeErrorCallback(v21.data);
                        end;
                        v14.reject(v5.new(v9.Invalidated, v21.data));
                        v15:close();
                    end, 
                    OnChallengeCompleted = function(v22) --[[ Line: 77 ]] --[[ Name: OnChallengeCompleted ]]
                        -- upvalues: v14 (copy), v10 (ref), v17 (copy), l_v18_0 (ref), v15 (copy)
                        if v22.data ~= nil and v22.data.challengeType ~= nil and v22.data.metadata ~= nil then
                            v14.resolve(v14.retryRequestCallback(v10({
                                challengeId = v17, 
                                challengeType = v22.data.challengeType, 
                                metadata = v22.data.metadata
                            })));
                        end;
                        l_v18_0 = true;
                        v15:close();
                    end
                }));
                v15:setCloseCallback(function() --[[ Line: 91 ]]
                    -- upvalues: l_v18_0 (ref), v14 (copy), v5 (ref), v9 (ref), v16 (copy)
                    if not l_v18_0 then
                        v14.reject(v5.new(v9.Invalidated, {
                            challengeType = v16
                        }));
                    end;
                end);
            end;
        else
            v15:setHybridCallback(v6(v14.rawResponseHeaders[v7.challengeIdHeader], v14.rawResponseHeaders[v7.challengeTypeHeader], v15, v14.retryRequestCallback, v14.challengeErrorCallback, v14.resolve, v14.reject));
        end;
        v15:open();
        return;
    else
        assert(v14.callbacks ~= nil, "Callbacks must be specified in manual challenge mode");
        assert(v14.challengeParameters ~= nil, "Challenge parameters must be specified in manual challenge mode");
        assert(v14.challengeType ~= nil, "Challenge type must be specified in manual challenge mode");
        local v23 = v4.new({
            title = v3(v14.title), 
            challengeType = v14.challengeType, 
            challengeParameters = v14.challengeParameters, 
            modal = v14.renderWebViewInModal
        });
        local v24 = false;
        v23:setHybridCallback(v2({
            Hooks = {
                v8()
            }, 
            OnChallengeLoadFailed = function(v25) --[[ Line: 128 ]] --[[ Name: OnChallengeLoadFailed ]]
                -- upvalues: v14 (copy), v23 (copy)
                v14.callbacks.OnChallengeLoadFailed(v25);
                v23:close();
            end, 
            OnChallengeInvalidated = function(v26) --[[ Line: 132 ]] --[[ Name: OnChallengeInvalidated ]]
                -- upvalues: v14 (copy), v23 (copy)
                v14.callbacks.OnChallengeInvalidated(v26);
                v23:close();
            end, 
            OnChallengeCompleted = function(v27) --[[ Line: 136 ]] --[[ Name: OnChallengeCompleted ]]
                -- upvalues: v24 (ref), v14 (copy), v23 (copy)
                v24 = true;
                v14.callbacks.OnChallengeCompleted(v27);
                v23:close();
            end
        }));
        v23:setCloseCallback(function() --[[ Line: 142 ]]
            -- upvalues: v24 (ref), v14 (copy)
            if not v24 and v14.callbacks.OnChallengeAbandoned ~= nil then
                v14.callbacks.OnChallengeAbandoned();
            end;
        end);
        if v14.onWebViewOpen ~= nil then
            v23:setOpenCallback(v14.onWebViewOpen);
        end;
        v23:open();
        return;
    end;
end;