//
//  StorageFile.m
//  PersistenceLayer
//
//  Created by centrin on 16/2/21.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "StorageFile.h"

@implementation CYKJStorageFile


/**
 创建文件夹
 */
+ (BOOL)createDirectoryAtPath:(NSString*)dirPath
{
    NSFileManager* fm = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL flag = [fm fileExistsAtPath:dirPath isDirectory:&isDir];
    NSError* error =nil;
    if (!(isDir && flag))
    {
        flag = NO;
        NSURL* url = [NSURL fileURLWithPath:dirPath];
        flag = [fm createDirectoryAtURL:url withIntermediateDirectories:YES attributes:nil error:&error];
    }
    return flag;
}

/**
 删除文件夹
 */
+ (void)removeDirectoryAtPath:(NSString *)dirPath
{
    NSFileManager * fm = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL flag = [fm fileExistsAtPath:dirPath isDirectory:&isDir];
    NSError * error = nil;
    if (isDir && flag)
    {
        NSURL * url = [NSURL fileURLWithPath:dirPath];
        [fm removeItemAtURL:url error:&error];
    }
}

/**
 删除指定文件夹及其子文件夹下指定的文件
 */
+ (void)removeFileInDirectory:(NSString *)directory fileName:(NSString *)fileName
{
    NSFileManager * fm = [NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL flag = [fm fileExistsAtPath:directory isDirectory:&isDirectory];
    if(flag && isDirectory){
        [CYKJStorageFile recursiveForFindFile:fm directory:directory fileName:fileName];
    }
}

/**
 递归查找文件方法
 */
+ (void)recursiveForFindFile:(NSFileManager *)fm directory:(NSString *)directory fileName:(NSString *)fileName
{
    //获取目录下所有内容
    NSArray * array = [fm contentsOfDirectoryAtPath:directory error:NULL];
    for (NSString * string in array) {
        //子目录或者文件
        NSString * newDir = [directory stringByAppendingPathComponent:string];
        
        BOOL isDirectory;
        BOOL flag = [fm fileExistsAtPath:newDir isDirectory:&isDirectory];
        
        if(flag && isDirectory){
            [CYKJStorageFile recursiveForFindFile:fm directory:newDir fileName:fileName];
        }else if(flag && !isDirectory){
            //当是文件时，判断是否是要删除的文件
            if([string isEqualToString:fileName]){
                [fm removeItemAtPath:newDir error:NULL];
            }
        }
    }
}


/**
 *  保存离线数据
 *
 *  @param module     保存模块或者存储文件名称
 *  @param dataString 需保存的数据内容
 *  @param userId     用户标识
 */
+ (void)writeOffLineDataWithModule:(NSString*)module dataStr:(NSString *)dataString AndUserId:(NSString *)userId
{
    NSLog(@"%s,%d", __FUNCTION__, __LINE__);
    
    NSMutableString * filePath = [NSMutableString stringWithCapacity:100];
    [filePath appendString:NSHomeDirectory()];
    [filePath appendString:@"/Documents/products/"];
    if (userId)
    {
        [filePath appendString:userId];
        [filePath appendString:@"/"];
    }
    
    NSString* txtName = [NSString stringWithFormat:@"%@.txt", module];
    if (![CYKJStorageFile createDirectoryAtPath:filePath])
    {
        NSLog(@"writeOffLineDataWithModule：%@ create directory error", txtName);
        return;
    }
    [filePath appendString:txtName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath] )
    {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
    NSData * data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    [data writeToFile:filePath atomically:YES];
}

/**
 *  读取离线缓存
 *
 *  @param module 模块或者文件名称
 *  @param userId 用户标识
 *
 *  @return 离线数据
 */
+ (NSString *)readOffLineDataWithModule:(NSString*)module userId:(NSString *)userId
{
    NSLog(@"%s,%d", __FUNCTION__, __LINE__);
    
    NSMutableString * filePath = [NSMutableString stringWithCapacity:100];
    [filePath appendString:NSHomeDirectory()];
    [filePath appendString:@"/Documents/products/"];
    if(userId){
        [filePath appendString:userId];
        [filePath appendString:@"/"];
    }
    [filePath appendString:[NSString stringWithFormat:@"%@.txt", module]];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        NSData * tmpData = [NSData dataWithContentsOfFile:filePath];
        NSString * result = [[NSString alloc] initWithData:tmpData encoding:NSUTF8StringEncoding];
        return result;
    }
    return nil;
}

@end
