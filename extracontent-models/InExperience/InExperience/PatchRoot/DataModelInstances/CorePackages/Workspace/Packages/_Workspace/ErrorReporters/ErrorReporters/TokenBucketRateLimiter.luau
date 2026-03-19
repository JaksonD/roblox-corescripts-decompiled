local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = setmetatable({}, v0);
    v2.maxTokens = v1.maxTokens;
    v2.refillRate = v1.refillRate;
    v2.refillIntervalSeconds = v1.refillIntervalSeconds;
    v2.currentTokens = v1.initialTokens or v1.maxTokens;
    v2.lastRefillTime = tick();
    if v2.currentTokens > v2.maxTokens then
        v2.currentTokens = v2.maxTokens;
    end;
    return v2;
end;
v0.refill = function(v3) --[[ Line: 58 ]] --[[ Name: refill ]]
    local v4 = tick();
    local v5 = v4 - v3.lastRefillTime;
    if v5 < 0 then
        v3.lastRefillTime = v4;
        return;
    else
        local v6 = math.floor(v5 / v3.refillIntervalSeconds);
        if v6 > 0 then
            local v7 = v6 * v3.refillRate;
            v3.currentTokens = math.min(v3.maxTokens, v3.currentTokens + v7);
            v3.lastRefillTime = v3.lastRefillTime + v6 * v3.refillIntervalSeconds;
        end;
        return;
    end;
end;
v0.consume = function(v8, v9) --[[ Line: 93 ]] --[[ Name: consume ]]
    local v10 = v9 or 1;
    v8:refill();
    if v10 <= v8.currentTokens then
        v8.currentTokens = v8.currentTokens - v10;
        return true;
    else
        return false;
    end;
end;
v0.getAvailableTokens = function(v11) --[[ Line: 113 ]] --[[ Name: getAvailableTokens ]]
    v11:refill();
    return v11.currentTokens;
end;
v0.getMaxTokens = function(v12) --[[ Line: 123 ]] --[[ Name: getMaxTokens ]]
    return v12.maxTokens;
end;
v0.hasTokensAvailable = function(v13) --[[ Line: 132 ]] --[[ Name: hasTokensAvailable ]]
    return v13:getAvailableTokens() > 0;
end;
v0.reset = function(v14) --[[ Line: 139 ]] --[[ Name: reset ]]
    v14.currentTokens = v14.maxTokens;
    v14.lastRefillTime = tick();
end;
v0.toString = function(v15) --[[ Line: 149 ]] --[[ Name: toString ]]
    v15:refill();
    return string.format("TokenBucketRateLimiter{tokens=%d/%d, refillRate=%d/%ds, nextRefillIn=%.1fs}", v15.currentTokens, v15.maxTokens, v15.refillRate, v15.refillIntervalSeconds, v15.refillIntervalSeconds - (tick() - v15.lastRefillTime) % v15.refillIntervalSeconds);
end;
return v0;