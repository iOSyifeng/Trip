//
//  ASRPlugin.m
//  Runner
//
//  Created by Maple on 2019/11/8.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "ASRPlugin.h"
#import "AsrManager.h"

@interface AsrPlugin ()
@property(nonatomic, strong) AsrManager *asrManager;
@property(nonatomic, strong) FlutterResult result;
@end

@implementation AsrPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"asr_plugin" binaryMessenger:[registrar messenger]];

    AsrPlugin *instance = [AsrPlugin new];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"start" isEqualToString:call.method]) {
        self.result = result;
        [[self _asrManager] start];
    } else if ([@"stop" isEqualToString:call.method]) {
        [[self _asrManager] stop];
    } else if ([@"cancel" isEqualToString:call.method]) {
        [[self _asrManager]  cancel];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (AsrManager *)_asrManager {
    if (!self.asrManager) {
        self.asrManager = [AsrManager initWith:^(NSString *message) {
            if (self.result) {
                self.result(message);
                self.result = nil;
            }
        } failure:^(NSString *message) {
            if (self.result) {
                self.result([FlutterError errorWithCode:@"ASR fail" message:message details:nil]);
                self.result = nil;
            }
        }];
    }
    return self.asrManager;
}

@end
