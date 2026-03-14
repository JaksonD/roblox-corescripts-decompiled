local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_Parent_0.Navigation);
local v5 = require(l_Parent_0.RobloxAppNavigation);
local v6 = require(l_Parent_0.RobloxAppHooks);
local v7 = require(l_Parent_0.Promise);
local v8 = require(script.Parent.PurchaseExperienceModal);
local v9 = require(l_script_FirstAncestor_0.Networking.PurchaseProductById);
local v10 = require(l_script_FirstAncestor_0.Common.Constants);
local v11 = require(l_script_FirstAncestor_0.Analytics.initializeSocialExperienceJoinAnalytics);
local v12 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_RODUX_KEY_0 = v10.RODUX_KEY;
local l_useNavigation_0 = v4.useNavigation;
local l_useNavigationProps_0 = v5.useNavigationProps;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useScreenSize_0 = v6.useScreenSize;
local v19 = require(l_script_FirstAncestor_0.Analytics.PurchaseExperienceStatus);
return function() --[[ Line: 38 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useNavigationProps_0 (copy), l_useScreenSize_0 (copy), v2 (copy), v11 (copy), l_useSelector_0 (copy), l_RODUX_KEY_0 (copy), v12 (copy), v19 (copy), v9 (copy), v10 (copy), v7 (copy), v8 (copy)
    local v20 = l_useNavigation_0();
    local v21 = l_useDispatch_0();
    local v24 = l_useNavigationProps_0(function(v22, v23) --[[ Line: 41 ]]
        return {
            universeId = v22, 
            userId = v23.userId, 
            openGameDetailsPeekView = v23.openGameDetailsPeekView, 
            analyticProps = v23.analyticProps
        };
    end);
    local v25 = l_useScreenSize_0();
    local v26 = v2.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v11 (ref), v24 (copy)
        return v11(v24.analyticProps);
    end, {
        v24.analyticProps
    });
    local v28 = l_useSelector_0(function(v27) --[[ Line: 56 ]]
        -- upvalues: l_RODUX_KEY_0 (ref), v24 (copy)
        return v27[l_RODUX_KEY_0].Games.productInfoByGameId[v24.universeId];
    end);
    local v30 = l_useSelector_0(function(v29) --[[ Line: 59 ]]
        -- upvalues: l_RODUX_KEY_0 (ref), v24 (copy)
        return v29[l_RODUX_KEY_0].Games.byGameId[v24.universeId];
    end);
    local function _() --[[ Line: 63 ]]
        -- upvalues: v26 (copy), v12 (ref), v19 (ref), v24 (copy)
        v26.fireAnalyticsEvent(v12.PurchaseExperienceAttempt, {
            status = v19.Success, 
            universeId = v24.universeId, 
            profileUserId = v24.userId
        });
    end;
    local _ = function(_) --[[ Line: 72 ]]
        -- upvalues: v26 (copy), v12 (ref), v19 (ref), v24 (copy)
        v26.fireAnalyticsEvent(v12.PurchaseExperienceAttempt, {
            status = v19.PurchaseError, 
            universeId = v24.universeId, 
            profileUserId = v24.userId
        });
    end;
    local _ = function(_) --[[ Line: 81 ]]
        -- upvalues: v26 (copy), v12 (ref), v19 (ref), v24 (copy)
        v26.fireAnalyticsEvent(v12.PurchaseExperienceAttempt, {
            status = v19.NetworkError, 
            universeId = v24.universeId, 
            profileUserId = v24.userId
        });
    end;
    local v36 = v2.useCallback(function() --[[ Line: 90 ]]
        -- upvalues: v20 (copy)
        v20.pop();
    end, {
        v20
    });
    local v37 = v2.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: v26 (copy), v12 (ref), v24 (copy), v36 (copy)
        v26.fireAnalyticsEvent(v12.CancelPurchaseExperience, {
            universeId = v24.universeId, 
            profileUserId = v24.userId
        });
        v36();
    end, {
        v36, 
        v26, 
        v24.universeId
    });
    local v43 = v2.useCallback(function() --[[ Line: 103 ]]
        -- upvalues: v26 (copy), v12 (ref), v24 (copy), v21 (copy), v9 (ref), v28 (copy), v10 (ref), v7 (ref), v36 (copy), v19 (ref)
        v26.fireAnalyticsEvent(v12.PurchaseExperience, {
            universeId = v24.universeId, 
            profileUserId = v24.userId
        });
        local function _() --[[ Line: 109 ]]
            -- upvalues: v21 (ref), v9 (ref), v28 (ref), v10 (ref)
            return v21(v9.API(v28.productId, {
                expectedCurrency = v10.RobuxCurrency, 
                expectedPrice = v28.price, 
                expectedSellerId = v28.sellerId
            }));
        end;
        v21(v9.API(v28.productId, {
            expectedCurrency = v10.RobuxCurrency, 
            expectedPrice = v28.price, 
            expectedSellerId = v28.sellerId
        })):andThen(function(v39) --[[ Line: 118 ]]
            -- upvalues: v7 (ref)
            local l_responseBody_0 = v39.responseBody;
            return type(l_responseBody_0) == "table" and l_responseBody_0 or v7.reject();
        end):andThen(function(v41) --[[ Line: 122 ]]
            -- upvalues: v36 (ref), v26 (ref), v12 (ref), v19 (ref), v24 (ref)
            v36();
            if v41.purchased then
                v26.fireAnalyticsEvent(v12.PurchaseExperienceAttempt, {
                    status = v19.Success, 
                    universeId = v24.universeId, 
                    profileUserId = v24.userId
                });
                return;
            else
                v26.fireAnalyticsEvent(v12.PurchaseExperienceAttempt, {
                    status = v19.PurchaseError, 
                    universeId = v24.universeId, 
                    profileUserId = v24.userId
                });
                return;
            end;
        end):catch(function(_) --[[ Line: 131 ]]
            -- upvalues: v36 (ref), v26 (ref), v12 (ref), v19 (ref), v24 (ref)
            v36();
            v26.fireAnalyticsEvent(v12.PurchaseExperienceAttempt, {
                status = v19.NetworkError, 
                universeId = v24.universeId, 
                profileUserId = v24.userId
            });
        end);
    end, {
        v21, 
        v28.productId, 
        v28.price, 
        v28.sellerId, 
        v36
    });
    return v2.createElement(v8, {
        cancelPurchase = v37, 
        experienceName = v30.name, 
        price = v28.price, 
        purchaseExperience = v43, 
        screenSize = v25
    });
end;