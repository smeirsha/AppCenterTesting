#import "AppCenterDelegateObjC.h"

@import AppCenter;
@import AppCenterAnalytics;
@import AppCenterCrashes;
@import AppCenterDistribute;
@import AppCenterPush;

/**
 * AppCenterDelegate implementation in Objective C.
 */
@implementation AppCenterDelegateObjC

#pragma mark - MSAppCenter section.
- (BOOL) isAppCenterEnabled{
  return [MSAppCenter isEnabled];
}
- (void) setAppCenterEnabled:(BOOL)isEnabled{
  return [MSAppCenter setEnabled:isEnabled];
}
- (NSString *) installId{
  return [[MSAppCenter installId] UUIDString];
}
- (NSString *) appSecret{
  // TODO: Uncomment when appSecret is moved from internal to public
  // return [[MSAppCenter sharedInstance] appSecret];
  return @"Internal";
}
- (NSString *) logUrl{
  // TODO: Uncomment when logUrl is moved from internal to public
  // return [[MSAppCenter sharedInstance] logUrl];
  return @"Internal";
}
- (NSString *) sdkVersion{
  return [MSAppCenter sdkVersion];
}
- (BOOL) isDebuggerAttached{
  return [MSAppCenter isDebuggerAttached];
}
- (void) setCustomProperties:(MSCustomProperties *)customProperties {
  [MSAppCenter setCustomProperties:customProperties];
}

#pragma mark - Modules section.
- (BOOL) isAnalyticsEnabled{
  return [MSAnalytics isEnabled];
}
- (BOOL) isCrashesEnabled{
  return [MSCrashes isEnabled];
}
- (BOOL) isDistributeEnabled{
  return [MSDistribute isEnabled];
}
- (BOOL) isPushEnabled{
  return [MSPush isEnabled];
}
- (void) setAnalyticsEnabled:(BOOL)isEnabled{
  return [MSAnalytics setEnabled:isEnabled];
}
- (void) setCrashesEnabled:(BOOL)isEnabled{
  return [MSCrashes setEnabled:isEnabled];
}
- (void) setDistributeEnabled:(BOOL)isEnabled{
  return [MSDistribute setEnabled:isEnabled];
}
- (void) setPushEnabled:(BOOL)isEnabled{
  return [MSPush setEnabled:isEnabled];
}

#pragma mark - MSAnalytics section.
- (void) trackEvent:(NSString *) eventName{
  [MSAnalytics trackEvent:eventName];
}
- (void) trackEvent:(NSString *)eventName withProperties:(NSDictionary<NSString *, NSString *> *)properties{
  [MSAnalytics trackEvent:eventName withProperties:properties];
}
- (void) trackPage:(NSString *) pageName{
  // TODO: Uncomment when trackPage is moved from internal to public module
  // [MSAnalytics trackPage:pageName];
}
- (void) trackPage:(NSString *)pageName withProperties:(NSDictionary<NSString *, NSString *> *)properties{
  // TODO: Uncomment when trackPage is moved from internal to public module
  // [MSAnalytics trackPage:pageName withProperties:properties];
}

#pragma mark - MSCrashes section.
- (BOOL) hasCrashedInLastSession{
  return [MSCrashes hasCrashedInLastSession];
}
- (void) generateTestCrash{
  return [MSCrashes generateTestCrash];
}

#pragma mark - MSDistribute section.

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
- (void) showConfirmationAlert{
  MSReleaseDetails *releaseDetails = [MSReleaseDetails new];
  releaseDetails.version = @"10";
  releaseDetails.shortVersion = @"1.0";
  if ([MSDistribute respondsToSelector:@selector(sharedInstance)]) {
    id distributeInstance = [MSDistribute performSelector:@selector(sharedInstance)];
    if ([distributeInstance respondsToSelector:@selector(showConfirmationAlert:)]) {
      [distributeInstance performSelector:@selector(showConfirmationAlert:) withObject:releaseDetails];
    }
  }
}
#pragma clang diagnostic pop

- (void) showDistributeDisabledAlert{
  if ([MSDistribute respondsToSelector:@selector(sharedInstance)]) {
    id distributeInstance = [MSDistribute performSelector:@selector(sharedInstance)];
    if ([distributeInstance respondsToSelector:@selector(showDistributeDisabledAlert)]) {
      [distributeInstance performSelector:@selector(showDistributeDisabledAlert)];
    }
  }
}

- (void) showCustomConfirmationAlert{
  MSReleaseDetails *releaseDetails = [MSReleaseDetails new];
  releaseDetails.version = @"10";
  releaseDetails.shortVersion = @"1.0";
  if ([MSDistribute respondsToSelector:@selector(sharedInstance)]) {
    id distributeInstance = [MSDistribute performSelector:@selector(sharedInstance)];
    [[distributeInstance delegate] distribute:distributeInstance releaseAvailableWithDetails:releaseDetails];
  }
}

#pragma mark - Last crash report section.
- (NSString *) lastCrashReportIncidentIdentifier{
  return [[MSCrashes lastSessionCrashReport] incidentIdentifier];
}
- (NSString *) lastCrashReportReporterKey{
  return [[MSCrashes lastSessionCrashReport] reporterKey];
}
- (NSString *) lastCrashReportSignal{
  return [[MSCrashes lastSessionCrashReport] signal];
}
- (NSString *) lastCrashReportExceptionName{
  return [[MSCrashes lastSessionCrashReport] exceptionName];
}
- (NSString *) lastCrashReportExceptionReason{
  return [[MSCrashes lastSessionCrashReport] exceptionReason];
}
- (NSString *) lastCrashReportAppStartTimeDescription{
  return [[[MSCrashes lastSessionCrashReport] appStartTime] description];
}
- (NSString *) lastCrashReportAppErrorTimeDescription{
  return [[[MSCrashes lastSessionCrashReport] appErrorTime] description];
}
- (NSUInteger) lastCrashReportAppProcessIdentifier{
  return [[MSCrashes lastSessionCrashReport] appProcessIdentifier];
}
- (BOOL) lastCrashReportIsAppKill{
  return [[MSCrashes lastSessionCrashReport] isAppKill];
}
- (NSString *) lastCrashReportDeviceModel{
  return [[[MSCrashes lastSessionCrashReport] device] model];
}
- (NSString *) lastCrashReportDeviceOemName{
  return [[[MSCrashes lastSessionCrashReport] device] oemName];
}
- (NSString *) lastCrashReportDeviceOsName{
  return [[[MSCrashes lastSessionCrashReport] device] osName];
}
- (NSString *) lastCrashReportDeviceOsVersion{
  return [[[MSCrashes lastSessionCrashReport] device] osVersion];
}
- (NSString *) lastCrashReportDeviceOsBuild{
  return [[[MSCrashes lastSessionCrashReport] device] osBuild];
}
- (NSString *) lastCrashReportDeviceLocale{
  return [[[MSCrashes lastSessionCrashReport] device] locale];
}
- (NSNumber *) lastCrashReportDeviceTimeZoneOffset{
  return [[[MSCrashes lastSessionCrashReport] device] timeZoneOffset];
}
- (NSString *) lastCrashReportDeviceScreenSize{
  return [[[MSCrashes lastSessionCrashReport] device] screenSize];
}
- (NSString *) lastCrashReportDeviceAppVersion{
  return [[[MSCrashes lastSessionCrashReport] device] appVersion];
}
- (NSString *) lastCrashReportDeviceAppBuild{
  return [[[MSCrashes lastSessionCrashReport] device] appBuild];
}
- (NSString *) lastCrashReportDeviceAppNamespace{
  return [[[MSCrashes lastSessionCrashReport] device] appNamespace];
}
- (NSString *) lastCrashReportDeviceCarrierName{
  return [[[MSCrashes lastSessionCrashReport] device] carrierName];
}
- (NSString *) lastCrashReportDeviceCarrierCountry{
  return [[[MSCrashes lastSessionCrashReport] device] carrierCountry];
}

@end
