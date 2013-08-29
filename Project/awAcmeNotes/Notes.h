//
//  Notes.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/25/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notes : NSObject

+(NSMutableDictionary *)getAllNotes;
+(void)setCurrentKey:(NSString *)key;
+(NSString *)getCurrentKey;
+(void)setNoteForCurrentKey:(NSString *)note;
+(void)setNote:(NSString *)note forKey:(NSString *)key;
+(void)saveNotes;
+(void)removeObjectForKey:(NSString *)key;
+(void)didReceiveCloudData:(NSDictionary *)d;

+(void)dataUpdatedFromCloud:(NSNotification *)notification;

@end
