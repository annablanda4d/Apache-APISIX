-- ... (existing code)

local function invalidate(cache_key)
    -- Remove the cache entry
    local cache = lrucache[cache_key]
    if cache then
        cache = nil
    end
end

-- ... (rest of the file)