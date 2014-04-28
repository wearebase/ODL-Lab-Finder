//
//  CLLocation+RLMAdditions.m
//  NCTX
//
//  Created by Daniel Tomlinson on 09/04/2014.
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

#import "CLLocation+RLMAdditions.h"


@implementation CLLocation (RLMAdditions)

- (BOOL)isOlderThanAge:(NSInteger)ageInSeconds
{
    NSInteger locationTimeIntervalSinceNow = abs([self.timestamp timeIntervalSinceNow]);
    return (locationTimeIntervalSinceNow > ageInSeconds);
}

- (BOOL)isOutsideRange:(NSInteger)rangeInMeters
{
    return (self.horizontalAccuracy > rangeInMeters && self.verticalAccuracy > rangeInMeters);
}

@end

