local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Util.Base64);
local v6 = require(l_Modules_0.LuaApp.Util.ChallengeError);
local v7 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v8 = require(l_Modules_0.LuaApp.Enum.Challenge.GenericType);
local v9 = require(l_Modules_0.LuaApp.Enum.Challenge.ErrorKind);
local v10 = require(l_Modules_0.LuaApp.Enum.Challenge.DeniedReason);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeDisableForceWebViewVisible);
local v12 = require(l_Modules_0.LuaApp.Promise);
local v13 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderChallenge);
local v14 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderNativeChallenge);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableNativeToWebviewMiddleware);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableBypassNavigationLockHybridWebview);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagChallengeInterceptorResolveOriginalNetworkImpl);
shouldForceWebViewVisibleForChallengeType = function(v18) --[[ Line: 34 ]] --[[ Name: shouldForceWebViewVisibleForChallengeType ]]
    -- upvalues: v8 (copy)
    local v19 = v8.fromRawValue(v18);
    local v20 = false;
    if v19 ~= nil then
        v20 = false;
        if v19 ~= v8.Captcha then
            v20 = false;
            if v19 ~= v8.ProofOfWork then
                v20 = false;
                if v19 ~= v8.DeviceIntegrity then
                    v20 = false;
                    if v19 ~= v8.PrivateAccessToken then
                        v20 = v19 ~= v8.Biometric;
                    end;
                end;
            end;
        end;
    end;
    return v20;
end;
shouldRenderNativeChallenge = function(v21) --[[ Line: 46 ]] --[[ Name: shouldRenderNativeChallenge ]]
    -- upvalues: l_HttpService_0 (copy)
    local v22 = l_HttpService_0:JSONDecode(v21);
    local v23 = false;
    if v22 ~= nil then
        v23 = false;
        if v22.sharedParameters ~= nil then
            v23 = v22.sharedParameters.renderNativeChallenge == true;
        end;
    end;
    return v23;
end;
renderChallengeWithHeaders = function(v24, v25, v26, v27, v28) --[[ Line: 54 ]] --[[ Name: renderChallengeWithHeaders ]]
    -- upvalues: v12 (copy), v8 (copy), v5 (copy), l_HttpService_0 (copy), v10 (copy), v6 (copy), v9 (copy), l_Logging_0 (copy), v14 (copy), v17 (copy), v15 (copy), v13 (copy), v7 (copy), v11 (copy), v16 (copy)
    return function(v29) --[[ Line: 55 ]]
        -- upvalues: v28 (copy), v12 (ref), v8 (ref), v5 (ref), l_HttpService_0 (ref), v10 (ref), v6 (ref), v9 (ref), l_Logging_0 (ref), v14 (ref), v27 (ref), v17 (ref), v24 (copy), v25 (copy), v26 (copy), v15 (ref), v13 (ref), v7 (ref), v11 (ref), v16 (ref)
        if v28 == nil then
            return v12.resolve();
        elseif type(v28.Headers) == "table" and v28.Headers["rblx-challenge-type"] and v28.Headers["rblx-challenge-metadata"] and v28.Headers["rblx-challenge-id"] then
            local v30 = v8.fromRawValue(v28.Headers["rblx-challenge-type"]);
            local v31 = v5.Decode(v28.Headers["rblx-challenge-metadata"]);
            local v32 = l_HttpService_0:JSONDecode(v31);
            if v30 == v8.Denied and v32 and v32.reason == v10.toRawValue(v10.RateLimited) and v32.rateLimited and v32.rateLimited.retryTime then
                return v12.reject(v6:new(v9.RateLimited, v32.rateLimited));
            elseif shouldRenderNativeChallenge(v31) then
                l_Logging_0.warn("Rendering native challenge.");
                return v12.new(function(v33, v34) --[[ Line: 89 ]]
                    -- upvalues: v29 (copy), v14 (ref), v28 (ref), v30 (copy), v31 (copy), v27 (ref), v17 (ref), v24 (ref), v25 (ref), v26 (ref), v6 (ref), v9 (ref), v15 (ref), l_Logging_0 (ref), v13 (ref), v7 (ref), v5 (ref), l_HttpService_0 (ref), v8 (ref), v11 (ref), v16 (ref)
                    v29:dispatch(v14({
                        challengeId = v28.Headers["rblx-challenge-id"], 
                        challengeType = v30, 
                        challengeMetadata = v31, 
                        onSessionCompleted = function() --[[ Line: 94 ]] --[[ Name: onSessionCompleted ]]
                            -- upvalues: v27 (ref), v28 (ref), v17 (ref), v33 (copy), v24 (ref), v25 (ref), v26 (ref), v34 (copy), v6 (ref), v9 (ref), v30 (ref)
                            v27 = if type(v27) == "table" then v27 else {};
                            v27.headers = if type(v27.headers) == "table" then v27.headers else {};
                            v27.headers["rblx-challenge-id"] = v28.Headers["rblx-challenge-id"];
                            v27.headers["rblx-challenge-type"] = v28.Headers["rblx-challenge-type"];
                            v27.headers["rblx-challenge-metadata"] = v28.Headers["rblx-challenge-metadata"];
                            if v17() then
                                v33(v24(v25, v26, v27));
                                return;
                            else
                                local v36, _ = v24(v25, v26, v27):andThen(nil, function(_) --[[ Line: 107 ]]
                                    -- upvalues: v34 (ref), v6 (ref), v9 (ref), v30 (ref)
                                    v34(v6:new(v9.Invalidated, {
                                        challengeType = v30
                                    }));
                                end);
                                v33(v36);
                                return;
                            end;
                        end, 
                        onSessionFailed = function() --[[ Line: 112 ]] --[[ Name: onSessionFailed ]]
                            -- upvalues: v34 (copy), v6 (ref), v9 (ref), v30 (ref)
                            v34(v6:new(v9.Invalidated, {
                                challengeType = v30
                            }));
                        end, 
                        onSessionAbandoned = function() --[[ Line: 115 ]] --[[ Name: onSessionAbandoned ]]
                            -- upvalues: v34 (copy), v6 (ref), v9 (ref), v30 (ref)
                            v34(v6:new(v9.Abandoned, {
                                challengeType = v30
                            }));
                        end, 
                        onWebViewChallengeIssued = v15() and function(v38, v39) --[[ Line: 119 ]]
                            -- upvalues: l_Logging_0 (ref), v29 (ref), v13 (ref), v7 (ref), v28 (ref), v5 (ref), v27 (ref), l_HttpService_0 (ref), v17 (ref), v33 (copy), v24 (ref), v25 (ref), v26 (ref), v34 (copy), v6 (ref), v9 (ref), v30 (ref), v8 (ref), v11 (ref), v16 (ref)
                            l_Logging_0.warn("Rendering generic web challenge.");
                            v29:dispatch(v13({
                                challengeType = v7.Generic, 
                                challengeParameters = {
                                    genericChallengeId = v28.Headers["rblx-challenge-id"], 
                                    genericChallengeType = v38, 
                                    genericChallengeMetadata = v5.EncodeUrl(v39), 
                                    onChallengeCompleted = function(_) --[[ Line: 127 ]] --[[ Name: onChallengeCompleted ]]
                                        -- upvalues: v27 (ref), v28 (ref), v38 (copy), v5 (ref), l_HttpService_0 (ref), v39 (copy), v17 (ref), v33 (ref), v24 (ref), v25 (ref), v26 (ref), v34 (ref), v6 (ref), v9 (ref), v30 (ref)
                                        v27 = if type(v27) == "table" then v27 else {};
                                        v27.headers = if type(v27.headers) == "table" then v27.headers else {};
                                        v27.headers["rblx-challenge-id"] = v28.Headers["rblx-challenge-id"];
                                        v27.headers["rblx-challenge-type"] = v38;
                                        v27.headers["rblx-challenge-metadata"] = v5.Encode(l_HttpService_0:JSONEncode(v39));
                                        if v17() then
                                            v33(v24(v25, v26, v27));
                                            return;
                                        else
                                            local v42, _ = v24(v25, v26, v27):andThen(nil, function(_) --[[ Line: 144 ]]
                                                -- upvalues: v34 (ref), v6 (ref), v9 (ref), v30 (ref)
                                                v34(v6:new(v9.Invalidated, {
                                                    challengeType = v30
                                                }));
                                            end);
                                            v33(v42);
                                            return;
                                        end;
                                    end, 
                                    onChallengeInvalidated = function(v44) --[[ Line: 155 ]] --[[ Name: onChallengeInvalidated ]]
                                        -- upvalues: v8 (ref), v34 (ref), v6 (ref), v9 (ref), v38 (copy)
                                        if v44 and v44.challengeType then
                                            v44.challengeType = v8.fromRawValue((tostring(v44.challengeType)));
                                            v34(v6:new(v9.Invalidated, v44));
                                            return;
                                        else
                                            local v45 = {
                                                challengeType = v8.fromRawValue(v38)
                                            };
                                            v34(v6:new(v9.Invalidated, v45));
                                            return;
                                        end;
                                    end
                                }, 
                                onChallengeAbandoned = function() --[[ Line: 168 ]] --[[ Name: onChallengeAbandoned ]]
                                    -- upvalues: v34 (ref), v6 (ref), v9 (ref), v8 (ref), v38 (copy)
                                    v34(v6:new(v9.Abandoned, {
                                        challengeType = v8.fromRawValue(v38)
                                    }));
                                end, 
                                onChallengeLoadFailed = function() --[[ Line: 173 ]] --[[ Name: onChallengeLoadFailed ]]
                                    -- upvalues: l_Logging_0 (ref), v34 (ref), v6 (ref), v9 (ref), v8 (ref), v38 (copy)
                                    l_Logging_0.warn("Load generic challenge failed.");
                                    v34(v6:new(v9.LoadFailed, {
                                        challengeType = v8.fromRawValue(v38)
                                    }));
                                end, 
                                forceWebViewVisible = not v11() or shouldForceWebViewVisibleForChallengeType(v38)
                            }, false, v16()));
                        end or nil
                    }));
                end);
            else
                l_Logging_0.warn("Rendering generic challenge.");
                return v12.new(function(v46, v47) --[[ Line: 189 ]]
                    -- upvalues: v29 (copy), v13 (ref), v7 (ref), v28 (ref), v5 (ref), v31 (copy), v27 (ref), l_HttpService_0 (ref), v24 (ref), v25 (ref), v26 (ref), v8 (ref), v6 (ref), v9 (ref), l_Logging_0 (ref), v11 (ref)
                    v29:dispatch(v13({
                        challengeType = v7.Generic, 
                        challengeParameters = {
                            genericChallengeId = v28.Headers["rblx-challenge-id"], 
                            genericChallengeType = v28.Headers["rblx-challenge-type"], 
                            genericChallengeMetadata = v5.EncodeUrl(v31), 
                            onChallengeCompleted = function(v48) --[[ Line: 201 ]] --[[ Name: onChallengeCompleted ]]
                                -- upvalues: v27 (ref), v28 (ref), v5 (ref), l_HttpService_0 (ref), v24 (ref), v25 (ref), v26 (ref), v29 (ref), v46 (copy)
                                v27 = if type(v27) == "table" then v27 else {};
                                v27.headers = if type(v27.headers) == "table" then v27.headers else {};
                                v27.headers["rblx-challenge-id"] = v28.Headers["rblx-challenge-id"];
                                v27.headers["rblx-challenge-type"] = v28.Headers["rblx-challenge-type"];
                                v27.headers["rblx-challenge-metadata"] = v5.Encode(l_HttpService_0:JSONEncode(v48.metadata));
                                local v49, _ = v24(v25, v26, v27);
                                local v52 = v49:andThen(nil, function(v51) --[[ Line: 212 ]]
                                    -- upvalues: v29 (ref), v24 (ref), v25 (ref), v26 (ref), v27 (ref)
                                    return v29:dispatch(renderChallengeWithHeaders(v24, v25, v26, v27, v51));
                                end);
                                v46(v52);
                            end, 
                            onChallengeInvalidated = function(v53) --[[ Line: 219 ]] --[[ Name: onChallengeInvalidated ]]
                                -- upvalues: v8 (ref), v47 (copy), v6 (ref), v9 (ref), v28 (ref)
                                if v53 and v53.challengeType then
                                    v53.challengeType = v8.fromRawValue((tostring(v53.challengeType)));
                                    v47(v6:new(v9.Invalidated, v53));
                                    return;
                                else
                                    local v54 = {
                                        challengeType = v8.fromRawValue(v28.Headers["rblx-challenge-type"])
                                    };
                                    v47(v6:new(v9.Invalidated, v54));
                                    return;
                                end;
                            end
                        }, 
                        onChallengeAbandoned = function() --[[ Line: 231 ]] --[[ Name: onChallengeAbandoned ]]
                            -- upvalues: v47 (copy), v6 (ref), v9 (ref), v8 (ref), v28 (ref)
                            v47(v6:new(v9.Abandoned, {
                                challengeType = v8.fromRawValue(v28.Headers["rblx-challenge-type"])
                            }));
                        end, 
                        onChallengeLoadFailed = function() --[[ Line: 239 ]] --[[ Name: onChallengeLoadFailed ]]
                            -- upvalues: l_Logging_0 (ref), v47 (copy), v6 (ref), v9 (ref), v8 (ref), v28 (ref)
                            l_Logging_0.warn("Load generic challenge failed.");
                            v47(v6:new(v9.LoadFailed, {
                                challengeType = v8.fromRawValue(v28.Headers["rblx-challenge-type"])
                            }));
                        end, 
                        forceWebViewVisible = not v11() or shouldForceWebViewVisibleForChallengeType(v28.Headers["rblx-challenge-type"])
                    }, false));
                end);
            end;
        else
            return v12.reject(v28);
        end;
    end;
end;
return renderChallengeWithHeaders;