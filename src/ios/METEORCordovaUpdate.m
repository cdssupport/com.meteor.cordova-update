/********* com.meteor.cordova-update Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "METEORCordovaURLProtocol.h"

@interface METEORCordovaUpdate : CDVPlugin {
}

- (void)startServing:(CDVInvokedUrlCommand*)command;
- (void)setLocalPath:(CDVInvokedUrlCommand*)command;


@end

NSString *METEORDocumentRoot;
NSString *METEORCordovajsRoot;

@implementation MeteorCordovaUpdate

- (void)pluginInitialize
{
}

- (void)startServing:(CDVInvokedUrlCommand*)command
{
  METEORDocumentRoot = [command.arguments objectAtIndex:0];
  METEORCorodvajsRoot = [command.arguments objectAtIndex:1];

  [NSURLProtocol registerClass:[METEORCordovaURLProtocol class]];

  [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"meteor.local"] callbackId:command.callbackId];
}

- (void)setLocalPath:(CDVInvokedUrlCommand*)command
{
  METEORDocumentRoot = [command.arguments objectAtIndex:0];
  [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"meteor.local"] callbackId:command.callbackId];
}

@end
