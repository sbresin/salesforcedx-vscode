// These are stub functions for aura-instrumentation used by LDS. We aren't
// doing anything with these metrics currently so these are all no-op.

// If core webruntime provides an implementation then we could try that.

function perfStart(name, attributes, eventSource) {}

function perfEnd(name, attributes, eventSource) {}

function mark(ns, name, ctx) {}

function markStart(ns, name, ctx) {}

function markEnd(ns, name, ctx) {}

function time() {
    return Date.now();
}

function interaction(target, scope, context, eventSource, eventType) {}

function registerCacheStats(name) {
    return {
        logHits(count) {},
        logMisses(count) {},
        unRegister() {}
    };
}

function error(attributes, eventSource, eventType) {}

function registerPeriodicLogger(name, callback) {}

function removePeriodicLogger(id) {}

function registerPlugin(pluginConfig) {}

function enablePlugin(name) {}

function disablePlugin(name) {}

function counter(metricsKey) {
    return {
        increment(value) {},
        decrement(value) {},
        getValue() {
            return 0;
        },
        reset() {}
    };
}
function gauge(metricsKey) {
    return {
        setValue(value) {},
        getValue() {
            return 0;
        },
        reset() {}
    };
}
function percentileHistogram(metricsKey) {
    return {
        update(value) {},
        getValue() {
            return [];
        },
        reset() {}
    };
}
function timer(metricsKey) {
    return {
        addDuration() {},
        time() {},
        getValue() {
            return [];
        },
        reset() {},
        get() {}
    };
}

// exports must match https://sfdc.co/b837t5
export {
    perfStart,
    perfEnd,
    mark,
    markStart,
    markEnd,
    time,
    interaction,
    registerCacheStats,
    error,
    registerPeriodicLogger,
    removePeriodicLogger,
    registerPlugin,
    enablePlugin,
    disablePlugin,
    counter,
    gauge,
    percentileHistogram,
    timer
};
