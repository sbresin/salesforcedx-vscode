import * as instrumentation from '../instrumentation';

describe('instrumentation', () => {
    it('doesnt throw any errors for any method', () => {
        expect(instrumentation.perfStart()).toBeFalsy();
        expect(instrumentation.perfEnd()).toBeFalsy();
        expect(instrumentation.mark()).toBeFalsy();
        expect(instrumentation.markStart()).toBeFalsy();
        expect(instrumentation.markEnd()).toBeFalsy();
        expect(instrumentation.time()).toBeTruthy();
        expect(instrumentation.interaction()).toBeFalsy();
        expect(instrumentation.registerCacheStats()).toBeTruthy();
        expect(instrumentation.error()).toBeFalsy();
        expect(instrumentation.registerPeriodicLogger()).toBeFalsy();
        expect(instrumentation.removePeriodicLogger()).toBeFalsy();
        expect(instrumentation.registerPlugin()).toBeFalsy();
        expect(instrumentation.enablePlugin()).toBeFalsy();
        expect(instrumentation.disablePlugin()).toBeFalsy();
        expect(instrumentation.counter()).toBeTruthy();
        expect(instrumentation.counter().getValue()).toBeFalsy();
        expect(instrumentation.gauge()).toBeTruthy();
        expect(instrumentation.gauge().getValue()).toBeFalsy();
        expect(instrumentation.percentileHistogram()).toBeTruthy();
        expect(instrumentation.percentileHistogram().getValue()).toBeTruthy();
        expect(instrumentation.timer()).toBeTruthy();
        expect(instrumentation.timer().getValue()).toBeTruthy();
    });
});
