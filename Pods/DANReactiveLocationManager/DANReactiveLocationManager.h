//
//  DANReactiveLocationManager.h
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

#import <Foundation/Foundation.h>

@class RACSignal;
@class CLLocation;

#define kRLMErrorDomain @"reactiveLocationManager.danie.lt"

@interface DANReactiveLocationManager : NSObject

@property (nonatomic, assign) CGFloat   maximumRangeInMeters; // Defaults to 100
@property (nonatomic, assign) NSInteger maximumLocationAgeInSeconds; // Defaults to 10
@property (nonatomic, assign) BOOL      shouldUseDetailedLocationUpdates; // Defaults to NO

- (void)beginMonitoringLocation;
- (void)stopMonitoringLocation;

@property (nonatomic, strong, readonly) RACSignal *locationDidUpdateSignal;

@end
