

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface UIImage( CCHeatMap )

/**
 Generates a heat map image for the specified rectangle.

 @rect: region frame
 boost: heat boost value
 points: array of NSValue CGPoint objects representing the data points
 weights: array of NSNumber integer objects representing the weight of each
 point
 weightsAdjustmentEnabled: set YES for weight balancing and normalization
 groupingEnabled: set YES for tighter visual grouping of dense areas
 */
+ (UIImage *)heatMapWithRect:(CGRect)rect
                       boost:(float)boost
                      points:(NSArray *)points
                     weights:(NSArray *)weights
    weightsAdjustmentEnabled:(BOOL)weightsAdjustmentEnabled
             groupingEnabled:(BOOL)groupingEnabled;



@end
