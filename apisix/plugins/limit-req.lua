-- ... (existing code)

local function get_limit_conf(plugin_conf)
    -- Include the configuration version in the cache key to ensure immediate invalidation
    local cache_key = plugin_conf.conf_version or "default"
    local conf = lrucache(cache_key, nil, function()
        return plugin_conf
    end)

    -- Eagerly invalidate the cache when the configuration version changes
    if plugin_conf.conf_version and plugin_conf.conf_version ~= cache_key then
        lrucache:invalidate(cache_key)
        conf = plugin_conf
    end

    return conf
end

-- ... (rest of the file)