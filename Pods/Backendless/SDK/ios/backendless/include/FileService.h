//
//  FileService.h
//  backendlessAPI
/*
 * *********************************************************************************************************************
 *
 *  BACKENDLESS.COM CONFIDENTIAL
 *
 *  ********************************************************************************************************************
 *
 *  Copyright 2018 BACKENDLESS.COM. All Rights Reserved.
 *
 *  NOTICE: All information contained herein is, and remains the property of Backendless.com and its suppliers,
 *  if any. The intellectual and technical concepts contained herein are proprietary to Backendless.com and its
 *  suppliers and may be covered by U.S. and Foreign Patents, patents in process, and are protected by trade secret
 *  or copyright law. Dissemination of this information or reproduction of this material is strictly forbidden
 *  unless prior written permission is obtained from Backendless.com.
 *
 *  ********************************************************************************************************************
 */

#import <Foundation/Foundation.h>
#import "FilePermission.h"
@class BackendlessFile, Fault, NSArray, BEFileInfo;

@interface FileService : NSObject

@property (strong, nonatomic, readonly) FilePermission *permissions;

// sync methods with fault return (as exception)
-(NSNumber *)remove:(NSString *)fileURL;
-(void)removeDirectory:(NSString *)path;
-(NSNumber *)removeDirectory:(NSString *)path pattern:(NSString *)pattern recursive:(BOOL)recursive;
-(BackendlessFile *)saveFile:(NSString *)path fileName:(NSString *)fileName content:(NSData *)content DEPRECATED_MSG_ATTRIBUTE("This method is deprecated, it will be removed in a future release. Please use the uploadFile method instead");
-(BackendlessFile *)saveFile:(NSString *)path fileName:(NSString *)fileName content:(NSData *)content overwriteIfExist:(BOOL)overwrite DEPRECATED_MSG_ATTRIBUTE("This method is deprecated, it will be removed in a future release. Please use the uploadFile method instead");
-(BackendlessFile *)saveFile:(NSString *)filePathName content:(NSData *)content DEPRECATED_MSG_ATTRIBUTE("This method is deprecated, it will be removed in a future release. Please use the uploadFile method instead");
-(BackendlessFile *)saveFile:(NSString *)filePathName content:(NSData *)content overwriteIfExist:(BOOL)overwrite DEPRECATED_MSG_ATTRIBUTE("This method is deprecated, it will be removed in a future release. Please use the uploadFile method instead");
-(BackendlessFile *)uploadFile:(NSString *)filePathName content:(NSData *)content;
-(BackendlessFile *)uploadFile:(NSString *)filePathName content:(NSData *)content overwriteIfExist:(BOOL)overwrite;
-(NSString *)renameFile:(NSString *)oldPathName newName:(NSString *)newName;
-(NSString *)copyFile:(NSString *)sourcePathName target:(NSString *)targetPathName;
-(NSString *)moveFile:(NSString *)sourcePathName target:(NSString *)targetPathName;
-(NSArray<BEFileInfo *> *)listing:(NSString *)path pattern:(NSString *)pattern recursive:(BOOL)recursive;
-(NSArray<BEFileInfo *> *)listing:(NSString *)path pattern:(NSString *)pattern recursive:(BOOL)recursive pagesize:(int)pagesize offset:(int)offset;
-(BOOL)exists:(NSString *)path;
-(NSNumber *)getFileCount:(NSString *)path pattern:(NSString *)pattern recursive:(BOOL)recursive countDirectories:(BOOL)countDirectories;
-(NSNumber *)getFileCount:(NSString *)path pattern:(NSString *)pattern recursive:(BOOL)recursive;
-(NSNumber *)getFileCount:(NSString *)path pattern:(NSString *)pattern;
-(NSNumber *)getFileCount:(NSString *)path;

// async methods with block-based callbacks
-(void)remove:(NSString *)fileURL response:(void(^)(NSNumber *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)removeDirectory:(NSString *)path response:(void(^)(void))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)removeDirectory:(NSString *)path pattern:(NSString *)pattern recursive:(BOOL)recursive response:(void (^)(NSNumber *))responseBlock error:(void (^)(Fault *))errorBlock;
-(void)saveFile:(NSString *)path fileName:(NSString *)fileName content:(NSData *)content response:(void(^)(BackendlessFile *))responseBlock error:(void(^)(Fault *))errorBlock DEPRECATED_MSG_ATTRIBUTE("This method is deprecated, it will be removed in a future release. Please use the uploadFile method instead");
-(void)saveFile:(NSString *)path fileName:(NSString *)fileName content:(NSData *)content overwriteIfExist:(BOOL)overwrite response:(void(^)(BackendlessFile *))responseBlock error:(void(^)(Fault *))errorBlock DEPRECATED_MSG_ATTRIBUTE("This method is deprecated, it will be removed in a future release. Please use the uploadFile method instead");
-(void)saveFile:(NSString *)filePathName content:(NSData *)content response:(void(^)(BackendlessFile *))responseBlock error:(void(^)(Fault *))errorBlock DEPRECATED_MSG_ATTRIBUTE("This method is deprecated, it will be removed in a future release. Please use the uploadFile method instead");
-(void)saveFile:(NSString *)filePathName content:(NSData *)content overwriteIfExist:(BOOL)overwrite response:(void(^)(BackendlessFile *))responseBlock error:(void(^)(Fault *))errorBlock DEPRECATED_MSG_ATTRIBUTE("This method is deprecated, it will be removed in a future release. Please use the uploadFile method instead");
-(void)uploadFile:(NSString *)filePathName content:(NSData *)content response:(void(^)(BackendlessFile *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)uploadFile:(NSString *)filePathName content:(NSData *)content overwriteIfExist:(BOOL)overwrite response:(void(^)(BackendlessFile *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)renameFile:(NSString *)oldPathName newName:(NSString *)newName response:(void(^)(NSString *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)copyFile:(NSString *)sourcePathName target:(NSString *)targetPathName response:(void(^)(NSString *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)moveFile:(NSString *)sourcePathName target:(NSString *)targetPathName response:(void(^)(NSString *))responseBlock error:(void(^)(Fault *))errorBlock;   
-(void)listing:(NSString *)path pattern:(NSString *)pattern recursive:(BOOL)recursive response:(void(^)(NSArray<BEFileInfo *> *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)listing:(NSString *)path pattern:(NSString *)pattern recursive:(BOOL)recursive pagesize:(int)pagesize offset:(int)offset response:(void(^)(NSArray<BEFileInfo *> *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)exists:(NSString *)path response:(void(^)(BOOL))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)getFileCount:(NSString *)path pattern:(NSString *)pattern recursive:(BOOL)recursive countDirectories:(BOOL)countDirectories response:(void(^)(NSNumber *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)getFileCount:(NSString *)path pattern:(NSString *)pattern recursive:(BOOL)recursive response:(void(^)(NSNumber *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)getFileCount:(NSString *)path pattern:(NSString *)pattern response:(void(^)(NSNumber *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)getFileCount:(NSString *)path response:(void(^)(NSNumber *))responseBlock error:(void(^)(Fault *))errorBlock;

@end
