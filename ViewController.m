//
//  ViewController.m
//  PossibleCombinations
//
//  Created by Diego on 9/6/16.
//  Copyright © 2016 Diego. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    stored = [[NSMutableArray alloc] init];
    
    components= [[NSMutableArray alloc] init];
    
    int size = 10;
    for(int i = 1; i<= size; i++){
        [components addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    /*[components addObject:@"1"];
    [components addObject:@"2"];
    [components addObject:@"3"];
    [components addObject:@"4"];*/
    
    NSMutableArray * previus = [[NSMutableArray alloc] init];
    possibles= [self factorial:(int)components.count];
    
    NSLog(@"Pssibles = %d", possibles);
    done = 0;
    
    
    NSDate * before = [NSDate date];
    
    [self printAllPossibleCombinations:components previusDone:previus];
    
    NSDate * after = [NSDate date];
    
    NSTimeInterval secondsBetween = [after timeIntervalSinceDate:before];
    
 
    NSLog(@"Time: %.5f", secondsBetween);
    
    //int possible =
}
-(int)factorial:(int) n{
    
    int acum = n;
    
    for(int i = n-1; i> 0; i--){
        acum = acum * i;
    }
    
    return acum;
}
-(NSString *)getStringFromArray{
    NSString * str = @"";
    for(int i = 0; i<components.count; i++){
        str = [str stringByAppendingString:components[i]];
    }
    return str;
}

-(void)printAllPossibleCombinations:(NSMutableArray *)array
                        previusDone:(NSMutableArray *)prev{
    if(array.count == 1){
        
        done++;
        //NSLog(@"%d", done);
        
        [prev addObject:array[0]];
        
        for(int i = 0; i<prev.count; i++){
            printf(" %s ", [prev[i] UTF8String]);
        }
        
        printf("\n");
        
    }else{
        for(int i = 0; i< array.count;i++){ //For each component as starter
            NSString * thiselement = array[i];
            
            NSMutableArray * remaining = [array mutableCopy];
            [remaining removeObject: thiselement];
            
            NSMutableArray * prevCopy = [prev mutableCopy];
            [prevCopy addObject:thiselement];
            [self printAllPossibleCombinations:remaining previusDone:prevCopy];
        }
    }
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
