//
//  DANReactiveLocationManager.m
//
//  Created by Daniel Tomlinson on 08/04/2014.
//
//  Copyright (c) 2014 WeAreBase.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "DANReactiveLocationManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <CoreLocation/CoreLocation.h>
#import "CLLocation+RLMAdditions.h"

@interface DANReactiveLocationManager () <CLLocationManagerDelegate>
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) RACReplaySubject  *recentLocationSubject;
@property (nonatomic, retain) NSTimer           *updateTimer;

typedef NS_ENUM(NSInteger, DANReactiveLocationManagerMonitoringState)
{
    DANReactiveLocationManagerMonitoringStateConstant = 0,
    DANReactiveLocationManagerMonitoringStateSignificantChange,
    DANReactiveLocationManagerMonitoringStateStoppedByError,
    DANReactiveLocationManagerMonitoringStateNotMonitoring
};

@property (nonatomic, assign) DANReactiveLocationManagerMonitoringState monitoringState;
@end

@implementation DANReactiveLocationManager

#pragma mark - Init Methods

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate        = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        _locationManager = locationManager;
        
        _monitoringState                  = DANReactiveLocationManagerMonitoringStateNotMonitoring;
        _maximumRangeInMeters             = 100;
        _maximumLocationAgeInSeconds      = 10;
        _shouldUseDetailedLocationUpdates = NO;
        
        _recentLocationSubject = [RACReplaySubject subject];
        
        __weak typeof(self) weakSelf = self;
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
                             {
                                 __strong typeof (weakSelf) strongSelf = weakSelf;
                                 [strongSelf.recentLocationSubject subscribe:subscriber];
                                 
                                 return [RACDisposable disposableWithBlock:^{
                                     
                                 }];
                             }];
        
        _locationDidUpdateSignal = signal;
    }
    
    return self;
}

- (void)setShouldUseDetailedLocationUpdates:(BOOL)detailedLocationUpdates
{
    _shouldUseDetailedLocationUpdates = detailedLocationUpdates;
    
    if (self.monitoringState == DANReactiveLocationManagerMonitoringStateConstant ||
        self.monitoringState == DANReactiveLocationManagerMonitoringStateSignificantChange)
    {
        [self beginMonitoringLocation];
    }
}

#pragma mark - Dealloc

- (void)dealloc
{
    _locationManager = nil;
    _recentLocationSubject = nil;
    _locationDidUpdateSignal = nil;
}

#pragma mark - Public Methods

- (void)beginMonitoringLocation
{
    if (self.shouldUseDetailedLocationUpdates)
    {
        [self beginDetailedUpdates];
    }
    else
    {
        [self beginSignificantUpdates];
    }
}

- (void)stopMonitoringLocation
{
    [self stopAllUpdates];
}

#pragma mark - CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    if ([newLocation isOutsideRange:self.maximumRangeInMeters] || [newLocation isOlderThanAge:self.maximumLocationAgeInSeconds])
    {
        return;
    }

    [self.recentLocationSubject sendNext:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    self.monitoringState = DANReactiveLocationManagerMonitoringStateStoppedByError;
    
    [self.recentLocationSubject sendError:error];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorized)
    {
        [self beginMonitoringLocation];
    }
    else
    {
        [self.recentLocationSubject sendError:[NSError errorWithDomain:kRLMErrorDomain code:0 userInfo:nil]];
        [self stopAllUpdates];
        self.monitoringState = DANReactiveLocationManagerMonitoringStateStoppedByError;
    }
}

#pragma mark - Private methods

- (void)beginDetailedUpdates
{
    [self.locationManager stopMonitoringSignificantLocationChanges];
    [self.locationManager startUpdatingLocation];
    
    self.monitoringState = DANReactiveLocationManagerMonitoringStateConstant;
}

- (void)beginSignificantUpdates
{
    [self.locationManager stopUpdatingLocation];
    [self.locationManager startMonitoringSignificantLocationChanges];
    
    self.monitoringState = DANReactiveLocationManagerMonitoringStateSignificantChange;
}

- (void)stopAllUpdates
{
    [self.locationManager stopUpdatingLocation];
    [self.locationManager stopMonitoringSignificantLocationChanges];
    
    self.monitoringState = DANReactiveLocationManagerMonitoringStateNotMonitoring;
}
@end
