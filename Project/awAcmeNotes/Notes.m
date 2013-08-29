//
//  Notes.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/25/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "Notes.h"
#import "Constants.h"
#import "MasterViewController.h"
#import "GTLDrive.h"
#import "GoogleDriveLoginViewController.h"
@implementation Notes

static NSMutableDictionary *allNotes;
static NSString *currentKey;

+(NSMutableDictionary *)getAllNotes
{
    if (allNotes == nil) {
        allNotes = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllNotesKey]];
    }
    return allNotes;
}


+(void)setCurrentKey:(NSString *)key
{
    currentKey = key;
}
+(NSString *)getCurrentKey
{
    return currentKey;
}
+(void)setNoteForCurrentKey:(NSString *)note
{
    [self setNote:note forKey:currentKey];
}
+(void)setNote:(NSString *)note forKey:(NSString *)key
{
    [allNotes setObject:note forKey:key];
}
+(void)saveNotes
{
    [[NSUserDefaults standardUserDefaults] setObject:allNotes forKey:kAllNotesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [[NSUbiquitousKeyValueStore defaultStore] setObject:allNotes forKey:kAllNotesKey];
    [[NSUbiquitousKeyValueStore defaultStore] synchronize];
 
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"GoogleDrive"] != nil)
    {
        for (NSString* key in allNotes) {
            NSString *value = [allNotes objectForKey:key];
            
            BOOL isFileInDrive = NO;
            
            if([[NSUserDefaults standardUserDefaults] objectForKey:key] != nil)
                isFileInDrive = YES;
            
            
            GTLUploadParameters *uploadParameters = nil;
            
            NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
            
            GTLDriveFile *file = [GTLDriveFile object];
            file.title = [NSString stringWithFormat:@"%@.txt", key];
            
            uploadParameters = [GTLUploadParameters uploadParametersWithData:data MIMEType:@"text/plain"];
            
            GTLQueryDrive *query = nil;
            
            if(isFileInDrive)
            {
                query = [GTLQueryDrive queryForFilesUpdateWithObject:file
                                                              fileId:[[NSUserDefaults standardUserDefaults] objectForKey:key]
                                                    uploadParameters:uploadParameters];
            }
            else{
                query = [GTLQueryDrive queryForFilesInsertWithObject:file uploadParameters:uploadParameters];
            }
            
            [[GoogleDriveLoginViewController driveService] executeQuery:query completionHandler:^(GTLServiceTicket *ticket, GTLDriveFile *updatedFile, NSError *error) {
                //
                [[NSUserDefaults standardUserDefaults] setObject:updatedFile.identifier forKey:key];
                if(error != nil)
                {
                    NSLog(@"An error occurred: %@", error);
                }
            }];

            
        }
    }
}
+(void)removeObjectForKey:(NSString *)key
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"GoogleDrive"] != nil)
    {
        GTLQuery *query = [GTLQueryDrive queryForFilesDeleteWithFileId:[[NSUserDefaults standardUserDefaults] objectForKey:key]];
        [[GoogleDriveLoginViewController driveService] executeQuery:query completionHandler:^(GTLServiceTicket *ticket,     GTLDriveFile *updatedFile, NSError *error) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            if(error != nil)
            {
                NSLog(@"An error occurred: %@", error);
            }
        }];
    }
    [allNotes removeObjectForKey:key];
}

+(void)didReceiveCloudData:(NSDictionary *)d
{
    allNotes = [[NSMutableDictionary alloc] initWithDictionary:d];
    [self saveNotes];
    
    [[MasterViewController masterView] reload];

}

+(NSURL *)notesURL
{
    NSURL *url = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
    return [url URLByAppendingPathComponent:kAllNotesKey];
}


+(void)dataUpdatedFromCloud:(NSNotification *)notification
{
    NSDictionary *cloudData = [[NSUbiquitousKeyValueStore defaultStore] dictionaryForKey:kAllNotesKey];
    allNotes = [[NSMutableDictionary alloc] initWithDictionary:cloudData];
    [[MasterViewController masterView] reload];
}



@end
